package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.friendlist.RelationshipStatusEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class AvatarMenuView extends AvatarContextInfoButtonView 
    {
        protected static const _Str_10122:uint = 1;
        protected static const _Str_15297:uint = 2;
        protected static const _Str_15024:uint = 4;
        protected static const _Str_14752:uint = 5;
        protected static const _Str_15459:uint = 6;
        protected static const _Str_15427:uint = 7;
        protected static var _Str_14054:uint = _Str_10122;//1

        protected var _data:AvatarInfoData;
        protected var _mode:uint = 1;
        protected var _Str_7982:Boolean;

        public function AvatarMenuView(k:AvatarInfoWidget)
        {
            super(k);
            _Str_3403 = false;
        }

        public static function setup(k:AvatarMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:AvatarInfoData):void
        {
            k._data = _arg_6;
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override public function dispose():void
        {
            if (window)
            {
                window.removeEventListener(WindowMouseEvent.OVER, _Str_2743);
                window.removeEventListener(WindowMouseEvent.OUT, _Str_2743);
            }
            this._data = null;
            super.dispose();
        }

        protected function updateButtons():void
        {
            var _local_4:int;
            var _local_5:AvatarInfoWidgetHandler;
            var _local_6:Boolean;
            var _local_7:String;
            var _local_8:int;
            var _local_9:IRoomObject;
            var _local_10:int;
            if (((!(window)) || (!(this._data))))
            {
                return;
            }
            var k:IItemListWindow = (window.findChildByName("buttons") as IItemListWindow);
            if (!k)
            {
                return;
            }
            k.procedure = this.buttonEventProc;
            k.autoArrangeItems = false;
            var _local_2:int = k.numListItems;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                k.getListItemAt(_local_3).visible = false;
                _local_3++;
            }
            if (this._mode == _Str_10122)
            {
                showButton("moderate", this.moderateMenuHasContent());
                showButton("friend", this._data.canBeAskedForAFriend);
                showButton("ignore", (!(this._data.isIgnored)));
                showButton("unignore", this._data.isIgnored);
                showButton("report", ((this.widget.configuration) && (this.widget.configuration.getBoolean("infostand.report.show"))));
                _local_4 = this._data.petRespectLeft;
                this.widget.localizations.registerParameter("infostand.button.respect", "count", _local_4.toString());
                showButton("respect", (_local_4 > 0));
                _local_5 = this.widget.handler;
                _local_6 = _local_5.container.sessionDataManager.isAccountSafetyLocked();
                showButton("trade", ((this.citizenshipTalentTrackEnabled) || ((!(_local_6)) && (this._data.canTrade))));
                switch (this._data.canTradeReason)
                {
                    case RoomWidgetUserInfoUpdateEvent.TRADE_REASON_SHUTDOWN:
                        _local_7 = "${infostand.button.trade.tooltip.shutdown}";
                        break;
                    case RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_TRADINGROOM:
                        _local_7 = "${infostand.button.trade.tooltip.tradingroom}";
                        break;
                    default:
                        _local_7 = "";
                }
                IInteractiveWindow(IWindowContainer(k.getListItemByName("trade")).getChildByName("button")).toolTipCaption = _local_7;
                showButton("whisper");
                showButton("group");
                if (this.widget.configuration.getBoolean("handitem.give.enabled"))
                {
                    _local_8 = _local_5.container.roomSession.ownUserRoomId;
                    _local_9 = _local_5.container.roomEngine.getRoomObject(_local_5.roomSession.roomId, _local_8, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                    if (_local_9 != null)
                    {
                        _local_10 = _local_9.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                        if (((_local_10 > 0) && (_local_10 < 999999)))
                        {
                            showButton("pass_handitem");
                        }
                    }
                }
                showButton("relationship", ((this.widget.configuration.getBoolean("relationship.status.enabled")) && (this._data.isFriend)));
                showButton("ambassador", this.ambassadorMenuHasContent());
            }
            if (this._mode == _Str_15297)
            {
                showButton("kick", this._data.canBeKicked);
                showButton("ban_with_duration", this._data.canBeBanned);
                showButton("mute", this._data.canBeMuted);
                showButton("give_rights", this.isShowGiveRights());
                showButton("remove_rights", this.isShowRemoveRights());
                showButton("actions");
            }
            if (this._mode == _Str_15024)
            {
                showButton("ban_hour");
                showButton("ban_day");
                showButton("perm_ban");
                showButton("actions");
            }
            if (this._mode == _Str_14752)
            {
                showButton("mute_2min");
                showButton("mute_5min");
                showButton("mute_10min");
                showButton("actions");
            }
            if (this._mode == _Str_15459)
            {
                showButtonGrid("relationship_grid");
                showButton("no_relationship");
                showButton("actions");
            }
            if (this._mode == _Str_15427)
            {
                showButton("ambassador_kick");
                showButton("ambassador_alert");
                showButton("ambassador_mute_60min");
                showButton("ambassador_mute_18hour");
                showButton("actions");
            }
            k.autoArrangeItems = true;
            k.visible = true;
            _Str_14054 = this._mode;
            this._Str_7982 = false;
        }

        private function ambassadorMenuHasContent():Boolean
        {
            return this._data.isAmbassador;
        }

        private function moderateMenuHasContent():Boolean
        {
            return ((((this._data.canBeKicked) || (this._data.canBeBanned)) || (this._data.canBeMuted)) || (this.isShowGiveRights())) || (this.isShowRemoveRights());
        }

        private function isShowGiveRights():Boolean
        {
            return ((this._data.amIOwner) && (this._data.targetRoomControllerLevel < RoomControllerLevel.GUEST));// && (!(this._data.isGuildRoom));
        }

        private function isShowRemoveRights():Boolean
        {
            return ((this._data.amIOwner) && (this._data.targetRoomControllerLevel == RoomControllerLevel.GUEST));// && (!(this._data.isGuildRoom));
        }

        override protected function updateWindow():void
        {
            var _local_1:IItemGridWindow;
            var _local_2:IIterator;
            var _local_3:int;
            var _local_4:int;
            var k:XML;
            var _local_6:IWindowContainer;
            var _local_7:IWindowContainer;
            if ((((!(_widget)) || (!(_widget.assets))) || (!(_widget.windowManager))))
            {
                return;
            }
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (!window)
                {
                    k = (XmlAsset(_widget.assets.getAssetByName("avatar_menu_widget")).content as XML);
                    _window = (_widget.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!window)
                    {
                        return;
                    }
                    window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _buttons = (window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = this.buttonEventProc;
                window.findChildByName("profile_link").procedure = this.buttonEventProc;
                window.findChildByName("name").caption = _Str_2360;
                window.visible = false;
                activeView = window;
                this.updateButtons();
                _Str_11603();
                _local_1 = (window.findChildByName("relationship_grid") as IItemGridWindow);
                _local_2 = _local_1.iterator;
                _local_3 = _local_2.length;
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _local_6 = (_local_2[_local_4] as IWindowContainer);
                    _local_7 = (_local_6.findChildByName("button") as IWindowContainer);
                    _local_7.procedure = this.buttonEventProc;
                    _local_4++;
                }
            }
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_5:String;
            var _local_6:int;
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            var _local_4:RoomWidgetMessage;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "whisper":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_WHISPER_USER;
                            break;
                        case "group":
                            _local_5 = RoomWidgetUserActionMessage.GROUP_WHISPER;
                            break;
                        case "friend":
                            _arg_2.disable();
                            this._data.canBeAskedForAFriend = false;
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_SEND_FRIEND_REQUEST;
                            break;
                        case "respect":
                            this._data.petRespectLeft--;
                            _local_6 = this._data.petRespectLeft;
                            this.widget.localizations.registerParameter("infostand.button.respect", "count", _local_6.toString());
                            showButton("respect", (this._data.petRespectLeft > 0));
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_RESPECT_USER;
                            if (_local_6 > 0)
                            {
                                _local_3 = false;
                            }
                            break;
                        case "ignore":
                            _arg_2.parent.visible = false;
                            window.findChildByName("unignore").visible = true;
                            this._data.isIgnored = true;
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_IGNORE_USER;
                            break;
                        case "unignore":
                            _arg_2.parent.visible = false;
                            window.findChildByName("ignore").visible = true;
                            this._data.isIgnored = false;
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_UNIGNORE_USER;
                            break;
                        case "kick":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_KICK_USER;
                            break;
                        case "ban_hour":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_BAN_USER_HOUR;
                            break;
                        case "ban_day":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_BAN_USER_DAY;
                            break;
                        case "perm_ban":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_BAN_USER_PERM;
                            break;
                        case "mute_2min":
                            _local_5 = RoomWidgetUserActionMessage.MUTE_USER_2MIN;
                            break;
                        case "mute_5min":
                            _local_5 = RoomWidgetUserActionMessage.MUTE_USER_5MIN;
                            break;
                        case "mute_10min":
                            _local_5 = RoomWidgetUserActionMessage.MUTE_USER_10MIN;
                            break;
                        case "ban_with_duration":
                            this._mode = _Str_15024;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "mute":
                            this._mode = _Str_14752;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "give_rights":
                            _arg_2.parent.visible = false;
                            window.findChildByName("remove_rights").visible = true;
                            this._data.myRoomControllerLevel = RoomControllerLevel.GUEST;
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_GIVE_RIGHTS;
                            break;
                        case "remove_rights":
                            _arg_2.parent.visible = false;
                            window.findChildByName("give_rights").visible = true;
                            this._data.myRoomControllerLevel = RoomControllerLevel.NONE;
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_TAKE_RIGHTS;
                            break;
                        case "trade":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_START_TRADING;
                            break;
                        case "moderate":
                            this._mode = _Str_15297;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "report":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_REPORT_CFH_OTHER;
                            break;
                        case "actions":
                            this._mode = _Str_10122;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "relationship":
                            this._mode = _Str_15459;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "pass_handitem":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_PASS_CARRY_ITEM;
                            break;
                        case "relationship_heart":
                            this.setRelationship(RelationshipStatusEnum._Str_9205);
                            break;
                        case "relationship_smile":
                            this.setRelationship(RelationshipStatusEnum._Str_8388);
                            break;
                        case "relationship_bobba":
                            this.setRelationship(RelationshipStatusEnum._Str_8824);
                            break;
                        case "no_relationship":
                            this.setRelationship(RelationshipStatusEnum.NONE);
                            break;
                        case "ambassador":
                            this._mode = _Str_15427;
                            this._Str_7982 = true;
                            _local_3 = false;
                            break;
                        case "ambassador_alert":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_ALERT_USER;
                            break;
                        case "ambassador_kick":
                            _local_5 = RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_KICK_USER;
                            break;
                        case "ambassador_mute_2min":
                            _local_5 = RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_2MIN;
                            break;
                        case "ambassador_mute_10min":
                            _local_5 = RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_10MIN;
                            break;
                        case "ambassador_mute_60min":
                            _local_5 = RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_60MIN;
                            break;
                        case "ambassador_mute_18hour":
                            _local_5 = RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_18HOUR;
                            break;
                    }
                }
                if (_arg_2.name == "profile_link")
                {
                    _local_3 = true;
                    _local_4 = new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, _Str_2306, "avatarContextMenu");
                }
                if (_local_5 != null)
                {
                    _local_4 = new RoomWidgetUserActionMessage(_local_5, _Str_2306);
                    HabboTracking.getInstance().trackEventLog("InfoStand", "click", _local_5);
                }
                if (_local_4 != null)
                {
                    _widget.messageListener.processWidgetMessage(_local_4);
                }
                this.updateButtons();
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    if (_arg_2.name == "button")
                    {
                        switch (_arg_2.parent.name)
                        {
                            case "kick":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.kick.hover");
                                break;
                            case "perm_ban":
                            case "ban_hour":
                            case "ban_day":
                            case "ban_with_duration":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.ban.hover");
                                break;
                            case "mute":
                            case "mute_2min":
                            case "mute_5min":
                            case "mute_10min":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.mute.hover");
                                break;
                            case "unignore":
                            case "ignore":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.ignore.hover");
                                break;
                        }
                    }
                }
                else
                {
                    super.buttonEventProc(k, _arg_2);
                }
            }
            if (_local_3)
            {
                _widget.removeView(this, false);
            }
        }

        private function get widget():AvatarInfoWidget
        {
            return _widget as AvatarInfoWidget;
        }

        private function get citizenshipTalentTrackEnabled():Boolean
        {
            return AvatarInfoWidget(_widget).configuration.getBoolean("talent.track.citizenship.enabled");
        }

        private function setRelationship(k:int):void
        {
            _widget.friendList.setRelationshipStatus(_Str_2306, k);
        }
    }
}
