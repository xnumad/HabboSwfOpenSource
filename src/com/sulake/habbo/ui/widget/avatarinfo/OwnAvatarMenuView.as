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
        private static const _Str_2906:int = 0;
        private static const _Str_12150:int = 1;
        private static const _Str_14313:int = 2;
        private static const _Str_14565:int = 3;
        private static const _Str_13243:int = 4;
        private static const _Str_16983:int = 5;
        private static var _Str_14704:Boolean = false;

        private var _data:AvatarInfoData;
        private var _Str_1069:int;

        public function OwnAvatarMenuView(k:AvatarInfoWidget)
        {
            super((k as IContextMenuParentWidget));
            _Str_3403 = false;
        }

        public static function setup(k:OwnAvatarMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:AvatarInfoData):void
        {
            k._data = _arg_6;
            if ((((!(_Str_14704)) && (k.widget.configuration.getInteger("new.identity", 0) > 0)) && (k.widget.configuration.getBoolean("new.user.reception.enabled"))))
            {
                k._Str_1069 = _Str_2906;
                OwnAvatarMenuView._Str_14704 = true;
            }
            else
            {
                if ((((k.widget._Str_4107) && (k.widget._Str_6454)) && (!(k.widget._Str_4878))))
                {
                    k._Str_1069 = _Str_12150;
                }
                else
                {
                    if (((_arg_6._Str_4330) && (k.widget._Str_13909)))
                    {
                        k._Str_1069 = _Str_14313;
                    }
                    else
                    {
                        k._Str_1069 = _Str_2906;
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
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
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
                    k = (XmlAsset(_Str_2268.assets.getAssetByName("own_avatar_menu")).content as XML);
                    _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
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
                _Str_2374 = (_window.findChildByName("buttons") as IItemListWindow);
                _Str_2374.procedure = this.buttonEventProc;
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
                    _local_5._Str_2613 = this.widget.localizations.getLocalization("infostand.profile.link.tooltip", "Click to view profile");
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
            if ((((!(_window)) || (!(this._data))) || (!(_Str_2374))))
            {
                return;
            }
            _Str_2374.autoArrangeItems = false;
            var k:int = _Str_2374.numListItems;
            var _local_2:int;
            while (_local_2 < k)
            {
                _Str_2374.getListItemAt(_local_2).visible = false;
                _local_2++;
            }
            var _local_3:Boolean = this.widget._Str_25831;
            switch (this._Str_1069)
            {
                case _Str_2906:
                    _Str_2304("change_name", this._data._Str_4330);
                    _Str_2304("decorate", ((this._Str_22241()) && ((this._data.roomControllerLevel >= RoomControllerLevel.GUEST) || (this._data._Str_3246))));
                    _Str_2304("change_looks");
                    _Str_2304("dance_menu", ((this.widget._Str_6454) && (!(_local_3))), (!(this.widget._Str_4878)));
                    _Str_2304("dance", (((!(this.widget._Str_6454)) && (!(this.widget._Str_4107))) && (!(_local_3))), (!(this.widget._Str_4878)));
                    _Str_2304("dance_stop", (((!(this.widget._Str_6454)) && (this.widget._Str_4107)) && (!(_local_3))));
                    if (!(_Str_2268.windowManager as Component).getBoolean("memenu.effects.widget.disabled"))
                    {
                        _Str_2304("effects", (!(_local_3)));
                    }
                    _Str_2304("handitem", (((this._data._Str_8826 > 0) && (this._data._Str_8826 < 999999)) && (this.widget.configuration.getBoolean("handitem.drop.enabled"))));
                    _local_4 = this.widget.configuration.getBoolean("avatar.expressions_menu.enabled");
                    _Str_2304(((_local_4) ? "expressions" : "wave"));
                    _local_5 = this.widget.configuration.getBoolean("avatar.signs.enabled");
                    _Str_2304("signs", _local_5);
                    break;
                case _Str_12150:
                    _Str_2304("dance_stop", true, this.widget._Str_4107);
                    _Str_2304("dance_1");
                    _Str_2304("dance_2");
                    _Str_2304("dance_3");
                    _Str_2304("dance_4");
                    _Str_2304("back");
                    break;
                case _Str_14313:
                    _Str_2304("change_name");
                    _Str_2304("more");
                    break;
                case _Str_16983:
                    _Str_2304("change_looks");
                    _Str_2304("more");
                    break;
                case _Str_14565:
                    _Str_2304("wave", true, (!(this.widget._Str_12708)));
                    _Str_2304("laugh", true, (((!(this.widget._Str_4878)) && (!(this.widget._Str_12708))) && (this.widget._Str_7303)), (!(this.widget._Str_7303)));
                    _Str_2304("blow", true, (((!(this.widget._Str_4878)) && (!(this.widget._Str_12708))) && (this.widget._Str_7303)), (!(this.widget._Str_7303)));
                    _Str_2304("idle", true);
                    if ((((this.widget.configuration.getBoolean("avatar.sitting.enabled")) && (!(this.widget._Str_12708))) && (!(_local_3))))
                    {
                        _Str_2304("sit", (this.widget._Str_22586 == AvatarAction.POSTURE_STAND));
                        _Str_2304("stand", this.widget.canStandUp);
                    }
                    _Str_2304("back");
                    break;
                case _Str_13243:
                    _Str_14514("signs_grid");
                    _Str_2304("back");
                    break;
            }
            _Str_2374.autoArrangeItems = true;
            _Str_2374.visible = true;
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
                            this.widget._Str_25303(_local_7);
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
                _Str_2268.removeView(this, false);
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
                        _Str_2268.catalog.openClubCenter();
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
                                this.widget._Str_5249 = true;
                            }
                            break;
                        case "change_looks":
                            this.widget._Str_25121();
                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "click", "clothes");
                            break;
                        case "expressions":
                            _local_3 = false;
                            this._Str_6337(_Str_14565);
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
                            this._Str_6337(_Str_12150);
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
                            this._Str_6337(_Str_13243);
                            break;
                        case "back":
                            _local_3 = false;
                            this._Str_6337(_Str_2906);
                            break;
                        case "more":
                            _local_3 = false;
                            this.widget._Str_13909 = false;
                            this._Str_6337(_Str_2906);
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
                    _Str_2268.messageListener.processWidgetMessage(_local_4);
                }
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (((_local_3) && (!(_disposed))))
            {
                _Str_2268.removeView(this, false);
            }
        }

        private function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }

        private function _Str_6337(k:int):void
        {
            this._Str_1069 = k;
            this._Str_2771();
        }

        private function _Str_22241():Boolean
        {
            return this.widget._Str_6454;
        }
    }
}
