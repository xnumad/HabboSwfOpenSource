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
        protected static const MODE_NORMAL:uint = 0;
        private static const MODE_SADDLED_UP:int = 1;
        private static const MODE_RIDING:int = 2;
        private static const MODE_MONSTER_PLANT:int = 3;

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
                k._mode = MODE_MONSTER_PLANT;
            }
            else
            {
                if (((_local_7) && (!(_local_8))))
                {
                    k._mode = MODE_SADDLED_UP;
                }
                else
                {
                    if (_local_8)
                    {
                        k._mode = MODE_RIDING;
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
            if ((((_local_4.isRoomOwner) || (_local_5.isAnyRoomController)) || (_local_4.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                showButton("pick_up");
            }
            switch (this._mode)
            {
                case MODE_NORMAL:
                    showButton("respect", (this._data.petRespectLeft > 0));
                    break;
                case MODE_SADDLED_UP:
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("mount");
                    }
                    showButton("respect", (this._data.petRespectLeft > 0));
                    break;
                case MODE_RIDING:
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("dismount");
                    }
                    showButton("respect", (this._data.petRespectLeft > 0));
                    break;
                case MODE_MONSTER_PLANT:
                    if (!this._data.dead)
                    {
                        showButton("respect", false);
                        _local_6 = (this._data.energy as Number);
                        _local_7 = (this._data.maximumEnergy as Number);
                        showButton("treat", true, ((_local_6 / _local_7) < 0.98));
                    }
                    break;
            }
            this.widget.localizations.registerParameter("infostand.button.petrespect", "count", this._data.petRespectLeft.toString());
            if (this.widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_8 = this.widget.handler;
                _local_9 = _local_8.container.roomSession.ownUserRoomId;
                _local_10 = _local_8.container.roomEngine.getRoomObject(_local_8.roomSession.roomId, _local_9, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                if (_local_10 != null)
                {
                    _local_11 = _local_10.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                    if (((_local_11 > 0) && (_local_11 < 999999)))
                    {
                        showButton("pass_handitem");
                    }
                }
            }
            k.autoArrangeItems = true;
            k.visible = true;
        }

        override protected function updateWindow():void
        {
            var k:XML;
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
                    k = (XmlAsset(_widget.assets.getAssetByName("pet_menu")).content as XML);
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
                            this._data.petRespectLeft--;
                            this._Str_2771();
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RESPECT_PET, userId);
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
                    _widget.messageListener.processWidgetMessage(_local_4);
                }
                this._Str_2771();
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

        private function get widget():AvatarInfoWidget
        {
            return _widget as AvatarInfoWidget;
        }
    }
}
