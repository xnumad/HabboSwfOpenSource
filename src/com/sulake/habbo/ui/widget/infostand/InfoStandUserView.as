package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomTagSearchMessage;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4838;
    import com.sulake.habbo.friendlist.RelationshipStatusEnum;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangeMottoMessage;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.ui.Keyboard;
    import flash.utils.getTimer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;

    public class InfoStandUserView 
    {
        protected static const _Str_6292:uint = 0xFFFFFF;
        protected static const _Str_6801:uint = 9552639;

        private const _Str_4882:int = 5;
        private const _Str_14702:int = 3;
        private const _Str_17178:int = 0xAAAAAA;
        private const _Str_18971:int = 0xFFFFFF;
        private const _Str_25347:int = 2000;
        private const _Str_14746:int = 50;
        private const _Str_13324:int = 23;
        private const _Str_26389:int = 100;

        protected var _Str_2268:InfoStandWidget;
        protected var _window:IItemListWindow;
        protected var _Str_2373:IItemListWindow;
        protected var _Str_20844:IItemListWindow;
        private var _Str_2341:IBorderWindow;
        private var _Str_3306:TagListRenderer;
        private var _Str_2919:IBorderWindow;
        private var _Str_19966:int;
        protected var _Str_4966:IRegionWindow;

        public function InfoStandUserView(k:InfoStandWidget, _arg_2:String)
        {
            this._Str_2268 = k;
            this.createWindow(_arg_2);
            this._Str_3306 = new TagListRenderer(k, this._Str_25162);
        }

        public function dispose():void
        {
            if (this._Str_4966)
            {
                this._Str_4966.dispose();
                this._Str_4966 = null;
            }
            this._Str_2268 = null;
            this._window.dispose();
            this._window = null;
            this._Str_3306.dispose();
            this._Str_3306 = null;
            this._Str_9682();
        }

        public function get window():IItemListWindow
        {
            return this._window;
        }

        protected function updateWindow():void
        {
            if (((this._Str_2373 == null) || (this._Str_2341 == null)))
            {
                return;
            }
            this._Str_2373.height = this._Str_2373.visibleRegion.height;
            this._Str_2341.height = (this._Str_2373.height + 20);
            this._window.width = this._Str_2341.width;
            this._window.height = this._window.visibleRegion.height;
            this._Str_2268._Str_10301();
        }

        protected function createWindow(k:String):void
        {
            var _local_4:IWindow;
            var _local_7:BitmapDataAsset;
            var _local_8:BitmapData;
            this._window = (this._Str_2268.getXmlWindow("user_view") as IItemListWindow);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._Str_2341 = (this._window.getListItemByName("info_border") as IBorderWindow);
            if (this._Str_2341 != null)
            {
                this._Str_2373 = (this._Str_2341.findChildByName("infostand_element_list") as IItemListWindow);
                this._Str_20844 = (this._Str_2341.findChildByName("relationship_status_container") as IItemListWindow);
                this._Str_20844.visible = this._Str_2268.config.getBoolean("relationship.status.enabled");
                this._Str_2341.findChildByName("heart_randomusername").procedure = this._Str_18506;
                this._Str_2341.findChildByName("smile_randomusername").procedure = this._Str_18506;
                this._Str_2341.findChildByName("bobba_randomusername").procedure = this._Str_18506;
            }
            this._window.name = k;
            var _local_2:IBitmapWrapperWindow = (this._Str_2341.findChildByName("home_icon") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_7 = (this._Str_2268.assets.getAssetByName("icon_home") as BitmapDataAsset);
                _local_8 = (_local_7.content as BitmapData);
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_2.bitmap.copyPixels(_local_8, _local_8.rect, new Point(0, 0));
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            this._Str_2268.mainContainer.addChild(this._window);
            var _local_3:IWindow = this._Str_2341.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            var _local_5:int;
            while (_local_5 < 5)
            {
                _local_4 = this._Str_2341.findChildByName(("badge_" + _local_5));
                if (_local_4 == null)
                {
                }
                else
                {
                    _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_18818);
                    _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_16035);
                }
                _local_5++;
            }
            _local_4 = this._Str_2341.findChildByName("badge_group");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_23155);
                _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_12867);
                _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_23279);
            }
            var _local_6:IWindow = this._Str_2341.findChildByName("avatar_image_profile_link");
            if (_local_6 != null)
            {
                _local_6.procedure = this._Str_21251;
            }
            if (this._Str_2268.handler._Str_7745)
            {
                this._Str_2341.findChildByName("score_spacer").visible = true;
                this._Str_2341.findChildByName("score_value").visible = true;
                this._Str_2341.findChildByName("score_text").visible = true;
            }
        }

        private function _Str_23155(k:WindowMouseEvent):void
        {
            if (this._Str_2268.userData.groupId < 0)
            {
                return;
            }
            var _local_2:* = (this._Str_2268.userData.type == RoomWidgetUpdateInfostandUserEvent.OWN_USER);
            var _local_3:RoomWidgetGetBadgeDetailsMessage = new RoomWidgetGetBadgeDetailsMessage(_local_2, this._Str_2268.userData.groupId);
            this._Str_2268.messageListener.processWidgetMessage(_local_3);
        }

        private function _Str_12867(k:WindowMouseEvent):void
        {
            if (this._Str_2268.userData.groupId < 0)
            {
                return;
            }
            this._Str_13311();
            if (k.window == null)
            {
                return;
            }
            this._Str_2919.findChildByName("name").caption = this._Str_2268.userData.groupName;
            this._Str_2919.findChildByName("description").caption = "${group.badgepopup.body}";
            var _local_2:Rectangle = new Rectangle();
            k.window.getGlobalRectangle(_local_2);
            this._Str_2919.x = (_local_2.left - this._Str_2919.width);
            this._Str_2919.y = (_local_2.top + ((_local_2.height - this._Str_2919.height) / 2));
        }

        private function _Str_23279(k:WindowMouseEvent):void
        {
            this._Str_9682();
        }

        private function _Str_18818(k:WindowMouseEvent):void
        {
            var _local_5:ITextWindow;
            if (k.window == null)
            {
                return;
            }
            var _local_2:int = int(k.window.name.replace("badge_", ""));
            if (_local_2 < 0)
            {
                return;
            }
            var _local_3:Array = this._Str_2268.userData.badges;
            if (_local_3 == null)
            {
                return;
            }
            if (_local_2 >= _local_3.length)
            {
                return;
            }
            var _local_4:String = this._Str_2268.userData.badges[_local_2];
            if (_local_4 == null)
            {
                return;
            }
            this._Str_13311();
            _local_5 = (this._Str_2919.getChildByName("name") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = this._Str_2268.localizations.getBadgeName(_local_4);
            }
            _local_5 = (this._Str_2919.getChildByName("description") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = this._Str_2268.localizations.getBadgeDesc(_local_4);
            }
            var _local_6:Rectangle = new Rectangle();
            k.window.getGlobalRectangle(_local_6);
            this._Str_2919.x = (_local_6.left - this._Str_2919.width);
            this._Str_2919.y = (_local_6.top + ((_local_6.height - this._Str_2919.height) / 2));
        }

        private function _Str_16035(k:WindowMouseEvent):void
        {
            this._Str_9682();
        }

        private function _Str_13311():void
        {
            if (this._Str_2919 != null)
            {
                return;
            }
            var k:XmlAsset = (this._Str_2268.assets.getAssetByName("badge_details") as XmlAsset);
            if (k == null)
            {
                return;
            }
            this._Str_2919 = (this._Str_2268.windowManager.buildFromXML((k.content as XML)) as IBorderWindow);
            if (this._Str_2919 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
        }

        private function _Str_9682():void
        {
            if (this._Str_2919 != null)
            {
                this._Str_2919.dispose();
                this._Str_2919 = null;
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._Str_2268.close();
        }

        public function set name(k:String):void
        {
            if (this._Str_4966 == null)
            {
                this._Str_4966 = (this._Str_2373.getListItemByName("profile_link") as IRegionWindow);
                if (this._Str_4966 == null)
                {
                    return;
                }
                this._Str_4966.procedure = this._Str_21251;
                this._Str_4966.visible = true;
            }
            var _local_2:ITextWindow = (this._Str_4966.findChildByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            _local_2.visible = true;
        }

        public function set realName(k:String):void
        {
            var _local_2:ITextWindow = (this._Str_2373.getListItemByName("realname_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            if (k.length == 0)
            {
                _local_2.text = "";
            }
            else
            {
                this._Str_2268.localizations.registerParameter("infostand.text.realname", "realname", k);
                _local_2.text = this._Str_2268.localizations.getLocalization("infostand.text.realname");
            }
            _local_2.height = (_local_2.textHeight + this._Str_4882);
            _local_2.visible = (k.length > 0);
        }

        public function _Str_7907(k:String):void
        {
            var _local_2:_Str_2483 = (IWidgetWindow(this._Str_2341.findChildByName("avatar_image")).widget as _Str_2483);
            _local_2.figure = k;
        }

        public function _Str_12782(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = (this._Str_2373.getListItemByName("motto_container") as IWindowContainer);
            if (!_local_3)
            {
                return;
            }
            var _local_4:IWindow = _local_3.findChildByName("changemotto.image");
            var _local_5:ITextWindow = (_local_3.findChildByName("motto_text") as ITextWindow);
            var _local_6:IWindowContainer = (this._Str_2373.getListItemByName("motto_spacer") as IWindowContainer);
            if (((_local_5 == null) || (_local_6 == null)))
            {
                return;
            }
            if (k == null)
            {
                k = "";
            }
            if (_arg_2)
            {
                _local_4.visible = true;
                if (k == "")
                {
                    k = this._Str_2268.localizations.getLocalization("infostand.motto.change");
                    _local_5.textColor = this._Str_17178;
                }
                else
                {
                    _local_5.textColor = this._Str_18971;
                }
                _local_5.enable();
            }
            else
            {
                _local_4.visible = false;
                _local_5.textColor = this._Str_18971;
                _local_5.disable();
            }
            if (!this._Str_2268.config.getBoolean("infostand.motto.change.enabled"))
            {
                _local_5.disable();
            }
            _local_5.text = k;
            _local_5.height = Math.min((_local_5.textHeight + this._Str_4882), this._Str_14746);
            _local_5.height = Math.max(_local_5.height, this._Str_13324);
            _local_3.height = (_local_5.height + this._Str_14702);
            if (_arg_2)
            {
                _local_5.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_23735);
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_20920);
            }
            else
            {
                _local_5.removeEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_20920);
            }
            this.updateWindow();
        }

        public function set activityPoints(k:int):void
        {
            if (!this._Str_2268.handler._Str_7745)
            {
                return;
            }
            var _local_2:ITextWindow = (this._Str_2373.getListItemByName("score_value") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
        }

        public function set _Str_3249(k:int):void
        {
            var _local_6:String;
            var _local_2:ITextWindow = (this._Str_2373.getListItemByName("handitem_txt") as ITextWindow);
            var _local_3:IWindowContainer = (this._Str_2373.getListItemByName("handitem_spacer") as IWindowContainer);
            if (((_local_2 == null) || (_local_3 == null)))
            {
                return;
            }
            if (((k > 0) && (k < 999999)))
            {
                _local_6 = this._Str_2268.localizations.getLocalization(("handitem" + k), ("handitem" + k));
                this._Str_2268.localizations.registerParameter("infostand.text.handitem", "item", _local_6);
            }
            _local_2.height = (_local_2.textHeight + this._Str_4882);
            var _local_4:Boolean = _local_2.visible;
            var _local_5:Boolean = ((k > 0) && (k < 999999));
            _local_2.visible = _local_5;
            _local_3.visible = _local_5;
            if (_local_5 != _local_4)
            {
                this._Str_2373.arrangeListItems();
            }
            this.updateWindow();
        }

        public function set xp(k:int):void
        {
            var _local_2:ITextWindow = (this._Str_2373.getListItemByName("xp_text") as ITextWindow);
            var _local_3:IWindowContainer = (this._Str_2373.getListItemByName("xp_spacer") as IWindowContainer);
            if (((_local_2 == null) || (_local_3 == null)))
            {
                return;
            }
            this._Str_2268.localizations.registerParameter("infostand.text.xp", "xp", k.toString());
            _local_2.height = (_local_2.textHeight + this._Str_4882);
            var _local_4:Boolean = _local_2.visible;
            var _local_5:* = (k > 0);
            _local_2.visible = _local_5;
            _local_3.visible = _local_5;
            if (_local_5 != _local_4)
            {
                this._Str_2373.arrangeListItems();
            }
            this.updateWindow();
        }

        public function _Str_17290(k:Array, _arg_2:Array=null):void
        {
            var _local_3:IWindowContainer = (this._Str_2373.getListItemByName("tags_container") as IWindowContainer);
            var _local_4:IWindowContainer = (this._Str_2373.getListItemByName("tags_spacer") as IWindowContainer);
            if (((_local_3 == null) || (_local_4 == null)))
            {
                return;
            }
            if (k.length != 0)
            {
                _local_3.height = this._Str_3306._Str_23731(k, _local_3, _arg_2);
                _local_4.height = 1;
            }
            else
            {
                _local_3.height = 0;
                _local_4.height = 0;
            }
            this.updateWindow();
        }

        public function _Str_5605(k:int, _arg_2:String):void
        {
            var _local_3:_Str_2402 = (IWidgetWindow(this._Str_2341.findChildByName(("badge_" + k))).widget as _Str_2402);
            _local_3.badgeId = _arg_2;
        }

        public function _Str_10630():void
        {
            var _local_2:_Str_2402;
            var k:int;
            while (k < 5)
            {
                _local_2 = (IWidgetWindow(this._Str_2341.findChildByName(("badge_" + k))).widget as _Str_2402);
                _local_2.badgeId = "";
                k++;
            }
        }

        public function _Str_21116():void
        {
            var k:_Str_2402 = (IWidgetWindow(this._Str_2341.findChildByName("badge_group")).widget as _Str_2402);
            k.badgeId = "";
        }

        public function _Str_16673(k:String):void
        {
            var _local_2:_Str_2402 = (IWidgetWindow(this._Str_2341.findChildByName("badge_group")).widget as _Str_2402);
            _local_2.badgeId = k;
        }

        private function _Str_25162(k:WindowMouseEvent):void
        {
            var _local_2:ITextWindow = (k.target as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            this._Str_2268.messageListener.processWidgetMessage(new RoomWidgetRoomTagSearchMessage(_local_2.text));
        }

        public function update(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this._Str_10630();
            this._Str_21116();
            this._Str_16673(k._Str_5235);
            this._Str_17290([]);
            this._Str_11602(k);
        }

        public function _Str_25662(k:Map):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:IWindow;
            var _local_5:_Str_4838;
            var _local_6:String;
            var _local_7:IWindow;
            if (((!(this._Str_2341)) || (!(this._Str_2268))))
            {
                return;
            }
            for each (_local_2 in RelationshipStatusEnum._Str_15184)
            {
                _local_3 = RelationshipStatusEnum._Str_7401(_local_2);
                _local_4 = this._Str_2341.findChildByName(("relationship_" + _local_3));
                _local_5 = k.getValue(_local_2);
                if (_local_5)
                {
                    _local_4.visible = (_local_5.friendCount > 0);
                    _local_6 = (_local_3 + "_randomusername");
                    _local_7 = this._Str_2341.findChildByName(_local_6);
                    if (_local_7)
                    {
                        _local_7.caption = _local_5._Str_20359;
                        _local_7.id = int(_local_5._Str_21077);
                    }
                    this._Str_2341.findChildByName((_local_3 + "_others")).visible = (_local_5.friendCount > 1);
                    this._Str_2268.localizations.registerParameter((("infostand.relstatus." + _local_3) + ".others"), "amount", (_local_5.friendCount - 1).toString());
                }
                else
                {
                    _local_4.visible = false;
                }
            }
        }

        protected function _Str_11602(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this.name = k.name;
            this._Str_12782(k.motto, (k.type == RoomWidgetUpdateInfostandUserEvent.OWN_USER));
            this.activityPoints = k.activityPoints;
            this._Str_3249 = k._Str_3249;
            this.xp = k.xp;
            this._Str_7907(k.figure);
        }

        protected function _Str_23735(k:WindowKeyboardEvent):void
        {
            var _local_5:RoomWidgetChangeMottoMessage;
            var _local_6:int;
            var _local_7:int;
            var _local_2:IWindowContainer = (this._Str_2373.getListItemByName("motto_container") as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            var _local_3:ITextFieldWindow = (_local_2.findChildByName("motto_text") as ITextFieldWindow);
            var _local_4:String = _local_3.text;
            if (k.keyCode == Keyboard.ENTER)
            {
                _local_6 = getTimer();
                if ((((_local_6 - this._Str_19966) > this._Str_25347) && (!(_local_4 == this._Str_2268.localizations.getLocalization("infostand.motto.change")))))
                {
                    _local_7 = this._Str_2268.userData.userId;
                    _local_5 = new RoomWidgetChangeMottoMessage(_local_4);
                    this._Str_2268.messageListener.processWidgetMessage(_local_5);
                    this._Str_19966 = _local_6;
                    _local_3.textColor = this._Str_18971;
                    _local_3.unfocus();
                }
            }
            else
            {
                _local_3.textColor = this._Str_17178;
            }
            _local_3.height = Math.min((_local_3.textHeight + this._Str_4882), this._Str_14746);
            _local_3.height = Math.max(_local_3.height, this._Str_13324);
            _local_2.height = (_local_3.height + this._Str_14702);
        }

        protected function _Str_20920(k:WindowMouseEvent):void
        {
            var _local_2:IWindowContainer = (this._Str_2373.getListItemByName("motto_container") as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            var _local_3:ITextWindow = (_local_2.findChildByName("motto_text") as ITextWindow);
            if (_local_3.text == this._Str_2268.localizations.getLocalization("infostand.motto.change"))
            {
                _local_3.text = "";
            }
            _local_3.textColor = this._Str_17178;
        }

        protected function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetMessage;
            var _local_3:String;
            var _local_4:IWindow = (k.target as IWindow);
            switch (_local_4.name)
            {
                case "home_icon":
                    _local_3 = RoomWidgetUserActionMessage.RWUAM_OPEN_HOME_PAGE;
                    break;
            }
            if (_local_3 != null)
            {
                _local_2 = new RoomWidgetUserActionMessage(_local_3, this._Str_2268.userData.userId);
                HabboTracking.getInstance().trackEventLog("InfoStand", "click", _local_3);
            }
            if (_local_2 != null)
            {
                this._Str_2268.messageListener.processWidgetMessage(_local_2);
            }
            this.updateWindow();
        }

        protected function _Str_21251(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ITextWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_2268.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, this._Str_2268.userData.userId, "infoStand_userView"));
            }
            if (_arg_2.name == "profile_link")
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    _local_3 = (this._Str_4966.findChildByName("name_text") as ITextWindow);
                    _local_3.textColor = _Str_6801;
                }
                if (k.type == WindowMouseEvent.OUT)
                {
                    _local_3 = (this._Str_4966.findChildByName("name_text") as ITextWindow);
                    _local_3.textColor = _Str_6292;
                }
            }
        }

        private function _Str_18506(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (_arg_2 is ITextLinkWindow)))
            {
                this._Str_2268.handler.container.connection.send(new _Str_2553(_arg_2.id));
            }
        }
    }
}
