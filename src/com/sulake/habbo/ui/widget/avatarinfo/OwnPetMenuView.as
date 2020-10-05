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
        private static const MODE_NORMAL:int = 0;
        private static const MODE_SADDLED_UP:int = 1;
        private static const MODE_RIDING:int = 2;
        private static const MODE_MONSTERPLANT:int = 3;

        private var _data:PetInfoData;
        private var _mode:int;
        private var _Str_11220:IFurnitureData;
        private var _Str_18260:IFurnitureData;
        protected var _catalog:IHabboCatalog;
        protected var _habboTracking:IHabboTracking;

        public function OwnPetMenuView(k:AvatarInfoWidget, _arg_2:IHabboCatalog)
        {
            super(k);
            _Str_3403 = false;
            this._habboTracking = HabboTracking.getInstance();
            this._catalog = _arg_2;
        }

        public static function setup(k:OwnPetMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:PetInfoData):void
        {
            k._data = _arg_6;
            var _local_7:Boolean = k.widget._Str_3859;
            var _local_8:Boolean = k.widget.isRiding;
            if (k.widget._Str_20290())
            {
                k._mode = MODE_MONSTERPLANT;
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
            this._data = null;
            this._Str_11220 = null;
            this._Str_18260 = null;
            this._catalog = null;
            this._habboTracking = null;
            super.dispose();
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
                    k = (XmlAsset(_widget.assets.getAssetByName("own_pet_menu")).content as XML);
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
            this._Str_11220 = null;
            var _local_3:AvatarInfoWidgetHandler = this.widget.handler;
            switch (this._mode)
            {
                case MODE_NORMAL:
                    showButton("respect", (this._data.petRespectLeft > 0));
                    showButton("train");
                    showButton("pick_up");
                    if (this._data._Str_4355 == PetTypeEnum.HORSE)
                    {
                        this._Str_11220 = this._Str_20669(FurniCategory.PET_SADDLE, PetTypeEnum.HORSE);
                        if (this._Str_11220 != null)
                        {
                            showButton("buy_saddle");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.bear.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.BEAR)
                        {
                            showButton("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.terrier.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.TERRIER)
                        {
                            showButton("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.cat.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.CAT)
                        {
                            showButton("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.dog.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.DOG)
                        {
                            showButton("breed");
                        }
                    }
                    if (this.widget.configuration.getBoolean("nest.breeding.pig.enabled"))
                    {
                        if (this._data._Str_4355 == PetTypeEnum.PIG)
                        {
                            showButton("breed");
                        }
                    }
                    break;
                case MODE_SADDLED_UP:
                    showButton("mount");
                    if (this.widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("toggle_riding_permission");
                        this._Str_13657("toggle_riding_permission", ((this._data != null) ? (this._data.publiclyRideable == PetAccessRightTypeEnum._Str_18396) : false));
                    }
                    showButton("respect", (this._data.petRespectLeft > 0));
                    showButton("train");
                    showButton("pick_up");
                    showButton("saddle_off");
                    break;
                case MODE_RIDING:
                    showButton("dismount");
                    showButton("respect", (this._data.petRespectLeft > 0));
                    break;
                case MODE_MONSTERPLANT:
                    showButton("pick_up");
                    if (this._data.dead)
                    {
                        this._Str_18260 = this._Str_20669(FurniCategory.MONSTERPLANT_REVIVAL, PetTypeEnum.MONSTERPLANT);
                        showButton("revive");
                        if (((this.widget.configuration.getBoolean("monsterplants.composting.enabled")) && (_local_3.container.roomSession.isRoomOwner)))
                        {
                            showButton("compost");
                        }
                    }
                    else
                    {
                        _local_4 = (this._data.energy as Number);
                        _local_5 = (this._data.maximumEnergy as Number);
                        showButton("treat", true, ((_local_4 / _local_5) < 0.98));
                        if (this._data.level == this._data.maximumLevel)
                        {
                            if (this._data.breedable)
                            {
                                showButton("toggle_breeding_permission");
                                this._Str_13657("toggle_breeding_permission", this._data.publiclyBreedable);
                                showButton("breed");
                            }
                        }
                    }
                    break;
            }
            if (this.widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_6 = _local_3.container.roomSession.ownUserRoomId;
                _local_7 = _local_3.container.roomEngine.getRoomObject(_local_3.roomSession.roomId, _local_6, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                if (_local_7 != null)
                {
                    _local_8 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                    if (((_local_8 > 0) && (_local_8 < 999999)))
                    {
                        showButton("pass_handitem");
                    }
                }
            }
            this.widget.localizations.registerParameter("infostand.button.petrespect", "count", this._data.petRespectLeft.toString());
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
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
            if ((((this._catalog == null) || (k == null)) || (k.purchaseOfferId < 0)))
            {
                return false;
            }
            this._catalog.openCatalogPageByOfferId(k.purchaseOfferId, CatalogType.NORMAL);
            if (((this._habboTracking) && (!(this._habboTracking.disposed))))
            {
                this._habboTracking.trackGoogle("infostandCatalogButton", "offer", k.purchaseOfferId);
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
            var _local_5:int = _local_3.getRoomObjectCount(_local_4, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
            var _local_6:int;
            while (_local_6 < _local_5)
            {
                _local_7 = _local_3.getRoomObjectWithIndex(_local_4, _local_6, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
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
            if (!_buttons)
            {
                return null;
            }
            var _local_2:IWindowContainer = (_buttons.getListItemByName(k) as IWindowContainer);
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
                            this._data.petRespectLeft--;
                            this._Str_2771();
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RESPECT_PET, this.petId);
                            break;
                        case "treat":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TREAT_PET, this.petId);
                            break;
                        case "pass_handitem":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET, this.petId);
                            break;
                        case "train":
                            this.widget._Str_23877();
                            break;
                        case "pick_up":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_PICKUP_PET, this.petId);
                            this.widget._Str_25401();
                            break;
                        case "mount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_MOUNT_PET, this.petId);
                            break;
                        case "toggle_riding_permission":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION, this.petId);
                            _local_5 = this._Str_18445("toggle_riding_permission");
                            if (_local_5 != null)
                            {
                                this._Str_13657("toggle_riding_permission", (!(_local_5.Selected)));
                            }
                            break;
                        case "toggle_breeding_permission":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION, this.petId);
                            _local_5 = this._Str_18445("toggle_breeding_permission");
                            if (_local_5 != null)
                            {
                                this._Str_13657("toggle_breeding_permission", (!(_local_5.Selected)));
                            }
                            break;
                        case "dismount":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET, this.petId);
                            break;
                        case "saddle_off":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_SADDLE_OFF, this.petId);
                            break;
                        case "breed":
                            if (this._mode == MODE_NORMAL)
                            {
                                _local_7 = RoomWidgetPetCommandMessage._Str_16282;
                                _local_8 = ("pet.command." + _local_7);
                                _local_9 = _widget.catalog.localization.getLocalization(_local_8);
                                _local_4 = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.RWPCM_PET_COMMAND, this._data.id, ((this._data.name + " ") + _local_9));
                            }
                            else
                            {
                                if (this._mode == MODE_MONSTERPLANT)
                                {
                                    _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REQUEST_BREED_PET, this.petId);
                                }
                            }
                            break;
                        case "harvest":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_HARVEST_PET, this.petId);
                            break;
                        case "revive":
                            _local_6 = this.openCatalogPage(this._Str_18260);
                            if (!_local_6)
                            {
                            }
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REVIVE_PET, this.petId);
                            break;
                        case "compost":
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_COMPOST_PLANT, this.petId);
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
                        _local_4 = new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, this.petId, "ownPetContextMenu");
                    }
                    else
                    {
                        if (_arg_2.name == "toggle_riding_permission_checkbox")
                        {
                            _local_3 = true;
                            _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION, this.petId);
                        }
                        else
                        {
                            if (_arg_2.name == "toggle_breeding_permission_checkbox")
                            {
                                _local_3 = true;
                                _local_4 = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION, this.petId);
                            }
                        }
                    }
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
            if (_local_3)
            {
                _widget.removeView(this, false);
            }
        }

        public function get widget():AvatarInfoWidget
        {
            return _widget as AvatarInfoWidget;
        }

        private function _Str_6337(k:int):void
        {
            this._mode = k;
            this._Str_2771();
        }

        public function get petId():int
        {
            return userId;
        }
    }
}
