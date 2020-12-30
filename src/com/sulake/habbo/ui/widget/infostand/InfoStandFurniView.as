package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.utils._Str_6093;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetFurniInfoUsagePolicyEnum;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.window.widgets._Str_4520;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;

    public class InfoStandFurniView 
    {
        private static const BCW_OWNER_ID:int = -12345678;

        private const PICKUP_MODE_NONE:int = 0;
        private const PICKUP_MODE_EJECT:int = 1;
        private const PICKUP_MODE_FULL:int = 2;

        protected var _window:IItemListWindow;
        protected var _customVarsWindow:IWindowContainer;
        protected var _customVarsItemTemplate:IWindow;
        protected var _border:IBorderWindow;
        protected var _buttons:IItemListWindow;
        protected var _catalog:IHabboCatalog;
        protected var _habboTracking:IHabboTracking;
        protected var _Str_3793:IWindow;
        protected var _Str_3823:IWindow;
        protected var _Str_3747:IWindow;
        protected var _Str_3810:IWindow;
        private var _pickupMode:int;
        private var _ownerId:int = 0;
        protected var _widget:InfoStandWidget;
        protected var _infoElements:IItemListWindow;

        public function InfoStandFurniView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            this._pickupMode = this.PICKUP_MODE_NONE;
            super();
            this._widget = k;
            this._catalog = _arg_3;
            this._habboTracking = HabboTracking.getInstance();
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            this._catalog = null;
            this._widget = null;
            this._window.dispose();
            this._window = null;
        }

        public function get window():IItemListWindow
        {
            return this._window;
        }

        protected function createWindow(k:String):void
        {
            var _local_4:IWindow;
            var _local_7:int;
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("furni_view") as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._border = (this._window.getListItemByName("info_border") as IBorderWindow);
            this._buttons = (this._window.getListItemByName("button_list") as IItemListWindow);
            this._customVarsWindow = (this._window.getListItemByName("custom_variables") as IWindowContainer);
            if (!this._widget.handler.container.sessionDataManager.hasSecurity(SecurityLevelEnum.MODERATOR))
            {
                this._customVarsWindow.dispose();
                this._customVarsWindow = null;
            }
            if (this._customVarsWindow != null)
            {
                this._customVarsWindow.procedure = this.customVarsWindowProcedure;
                this._customVarsItemTemplate = IItemListWindow(this._customVarsWindow.findChildByName("variable_list")).removeListItemAt(0);
            }
            if (this._border != null)
            {
                this._infoElements = (this._border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            this._window.name = k;
            this._widget.mainContainer.addChild(this._window);
            var _local_3:IWindow = this._border.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            if (this._buttons != null)
            {
                _local_7 = 0;
                while (_local_7 < this._buttons.numListItems)
                {
                    _local_4 = this._buttons.getListItemAt(_local_7);
                    _local_4.addEventListener(WindowMouseEvent.CLICK, this.onButtonClicked);
                    _local_7++;
                }
            }
            this._Str_3793 = this._border.findChildByTag("catalog");
            if (this._Str_3793 != null)
            {
                this._Str_3793.addEventListener(WindowMouseEvent.CLICK, this._Str_12960);
            }
            this._Str_3823 = this._border.findChildByName("rent_button");
            if (this._Str_3823 != null)
            {
                this._Str_3823.addEventListener(WindowMouseEvent.CLICK, this._Str_12518);
            }
            this._Str_3747 = this._border.findChildByName("extend_button");
            if (this._Str_3747 != null)
            {
                this._Str_3747.addEventListener(WindowMouseEvent.CLICK, this._Str_15302);
            }
            this._Str_3810 = this._border.findChildByName("buyout_button");
            if (this._Str_3810 != null)
            {
                this._Str_3810.addEventListener(WindowMouseEvent.CLICK, this._Str_15887);
            }
            var _local_5:IRegionWindow = (this._infoElements.getListItemByName("owner_region") as IRegionWindow);
            if (_local_5 != null)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_4711);
                _local_5.addEventListener(WindowMouseEvent.OVER, this._Str_4711);
                _local_5.addEventListener(WindowMouseEvent.OUT, this._Str_4711);
            }
            var _local_6:IWindow = this._border.findChildByName("group_details_container");
            if (_local_6)
            {
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_23310);
            }
        }

        private function customVarsWindowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Map;
            var _local_4:IItemListWindow;
            var _local_5:int;
            var _local_6:IWindowContainer;
            if (((!(k.type == WindowMouseEvent.CLICK)) || (!(!(this._customVarsWindow == null)))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "set_values":
                    _local_3 = new Map();
                    _local_4 = (this._customVarsWindow.findChildByName("variable_list") as IItemListWindow);
                    _local_5 = 0;
                    while (_local_5 < _local_4.numListItems)
                    {
                        _local_6 = (_local_4.getListItemAt(_local_5) as IWindowContainer);
                        _local_3[_local_6.name] = _local_6.findChildByName("value").caption;
                        _local_5++;
                    }
                    this._widget.handler.setObjectData(_local_3);
                    return;
            }
        }

        protected function _Str_15887(k:WindowMouseEvent):void
        {
            var _local_2:IFurnitureData;
            if ((((!(this._catalog == null)) && (this._widget)) && (this._widget.furniData)))
            {
                _local_2 = this.getFurnitureData(this._widget.furniData);
                if (_local_2)
                {
                    this._catalog.openRentConfirmationWindow(_local_2, true, this._widget.furniData.id);
                }
            }
        }

        protected function _Str_15302(k:WindowMouseEvent):void
        {
            var _local_2:IFurnitureData;
            if ((((!(this._catalog == null)) && (this._widget)) && (this._widget.furniData)))
            {
                _local_2 = this.getFurnitureData(this._widget.furniData);
                if (_local_2)
                {
                    this._catalog.openRentConfirmationWindow(_local_2, false, this._widget.furniData.id);
                }
            }
        }

        private function getRoomObject(k:int):IRoomObject
        {
            var _local_2:int = this._widget.handler.container.roomSession.roomId;
            var _local_3:IRoomObject = this._widget.handler.container.roomEngine.getRoomObject(_local_2, k, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
            if (_local_3 == null)
            {
                _local_3 = this._widget.handler.container.roomEngine.getRoomObject(_local_2, k, RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
            }
            return _local_3;
        }

        private function getFurnitureData(k:InfoStandFurniData):IFurnitureData
        {
            var _local_5:IFurnitureData;
            var _local_2:IRoomObject = this.getRoomObject(k.id);
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:* = (this._widget.furniData.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
            var _local_4:int = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
            if (_local_3)
            {
                _local_5 = this._widget.handler.container.sessionDataManager.getWallItemData(_local_4);
            }
            else
            {
                _local_5 = this._widget.handler.container.sessionDataManager.getFloorItemData(_local_4);
            }
            return _local_5;
        }

        protected function _Str_12518(k:WindowMouseEvent):void
        {
            if (this._catalog != null)
            {
                this._catalog.openCatalogPageByOfferId(this._widget.furniData.rentOfferId, CatalogType.NORMAL);
            }
        }

        protected function onCloseHandler(k:WindowMouseEvent):void
        {
            this._widget.close();
        }

        public function set name(k:String):void
        {
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            _local_2.visible = true;
            _local_2.height = (_local_2.textHeight + 5);
            this.updateWindow();
        }

        public function set _Str_24341(k:BitmapData):void
        {
            this.setImage(k, "image");
        }

        private function setImage(k:BitmapData, _arg_2:String):void
        {
            var _local_3:IBitmapWrapperWindow = (this._border.findChildByName(_arg_2) as IBitmapWrapperWindow);
            if (_local_3 == null)
            {
                return;
            }
            if (k == null)
            {
                k = new BitmapData(_local_3.width, 40, true);
            }
            _local_3.height = Math.min(k.height, 200);
            _local_3.bitmap = k.clone();
            _local_3.visible = true;
            this.updateWindow();
        }

        public function set description(k:String):void
        {
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("description_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            _local_2.height = (_local_2.textHeight + 5);
            this.updateWindow();
        }

        public function _Str_25318(k:int, _arg_2:String):void
        {
            var _local_3:IRegionWindow;
            var _local_4:ITextWindow;
            var _local_5:IWindow;
            var _local_6:IWindow;
            this._ownerId = k;
            if (this._ownerId == 0)
            {
                this.showWindow("owner_region", false);
                this.showWindow("owner_spacer", false);
            }
            else
            {
                _local_3 = (this._infoElements.getListItemByName("owner_region") as IRegionWindow);
                _local_4 = (_local_3.findChildByName("owner_name") as ITextWindow);
                _local_5 = _local_3.findChildByName("owner_link");
                _local_6 = _local_3.findChildByName("bcw_icon");
                if (this._ownerId != BCW_OWNER_ID)
                {
                    _local_4.text = _arg_2;
                    _local_3.toolTipCaption = this._widget.localizations.getLocalization("infostand.profile.link.tooltip", "");
                    _local_3._Str_3099 = 100;
                    _local_5.visible = true;
                    if (_local_6 != null)
                    {
                        _local_6.visible = false;
                    }
                }
                else
                {
                    _local_4.text = "${builder.catalog.title}";
                    _local_3.toolTipCaption = "";
                    _local_5.visible = false;
                    if (_local_6 != null)
                    {
                        _local_6.visible = true;
                    }
                }
                this.showWindow("owner_region", true);
                this.showWindow("owner_spacer", true);
            }
            this.updateWindow();
        }

        private function set expiration(k:int):void
        {
            var _local_2:IWindow = this._infoElements.getListItemByName("expiration_text");
            if (_local_2 == null)
            {
                return;
            }
            this._widget.localizations.registerParameter("infostand.rent.expiration", "time", FriendlyTime.format(this._widget.handler.container.localization, k));
            _local_2.visible = ((k >= 0) && (this._ownerId == this._widget.handler.container.sessionDataManager.userId));
            this.updateWindow();
        }

        protected function onButtonClicked(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetMessage;
            var _local_3:String;
            var _local_4:String;
            var _local_5:IWindow = (k.target as IWindow);
            switch (_local_5.name)
            {
                case "rotate":
                    _local_3 = RoomWidgetFurniActionMessage.RWFUAM_ROTATE;
                    break;
                case "move":
                    _local_3 = RoomWidgetFurniActionMessage.RWFAM_MOVE;
                    break;
                case "pickup":
                    if (this._pickupMode == this.PICKUP_MODE_FULL)
                    {
                        _local_3 = RoomWidgetFurniActionMessage.RWFAM_PICKUP;
                    }
                    else
                    {
                        _local_3 = RoomWidgetFurniActionMessage.RWFAM_EJECT;
                    }
                    this._widget.close();
                    break;
                case "save_branding_configuration":
                    if (this._widget.handler.container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE))
                    {
                        _local_3 = RoomWidgetFurniActionMessage.RWFAM_SAVE_STUFF_DATA;
                        _local_4 = this._Str_22904();
                        break;
                    }
                case "use":
                    _local_3 = RoomWidgetFurniActionMessage.RWFAM_USE;
                    break;
            }
            if (_local_3 != null)
            {
                _local_2 = new RoomWidgetFurniActionMessage(_local_3, this._widget.furniData.id, this._widget.furniData.category, this._widget.furniData.purchaseOfferId, _local_4);
                this._widget.messageListener.processWidgetMessage(_local_2);
            }
        }

        private function _Str_23310(k:WindowMouseEvent):void
        {
            this._widget.messageListener.processWidgetMessage(new RoomWidgetGetBadgeDetailsMessage(false, this._widget.furniData.groupId));
        }

        protected function _Str_12960(k:WindowMouseEvent):void
        {
            if (this._catalog != null)
            {
                this._catalog.openCatalogPageByOfferId(this._widget.furniData.purchaseOfferId, CatalogType.NORMAL);
                if (((this._habboTracking) && (!(this._habboTracking.disposed))))
                {
                    this._habboTracking.trackGoogle("infostandCatalogButton", "offer", this._widget.furniData.purchaseOfferId);
                }
            }
        }

        protected function _Str_4711(k:WindowMouseEvent):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._ownerId == BCW_OWNER_ID)
                {
                    this._widget.handler.container.catalog.toggleToBuildersClub();
                }
                else
                {
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, this._ownerId, "infoStand_furniView"));
                }
            }
            if (k.type == WindowMouseEvent.OUT)
            {
                IIconWindow(IRegionWindow(k.target).findChildByName("owner_link")).style = 21;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                IIconWindow(IRegionWindow(k.target).findChildByName("owner_link")).style = 22;
            }
        }

        protected function updateWindow():void
        {
            if ((((this._infoElements == null) || (this._border == null)) || (this._buttons == null)))
            {
                return;
            }
            this._infoElements.arrangeListItems();
            this._buttons.width = this._buttons.scrollableRegion.width;
            this._infoElements.height = this._infoElements.scrollableRegion.height;
            this._border.height = (this._infoElements.height + 20);
            this._window.width = Math.max(this._border.width, this._buttons.width);
            this._window.height = this._window.scrollableRegion.height;
            if (this._border.width < this._buttons.width)
            {
                this._border.x = (this._window.width - this._border.width);
                this._buttons.x = 0;
            }
            else
            {
                this._buttons.x = (this._window.width - this._buttons.width);
                this._border.x = 0;
            }
            if (this._customVarsWindow != null)
            {
                this._customVarsWindow.x = this._border.x;
            }
            this._widget._Str_10301();
        }

        public function update(k:RoomWidgetFurniInfostandUpdateEvent):void
        {
            if (this._border != null)
            {
                this._border.color = ((_Str_6093._Str_7070(k.id)) ? 0xD77900 : 0xFFFFFF);
            }
            this.name = k.name;
            this.description = k.description;
            this._Str_24341 = k.image;
            this.expiration = k.expiration;
            this._Str_25318(((_Str_6093._Str_7070(k.id)) ? BCW_OWNER_ID : k.ownerId), k.ownerName);
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            if (((((k.roomControllerLevel >= RoomControllerLevel.GUEST) || (k.isOwner)) || (k.isRoomOwner)) || (k.isAnyRoomController)))
            {
                _local_2 = true;
                _local_3 = (!(k.isWallItem));
            }
            if (k.isAnyRoomController)
            {
                _local_4 = true;
            }
            var _local_6:* = (k.roomControllerLevel >= RoomControllerLevel.GUEST);
            if (((((k.usagePolicy == RoomWidgetFurniInfoUsagePolicyEnum.EVERYBODY) || ((k.usagePolicy == RoomWidgetFurniInfoUsagePolicyEnum.CONTROLLER) && (_local_6))) || ((k.extraParam == RoomWidgetEnumItemExtradataParameter.JUKEBOX) && (_local_6))) || ((k.extraParam == RoomWidgetEnumItemExtradataParameter.USABLE_PRODUCT) && (_local_6))))
            {
                _local_5 = this._widget.config.getBoolean("infostand.use.button.enabled");
            }
            this._Str_25151(k);
            this.showButton("move", _local_2);
            this.showButton("rotate", _local_3);
            this.showButton("use", _local_5);
            this.showAdFurnitureDetails(_local_4);
            this._Str_22883((k.groupId > 0));
            this._Str_22377(k.isOwner, (k.expiration >= 0), (k.purchaseOfferId >= 0), (k.rentOfferId >= 0), k.purchaseCouldBeUsedForBuyout, k.rentCouldBeUsedForBuyout);
            this._Str_22365((k.stuffData.uniqueSerialNumber > 0), k.stuffData);
            this._Str_16559((k.stuffData.rarityLevel >= 0), k.stuffData);
            this._buttons.visible = ((((_local_2) || (_local_3)) || (!(this._pickupMode == this.PICKUP_MODE_NONE))) || (_local_5));
            this._Str_25743();
            this.updateWindow();
        }

        private function _Str_25743():void
        {
            var _local_5:String;
            var _local_6:IWindowContainer;
            if (((this._customVarsWindow == null) || (this._widget.furniData == null)))
            {
                return;
            }
            var k:IRoomObject = this.getRoomObject(this._widget.furniData.id);
            if (k == null)
            {
                return;
            }
            var _local_2:Array = k.getModel().getStringArray(RoomObjectVariableEnum.FURNITURE_CUSTOM_VARIABLES);
            this._customVarsWindow.visible = ((!(_local_2 == null)) && (_local_2.length > 0));
            if (!this._customVarsWindow.visible)
            {
                return;
            }
            var _local_3:IItemListWindow = (this._customVarsWindow.findChildByName("variable_list") as IItemListWindow);
            _local_3.destroyListItems();
            var _local_4:Map = k.getModel().getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA);
            for each (_local_5 in _local_2)
            {
                _local_6 = (this._customVarsItemTemplate.clone() as IWindowContainer);
                _local_6.name = _local_5;
                _local_6.findChildByName("name").caption = _local_5;
                _local_6.findChildByName("value").caption = _local_4[_local_5];
                _local_3.addListItem(_local_6);
            }
        }

        private function _Str_25151(k:RoomWidgetFurniInfostandUpdateEvent):void
        {
            this._pickupMode = this.PICKUP_MODE_NONE;
            if (((k.isOwner) || (k.isAnyRoomController)))
            {
                this._pickupMode = this.PICKUP_MODE_FULL;
            }
            else
            {
                if (((k.isRoomOwner) || (k.roomControllerLevel >= RoomControllerLevel.GUILD_ADMIN)))
                {
                    this._pickupMode = this.PICKUP_MODE_EJECT;
                }
            }
            if (k._Str_17541)
            {
                this._pickupMode = this.PICKUP_MODE_NONE;
            }
            this.showButton("pickup", (!(this._pickupMode == this.PICKUP_MODE_NONE)));
            this._Str_25214(this._pickupMode);
        }

        private function _Str_25214(k:int):void
        {
            if (this._buttons == null)
            {
                return;
            }
            var _local_2:IWindow = this._buttons.getListItemByName("pickup");
            if (_local_2 != null)
            {
                if (k == this.PICKUP_MODE_EJECT)
                {
                    _local_2.caption = "${infostand.button.eject}";
                }
                else
                {
                    _local_2.caption = "${infostand.button.pickup}";
                }
            }
        }

        private function _Str_22934(k:String, _arg_2:String):void
        {
            var _local_3:XmlAsset;
            var _local_4:IWindowContainer;
            var _local_5:IWindow;
            var _local_6:IWindow;
            if (this._infoElements != null)
            {
                _local_3 = (this._widget.assets.getAssetByName("furni_view_branding_element") as XmlAsset);
                if (_local_3 != null)
                {
                    _local_4 = (this._widget.windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
                    if (_local_4 != null)
                    {
                        _local_5 = _local_4.findChildByName("element_name");
                        if (_local_5 != null)
                        {
                            _local_5.caption = k;
                        }
                        _local_6 = _local_4.findChildByName("element_value");
                        if (_local_6 != null)
                        {
                            _local_6.caption = _arg_2;
                            _local_6.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_24509);
                        }
                        if (((!(_local_5 == null)) && (!(_local_6 == null))))
                        {
                            this._infoElements.addListItem(_local_4);
                        }
                    }
                }
            }
        }

        private function getAdFurnitureExtraParams():Map
        {
            var _local_2:String;
            var _local_3:Array;
            var _local_4:String;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var k:Map = new Map();
            if (this._widget != null)
            {
                _local_2 = this._widget.furniData.extraParam.substr(RoomWidgetEnumItemExtradataParameter.BRANDING_OPTIONS.length);
                _local_3 = _local_2.split("\t");
                if (_local_3 != null)
                {
                    for each (_local_4 in _local_3)
                    {
                        _local_5 = _local_4.split("=", 2);
                        if (((!(_local_5 == null)) && (_local_5.length == 2)))
                        {
                            _local_6 = _local_5[0];
                            _local_7 = _local_5[1];
                            k.add(_local_6, _local_7);
                        }
                    }
                }
            }
            return k;
        }

        private function _Str_22904():String
        {
            var _local_2:Array;
            var _local_3:IWindowContainer;
            var _local_4:IWindow;
            var _local_5:IWindow;
            var _local_6:String;
            var _local_7:String;
            var k:String = "";
            if (this._border != null)
            {
                _local_2 = [];
                this._border.groupChildrenWithTag("branding_element", _local_2, -1);
                if (_local_2.length > 0)
                {
                    for each (_local_3 in _local_2)
                    {
                        _local_4 = _local_3.findChildByName("element_name");
                        _local_5 = _local_3.findChildByName("element_value");
                        if (((!(_local_4 == null)) && (!(_local_5 == null))))
                        {
                            _local_6 = this._Str_19333(_local_4.caption);
                            _local_7 = this._Str_19333(_local_5.caption);
                            k = (k + (((_local_6 + "=") + _local_7) + "\t"));
                        }
                    }
                }
            }
            return k;
        }

        private function _Str_19333(k:String):String
        {
            if (k != null)
            {
                if (k.indexOf("\t") != -1)
                {
                    return k.replace("\t", "");
                }
            }
            return k;
        }

        private function showAdFurnitureDetails(k:Boolean):void
        {
            var _local_6:IWindow;
            var _local_7:String;
            var _local_8:Map;
            var _local_9:String;
            var _local_10:String;
            if (((this._widget == null) || (this._border == null)))
            {
                return;
            }
            var _local_2:IWindow = this._border.findChildByName("furni_details_spacer");
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
            var _local_3:Array = [];
            this._border.groupChildrenWithTag("branding_element", _local_3, -1);
            if (_local_3.length > 0)
            {
                for each (_local_6 in _local_3)
                {
                    this._border.removeChild(_local_6);
                    _local_6.dispose();
                }
            }
            var _local_4:Boolean;
            var _local_5:IWindow = (this._border.findChildByName("furni_details_text") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.visible = k;
                _local_7 = ("id: " + this._widget.furniData.id);
                _local_8 = this.getAdFurnitureExtraParams();
                if (_local_8.length > 0)
                {
                    _local_4 = true;
                    for each (_local_9 in _local_8.getKeys())
                    {
                        _local_10 = _local_8.getValue(_local_9);
                        this._Str_22934(_local_9, _local_10);
                    }
                }
                _local_5.caption = _local_7;
            }
            this.showButton("save_branding_configuration", _local_4);
        }

        private function _Str_22883(k:Boolean):void
        {
            this.showWindow("group_details_spacer", k);
            this.showWindow("group_details_container", k);
            this.showWindow("group_badge_image", false);
            this.showWindow("group_name", false);
        }

        private function showWindow(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindow = this._border.findChildByName(k);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            }
        }

        private function _Str_24509(k:WindowEvent=null, _arg_2:IWindow=null):void
        {
        }

        protected function showButton(k:String, _arg_2:Boolean):void
        {
            if (this._buttons == null)
            {
                return;
            }
            var _local_3:IWindow = this._buttons.getListItemByName(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
                this._buttons.arrangeListItems();
            }
        }

        private function _Str_22377(k:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean):void
        {
            var _local_7:Boolean;
            var _local_8:Boolean = ((k) && (_arg_2));
            var _local_9:Boolean = ((_local_8) && (_arg_6));
            var _local_10:Boolean = ((_local_8) && (_arg_5));
            var _local_11:Boolean = ((!(_local_8)) && (_arg_3));
            var _local_12:Boolean = ((!(_local_8)) && (_arg_4));
            if (this._Str_3793 != null)
            {
                this._Str_3793.visible = _local_11;
                _local_7 = ((_local_7) || (_local_11));
            }
            if (this._Str_3823 != null)
            {
                this._Str_3823.visible = _local_12;
                _local_7 = ((_local_7) || (_local_12));
            }
            if (this._Str_3747 != null)
            {
                this._Str_3747.visible = _local_9;
                _local_7 = ((_local_7) || (_local_9));
            }
            if (this._Str_3810 != null)
            {
                this._Str_3810.visible = _local_10;
                _local_7 = ((_local_7) || (_local_10));
            }
            var _local_13:IItemListWindow = (this._infoElements.getListItemByName("purchase_buttons") as IItemListWindow);
            if (_local_13 != null)
            {
                _local_13.arrangeListItems();
                _local_13.visible = _local_7;
            }
            this._infoElements.arrangeListItems();
        }

        public function set groupName(k:String):void
        {
            var _local_2:IWindow = this._border.findChildByName("group_name");
            if (_local_2)
            {
                _local_2.caption = k;
                _local_2.visible = true;
            }
        }

        private function _Str_22365(k:Boolean, _arg_2:IStuffData):void
        {
            var _local_5:IWidgetWindow;
            var _local_6:ILimitedItemPreviewOverlayWidget;
            var _local_3:IWindowContainer = (this._border.findChildByName("unique_item_background_container") as IWindowContainer);
            var _local_4:IWindowContainer = (this._border.findChildByName("unique_item_overlay_container") as IWindowContainer);
            if (((!(_local_3)) || (!(_local_4))))
            {
                return;
            }
            if (!k)
            {
                _local_3.visible = false;
                _local_4.visible = false;
            }
            else
            {
                _local_3.visible = true;
                _local_4.visible = true;
                _local_5 = IWidgetWindow(_local_4.findChildByName("unique_item_plaque_widget"));
                _local_6 = ILimitedItemPreviewOverlayWidget(_local_5.widget);
                _local_6.serialNumber = _arg_2.uniqueSerialNumber;
                _local_6.seriesSize = _arg_2.uniqueSeriesSize;
            }
        }

        private function _Str_16559(k:Boolean, _arg_2:IStuffData):void
        {
            var _local_4:IWidgetWindow;
            var _local_5:_Str_4520;
            var _local_3:IWindowContainer = (this._border.findChildByName("rarity_item_overlay_container") as IWindowContainer);
            if (!_local_3)
            {
                return;
            }
            if (!k)
            {
                _local_3.visible = false;
            }
            else
            {
                _local_3.visible = true;
                _local_4 = IWidgetWindow(_local_3.findChildByName("rarity_item_overlay_widget"));
                _local_5 = _Str_4520(_local_4.widget);
                _local_5.rarityLevel = _arg_2.rarityLevel;
            }
        }

        public function set groupBadgeId(k:String):void
        {
            var _local_2:IWidgetWindow = (this._border.findChildByName("group_badge_image") as IWidgetWindow);
            var _local_3:IBadgeImageWidget = (_local_2.widget as IBadgeImageWidget);
            _local_3.badgeId = k;
            _local_3.groupId = this._widget.furniData.groupId;
            _local_2.visible = true;
        }
    }
}
