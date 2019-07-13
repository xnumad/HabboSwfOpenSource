package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class PetMenuView extends AvatarContextInfoButtonView 
    {
        protected static const _Str_2906:uint = 0;
        private static const _Str_5818:int = 1;
        private static const _Str_5938:int = 2;
        private static const _Str_13388:int = 3;

        private var _data:PetInfoData;
        private var _mode:int = 0;

        public function PetMenuView(k:AvatarInfoWidget)
        {
            super(k);
            _Str_3403 = false;
        }

        public static function setup(k:PetMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:PetInfoData):void
        {
            k._data = _arg_6;
            var _local_7:Boolean = k.widget._Str_3859;
            var _local_8:Boolean = k.widget.isRiding;
            if (k.widget._Str_20290())
            {
                k._mode = _Str_13388;
            }
            else
            {
                if (((_local_7) && (!(_local_8))))
                {
                    k._mode = _Str_5818;
                }
                else
                {
                    if (_local_8)
                    {
                        k._mode = _Str_5938;
                    }
                    else
                    {
                        k._mode = _Str_2906;
                    }
                }
            }
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

        protected function _Str_2771():void
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:AvatarInfoWidgetHandler;
            var _local_9:int;
            var _local_10:IRoomObject;
            var _local_11:int;
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
            var _local_4:IRoomSession = this.widget.handler.roomSession;
            var _local_5:ISessionDataManager = this.widget.handler.container.sessionDataManager;
            if ((((_local_4.isRoomController) || (_local_5.isGodMode)) || (_local_4.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                _Str_2304("pick_up");
            }
            switch (this._mode)
            {
                case _Str_2906:
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    break;
                case _Str_5818:
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        _Str_2304("mount");
                    }
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    break;
                case _Str_5938:
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        _Str_2304("dismount");
                    }
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    break;
                case _Str_13388:
                    if (!this._data.dead)
                    {
                        _Str_2304("respect", false);
                        _local_6 = (this._data.energy as Number);
                        _local_7 = (this._data.maximumEnergy as Number);
                        _Str_2304("treat", true, ((_local_6 / _local_7) < 0.98));
                    }
                    break;
            }
            this.widget.localizations.registerParameter("infostand.button.petrespect", "count", this._data._Str_2985.toString());
            if (this.widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_8 = this.widget.handler;
                _local_9 = _local_8.container.roomSession._Str_3871;
                _local_10 = _local_8.container.roomEngine.getRoomObject(_local_8.roomSession.roomId, _local_9, RoomObjectCategoryEnum.CONST_100);
                if (_local_10 != null)
                {
                    _local_11 = _local_10.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                    if (((_local_11 > 0) && (_local_11 < 999999)))
                    {
                        _Str_2304("pass_handitem");
                    }
                }
            }
            k.autoArrangeItems = true;
            k.visible = true;
        }

        override protected function updateWindow():void
        {
            var k:XML;
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
                if (!window)
                {
                    k = (XmlAsset(_Str_2268.assets.getAssetByName("pet_menu")).content as XML);
                    _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
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
                _Str_2374 = (window.findChildByName("buttons") as IItemListWindow);
                _Str_2374.procedure = this.buttonEventProc;
                window.findChildByName("name").caption = _Str_2360;
                window.visible = false;
                activeView = window;
                this._Str_2771();
            }
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_5:String;
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
                        case "mount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_MOUNT_PET, userId);
                            break;
                        case "dismount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET, userId);
                            break;
                        case "respect":
                            this._data._Str_2985--;
                            this._Str_2771();
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage._Str_6480, userId);
                            break;
                        case "treat":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TREAT_PET, userId);
                            break;
                        case "pass_handitem":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET, userId);
                            break;
                        case "pick_up":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_PICKUP_PET, userId);
                            break;
                    }
                }
                if (_arg_2.name == "profile_link")
                {
                    _local_4 = new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, _Str_2306, "petContextMenu");
                }
                if (_local_5 != null)
                {
                    _local_4 = new RoomWidgetUserActionMessage(_local_5, _Str_2306);
                    HabboTracking.getInstance().trackEventLog("InfoStand", "click", _local_5);
                }
                if (_local_4 != null)
                {
                    _Str_2268.messageListener.processWidgetMessage(_local_4);
                }
                this._Str_2771();
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

        private function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }
    }
}
