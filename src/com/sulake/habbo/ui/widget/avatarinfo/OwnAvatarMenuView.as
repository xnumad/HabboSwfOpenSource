package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangePostureMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarExpressionMessage;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;

    public class OwnAvatarMenuView extends AvatarContextInfoButtonView 
    {
        private static const MODE_NORMAL:int = 0;
        private static const MODE_CLUB_DANCES:int = 1;
        private static const MODE_NAME_CHANGE:int = 2;
        private static const MODE_EXPRESSIONS:int = 3;
        private static const MODE_SIGNS:int = 4;
        private static const MODE_CHANGE_LOOKS:int = 5;
        private static var _newIdentityChangeLooksMenuHasBeenShown:Boolean = false;

        private var _data:AvatarInfoData;
        private var _mode:int;

        public function OwnAvatarMenuView(k:AvatarInfoWidget)
        {
            super((k as IContextMenuParentWidget));
            _Str_3403 = false;
        }

        public static function setup(k:OwnAvatarMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:AvatarInfoData):void
        {
            k._data = _arg_6;
            if ((((!(_newIdentityChangeLooksMenuHasBeenShown)) && (k.widget.configuration.getInteger("new.identity", 0) > 0)) && (k.widget.configuration.getBoolean("new.user.reception.enabled"))))
            {
                k._mode = MODE_NORMAL;
                OwnAvatarMenuView._newIdentityChangeLooksMenuHasBeenShown = true;
            }
            else
            {
                if ((((k.widget._Str_4107) && (k.widget._Str_6454)) && (!(k.widget._Str_4878))))
                {
                    k._mode = MODE_CLUB_DANCES;
                }
                else
                {
                    if (((_arg_6.allowNameChange) && (k.widget.useMinimizedOwnAvatarMenu)))
                    {
                        k._mode = MODE_NAME_CHANGE;
                    }
                    else
                    {
                        k._mode = MODE_NORMAL;
                    }
                }
            }
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override public function dispose():void
        {
            this._data = null;
            super.dispose();
        }

        override protected function updateWindow():void
        {
            var _local_1:IItemGridWindow;
            var _local_2:IIterator;
            var _local_3:int;
            var _local_4:int;
            var _local_5:IRegionWindow;
            var k:XML;
            var _local_7:IWindowContainer;
            var _local_8:IWindowContainer;
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
                if (!_window)
                {
                    k = (XmlAsset(_widget.assets.getAssetByName("own_avatar_menu")).content as XML);
                    _window = (_widget.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!window)
                    {
                        return;
                    }
                    _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _buttons = (_window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = this.buttonEventProc;
                _local_1 = (_window.findChildByName("signs_grid") as IItemGridWindow);
                _local_2 = _local_1.iterator;
                _local_3 = _local_2.length;
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _local_7 = (_local_2[_local_4] as IWindowContainer);
                    _local_8 = (_local_7.findChildByName("button") as IWindowContainer);
                    _local_8.procedure = this._Str_23693;
                    _local_4++;
                }
                _local_5 = (window.findChildByName("profile_link") as IRegionWindow);
                if (_local_5)
                {
                    _local_5.procedure = this.buttonEventProc;
                    _local_5.toolTipCaption = this.widget.localizations.getLocalization("infostand.profile.link.tooltip", "Click to view profile");
                    _local_5._Str_3099 = 100;
                }
                _window.findChildByName("name").caption = _Str_2360;
                _window.visible = false;
                activeView = _window;
                this._Str_2771();
            }
        }

        public function _Str_2771():void
        {
            var _local_4:Boolean;
            var _local_5:Boolean;
            if ((((!(_window)) || (!(this._data))) || (!(_buttons))))
            {
                return;
            }
            _buttons.autoArrangeItems = false;
            var k:int = _buttons.numListItems;
            var _local_2:int;
            while (_local_2 < k)
            {
                _buttons.getListItemAt(_local_2).visible = false;
                _local_2++;
            }
            var _local_3:Boolean = this.widget._Str_25831;
            switch (this._mode)
            {
                case MODE_NORMAL:
                    showButton("change_name", this._data.allowNameChange);
                    showButton("decorate", ((this._Str_22241()) && ((this._data.myRoomControllerLevel >= RoomControllerLevel.GUEST) || (this._data.amIOwner))));
                    showButton("change_looks");
                    showButton("dance_menu", ((this.widget._Str_6454) && (!(_local_3))), (!(this.widget._Str_4878)));
                    showButton("dance", (((!(this.widget._Str_6454)) && (!(this.widget._Str_4107))) && (!(_local_3))), (!(this.widget._Str_4878)));
                    showButton("dance_stop", (((!(this.widget._Str_6454)) && (this.widget._Str_4107)) && (!(_local_3))));
                    if (!(_widget.windowManager as Component).getBoolean("memenu.effects.widget.disabled"))
                    {
                        showButton("effects", (!(_local_3)));
                    }
                    showButton("handitem", (((this._data.carryItemType > 0) && (this._data.carryItemType < 999999)) && (this.widget.configuration.getBoolean("handitem.drop.enabled"))));
                    _local_4 = this.widget.configuration.getBoolean("avatar.expressions_menu.enabled");
                    showButton(((_local_4) ? "expressions" : "wave"));
                    _local_5 = this.widget.configuration.getBoolean("avatar.signs.enabled");
                    showButton("signs", _local_5);
                    break;
                case MODE_CLUB_DANCES:
                    showButton("dance_stop", true, this.widget._Str_4107);
                    showButton("dance_1");
                    showButton("dance_2");
                    showButton("dance_3");
                    showButton("dance_4");
                    showButton("back");
                    break;
                case MODE_NAME_CHANGE:
                    showButton("change_name");
                    showButton("more");
                    break;
                case MODE_CHANGE_LOOKS:
                    showButton("change_looks");
                    showButton("more");
                    break;
                case MODE_EXPRESSIONS:
                    showButton("wave", true, (!(this.widget.isSwimming)));
                    showButton("laugh", true, (((!(this.widget._Str_4878)) && (!(this.widget.isSwimming))) && (this.widget.hasVip)), (!(this.widget.hasVip)));
                    showButton("blow", true, (((!(this.widget._Str_4878)) && (!(this.widget.isSwimming))) && (this.widget.hasVip)), (!(this.widget.hasVip)));
                    showButton("idle", true);
                    if ((((this.widget.configuration.getBoolean("avatar.sitting.enabled")) && (!(this.widget.isSwimming))) && (!(_local_3))))
                    {
                        showButton("sit", (this.widget._Str_22586 == AvatarAction.POSTURE_STAND));
                        showButton("stand", this.widget.canStandUp);
                    }
                    showButton("back");
                    break;
                case MODE_SIGNS:
                    showButtonGrid("signs_grid");
                    showButton("back");
                    break;
            }
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
        }

        private function _Str_23693(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:int;
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    _local_4 = "_";
                    _local_5 = ((_arg_2.parent.name) ? _arg_2.parent.name : "");
                    _local_6 = _local_5.substr(0, _local_5.lastIndexOf(_local_4));
                    _local_7 = parseInt(_local_5.substr((_local_5.lastIndexOf(_local_4) + 1)));
                    switch (_local_6)
                    {
                        case "sign":
                            this.widget.sendSignRequest(_local_7);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "sign", null, _local_7);
                            break;
                    }
                }
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                _widget.removeView(this, false);
            }
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:RoomWidgetMessage;
            var _local_5:IWindow;
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_5 = (_arg_2 as IWindowContainer).getChildByName("icon_vip");
                    if (((!(_local_5 == null)) && (_local_5.visible)))
                    {
                        _widget.catalog.openClubCenter();
                        return;
                    }
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "change_name":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_START_NAME_CHANGE);
                            break;
                        case "decorate":
                            if (this._Str_22241())
                            {
                                this.widget.isUserDecorating = true;
                            }
                            break;
                        case "change_looks":
                            this.widget._Str_25121();
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "clothes");
                            break;
                        case "expressions":
                            _local_3 = false;
                            this._Str_6337(MODE_EXPRESSIONS);
                            break;
                        case "sit":
                            _local_4 = new RoomWidgetChangePostureMessage(RoomWidgetChangePostureMessage._Str_2016);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "sit");
                            break;
                        case "stand":
                            _local_4 = new RoomWidgetChangePostureMessage(RoomWidgetChangePostureMessage._Str_1553);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "stand");
                            break;
                        case "wave":
                            _local_4 = new RoomWidgetAvatarExpressionMessage(AvatarExpressionEnum.WAVE);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "wave");
                            break;
                        case "blow":
                            _local_4 = new RoomWidgetAvatarExpressionMessage(AvatarExpressionEnum.BLOW);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "blow");
                            break;
                        case "jump":
                            break;
                        case "laugh":
                            _local_4 = new RoomWidgetAvatarExpressionMessage(AvatarExpressionEnum.LAUGH);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "laugh");
                            break;
                        case "idle":
                            _local_4 = new RoomWidgetAvatarExpressionMessage(AvatarExpressionEnum.IDLE);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "idle");
                            break;
                        case "dance_menu":
                            _local_3 = false;
                            this._Str_6337(MODE_CLUB_DANCES);
                            break;
                        case "dance":
                            _local_4 = new RoomWidgetDanceMessage(1);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "dance_start");
                            break;
                        case "dance_stop":
                            _local_4 = new RoomWidgetDanceMessage(0);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "dance_stop");
                            break;
                        case "dance_1":
                        case "dance_2":
                        case "dance_3":
                        case "dance_4":
                            _local_4 = new RoomWidgetDanceMessage(parseInt(_arg_2.parent.name.charAt((_arg_2.parent.name.length - 1))));
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "dance_start");
                            break;
                        case "effects":
                            _local_4 = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.RWRWM_EFFECTS);
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "effects");
                            break;
                        case "signs":
                            _local_3 = false;
                            this._Str_6337(MODE_SIGNS);
                            break;
                        case "back":
                            _local_3 = false;
                            this._Str_6337(MODE_NORMAL);
                            break;
                        case "more":
                            _local_3 = false;
                            this.widget.useMinimizedOwnAvatarMenu = false;
                            this._Str_6337(MODE_NORMAL);
                            break;
                        case "handitem":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_DROP_CARRY_ITEM, _Str_2306);
                            break;
                    }
                }
                if (_arg_2.name == "profile_link")
                {
                    _local_3 = true;
                    _local_4 = new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, userId, "ownAvatarContextMenu");
                }
                if (_local_4)
                {
                    _widget.messageListener.processWidgetMessage(_local_4);
                }
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (((_local_3) && (!(_disposed))))
            {
                _widget.removeView(this, false);
            }
        }

        private function get widget():AvatarInfoWidget
        {
            return _widget as AvatarInfoWidget;
        }

        private function _Str_6337(k:int):void
        {
            this._mode = k;
            this._Str_2771();
        }

        private function _Str_22241():Boolean
        {
            return this.widget._Str_6454;
        }
    }
}
