package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class OwnPetMenuView extends AvatarContextInfoButtonView 
    {
        private static const _Str_2906:int = 0;
        private static const _Str_5818:int = 1;
        private static const _Str_5938:int = 2;
        private static const _Str_10946:int = 3;

        private var _data:PetInfoData;
        private var _Str_1069:int;
        private var _Str_11220:IFurnitureData;
        private var _Str_18260:IFurnitureData;
        protected var _Str_2276:IHabboCatalog;
        protected var _Str_2421:IHabboTracking;

        public function OwnPetMenuView(k:AvatarInfoWidget, _arg_2:IHabboCatalog)
        {
            super(k);
            _Str_3403 = false;
            this._Str_2421 = HabboTracking.getInstance();
            this._Str_2276 = _arg_2;
        }

        public static function setup(k:OwnPetMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:PetInfoData):void
        {
            k._data = _arg_6;
            var _local_7:Boolean = k.widget._Str_3859;
            var _local_8:Boolean = k.widget.isRiding;
            if (k.widget._Str_20290())
            {
                k._Str_1069 = _Str_10946;
            }
            else
            {
                if (((_local_7) && (!(_local_8))))
                {
                    k._Str_1069 = _Str_5818;
                }
                else
                {
                    if (_local_8)
                    {
                        k._Str_1069 = _Str_5938;
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
            this._Str_11220 = null;
            this._Str_18260 = null;
            this._Str_2276 = null;
            this._Str_2421 = null;
            super.dispose();
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
                    k = (XmlAsset(_Str_2268.assets.getAssetByName("own_pet_menu")).content as XML);
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
                _window.findChildByName("name").caption = _Str_2360;
                _window.visible = false;
                activeView = _window;
                this._Str_2771();
            }
        }

        public function _Str_2771():void
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:IRoomObject;
            var _local_8:int;
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
            this._Str_11220 = null;
            var _local_3:AvatarInfoWidgetHandler = this.widget.handler;
            switch (this._Str_1069)
            {
                case _Str_2906:
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    _Str_2304("train");
                    _Str_2304("pick_up");
                    if (this._data._Str_4355 == PetTypeEnum.HORSE)
                    {
                        this._Str_11220 = this._Str_20669(FurniCategory._Str_6096, PetTypeEnum.HORSE);
                        if (this._Str_11220 != null)
                        {
                            _Str_2304("buy_saddle");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.bear.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.BEAR)
                        {
                            _Str_2304("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.terrier.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.TERRIER)
                        {
                            _Str_2304("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.cat.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.CAT)
                        {
                            _Str_2304("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.dog.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.DOG)
                        {
                            _Str_2304("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.pig.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.PIG)
                        {
                            _Str_2304("breed");
                        }
                    }
                    break;
                case _Str_5818:
                    _Str_2304("mount");
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        _Str_2304("toggle_riding_permission");
                        this._Str_13657("toggle_riding_permission", ((this._data != null) ? (this._data.publiclyRideable == PetAccessRightTypeEnum._Str_18396) : false));
                    }
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    _Str_2304("train");
                    _Str_2304("pick_up");
                    _Str_2304("saddle_off");
                    break;
                case _Str_5938:
                    _Str_2304("dismount");
                    _Str_2304("respect", (this._data._Str_2985 > 0));
                    break;
                case _Str_10946:
                    _Str_2304("pick_up");
                    if (this._data.dead)
                    {
                        this._Str_18260 = this._Str_20669(FurniCategory._Str_6915, PetTypeEnum.MONSTERPLANT);
                        _Str_2304("revive");
                        if (((this.widget.configuration.getBoolean("monsterplants.composting.enabled")) && (_local_3.container.roomSession.isRoomController)))
                        {
                            _Str_2304("compost");
                        }
                    }
                    else
                    {
                        _local_4 = (this._data.energy as Number);
                        _local_5 = (this._data.maximumEnergy as Number);
                        _Str_2304("treat", true, ((_local_4 / _local_5) < 0.98));
                        if (this._data.level == this._data.maximumLevel)
                        {
                            if (this._data.breedable)
                            {
                                _Str_2304("toggle_breeding_permission");
                                this._Str_13657("toggle_breeding_permission", this._data.publiclyBreedable);
                                _Str_2304("breed");
                            }
                        }
                    }
                    break;
            }
            if (this.widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_6 = _local_3.container.roomSession._Str_3871;
                _local_7 = _local_3.container.roomEngine.getRoomObject(_local_3.roomSession.roomId, _local_6, RoomObjectCategoryEnum.CONST_100);
                if (_local_7 != null)
                {
                    _local_8 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                    if (((_local_8 > 0) && (_local_8 < 999999)))
                    {
                        _Str_2304("pass_handitem");
                    }
                }
            }
            this.widget.localizations.registerParameter("infostand.button.petrespect", "count", this._data._Str_2985.toString());
            _Str_2374.autoArrangeItems = true;
            _Str_2374.visible = true;
        }

        private function _Str_20669(k:int, _arg_2:int):IFurnitureData
        {
            var _local_5:IFurnitureData;
            var _local_6:Array;
            var _local_7:int;
            var _local_3:IFurnitureData;
            var _local_4:Array = this.widget.handler.container.sessionDataManager.getFloorItemsDataByCategory(k);
            for each (_local_5 in _local_4)
            {
                _local_6 = _local_5.customParams.split(" ");
                _local_7 = (((_local_6) && (_local_6.length >= 1)) ? parseInt(_local_6[0]) : -1);
                if (_local_7 == _arg_2)
                {
                    _local_3 = _local_5;
                    break;
                }
            }
            return _local_3;
        }

        private function openCatalogPage(k:IFurnitureData):Boolean
        {
            if ((((this._Str_2276 == null) || (k == null)) || (k.purchaseOfferId < 0)))
            {
                return false;
            }
            this._Str_2276.openCatalogPageByOfferId(k.purchaseOfferId, CatalogType.NORMAL);
            if (((this._Str_2421) && (!(this._Str_2421.disposed))))
            {
                this._Str_2421.trackGoogle("infostandCatalogButton", "offer", k.purchaseOfferId);
            }
            return true;
        }

        private function _Str_8946(k:IFurnitureData):IRoomObject
        {
            var _local_7:IRoomObject;
            var _local_8:int;
            if (((this.widget == null) || (k == null)))
            {
                return null;
            }
            var _local_2:IRoomWidgetHandlerContainer = this.widget.handler.container;
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:IRoomEngine = _local_2.roomEngine;
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:int = _local_2.roomSession.roomId;
            var _local_5:int = _local_3.getRoomObjectCount(_local_4, RoomObjectCategoryEnum.CONST_10);
            var _local_6:int;
            while (_local_6 < _local_5)
            {
                _local_7 = _local_3.getRoomObjectWithIndex(_local_4, _local_6, RoomObjectCategoryEnum.CONST_10);
                if (_local_7 != null)
                {
                    _local_8 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                    if (_local_8 == k.id)
                    {
                        return _local_7;
                    }
                }
                _local_6++;
            }
            return null;
        }

        private function _Str_13657(k:String, _arg_2:Boolean):void
        {
            var _local_3:ICheckBoxWindow = this._Str_18445(k);
            if (!_local_3)
            {
                return;
            }
            if (_arg_2)
            {
                _local_3.select();
            }
            else
            {
                _local_3.unselect();
            }
        }

        private function _Str_18445(k:String):ICheckBoxWindow
        {
            if (!_Str_2374)
            {
                return null;
            }
            var _local_2:IWindowContainer = (_Str_2374.getListItemByName(k) as IWindowContainer);
            if (!_local_2)
            {
                return null;
            }
            return _local_2.findChildByName((k + "_checkbox")) as ICheckBoxWindow;
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:RoomWidgetMessage;
            var _local_5:ICheckBoxWindow;
            var _local_6:Boolean;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            if (disposed)
            {
                return;
            }
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    Logger.log(("Own pet menu was clicked: " + _arg_2.parent.name));
                    switch (_arg_2.parent.name)
                    {
                        case "respect":
                            this._data._Str_2985--;
                            this._Str_2771();
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage._Str_6480, this._Str_2508);
                            break;
                        case "treat":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TREAT_PET, this._Str_2508);
                            break;
                        case "pass_handitem":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET, this._Str_2508);
                            break;
                        case "train":
                            this.widget._Str_23877();
                            break;
                        case "pick_up":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_PICKUP_PET, this._Str_2508);
                            this.widget._Str_25401();
                            break;
                        case "mount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_MOUNT_PET, this._Str_2508);
                            break;
                        case "toggle_riding_permission":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION, this._Str_2508);
                            _local_5 = this._Str_18445("toggle_riding_permission");
                            if (_local_5 != null)
                            {
                                this._Str_13657("toggle_riding_permission", (!(_local_5._Str_2365)));
                            }
                            break;
                        case "toggle_breeding_permission":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION, this._Str_2508);
                            _local_5 = this._Str_18445("toggle_breeding_permission");
                            if (_local_5 != null)
                            {
                                this._Str_13657("toggle_breeding_permission", (!(_local_5._Str_2365)));
                            }
                            break;
                        case "dismount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET, this._Str_2508);
                            break;
                        case "saddle_off":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_SADDLE_OFF, this._Str_2508);
                            break;
                        case "breed":
                            if (this._Str_1069 == _Str_2906)
                            {
                                _local_7 = RoomWidgetPetCommandMessage._Str_16282;
                                _local_8 = ("pet.command." + _local_7);
                                _local_9 = _Str_2268.catalog.localization.getLocalization(_local_8);
                                _local_4 = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.RWPCM_PET_COMMAND, this._data.id, ((this._data.name + " ") + _local_9));
                            }
                            else
                            {
                                if (this._Str_1069 == _Str_10946)
                                {
                                    _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REQUEST_BREED_PET, this._Str_2508);
                                }
                            }
                            break;
                        case "harvest":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_HARVEST_PET, this._Str_2508);
                            break;
                        case "revive":
                            _local_6 = this.openCatalogPage(this._Str_18260);
                            if (!_local_6)
                            {
                            }
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REVIVE_PET, this._Str_2508);
                            break;
                        case "compost":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_COMPOST_PLANT, this._Str_2508);
                            break;
                        case "buy_saddle":
                            this.openCatalogPage(this._Str_11220);
                            break;
                    }
                }
                else
                {
                    if (_arg_2.name == "profile_link")
                    {
                        _local_4 = new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, this._Str_2508, "ownPetContextMenu");
                    }
                    else
                    {
                        if (_arg_2.name == "toggle_riding_permission_checkbox")
                        {
                            _local_3 = true;
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION, this._Str_2508);
                        }
                        else
                        {
                            if (_arg_2.name == "toggle_breeding_permission_checkbox")
                            {
                                _local_3 = true;
                                _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION, this._Str_2508);
                            }
                        }
                    }
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
            if (_local_3)
            {
                _Str_2268.removeView(this, false);
            }
        }

        public function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }

        private function _Str_6337(k:int):void
        {
            this._Str_1069 = k;
            this._Str_2771();
        }

        public function get _Str_2508():int
        {
            return userId;
        }
    }
}
