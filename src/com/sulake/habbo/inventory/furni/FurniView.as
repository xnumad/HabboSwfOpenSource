package com.sulake.habbo.inventory.furni
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.window.widgets._Str_3338;
    import com.sulake.habbo.window.widgets._Str_4520;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.room.utils.Vector3d;
    import flash.filters.GlowFilter;
    import com.sulake.habbo.room.object.data.MapStuffData;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.window.widgets._Str_4709;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.utils.FriendlyTime;

    public class FurniView implements IInventoryView, IUpdateReceiver 
    {
        private static const _Str_12512:int = 0;
        private static const _Str_4299:int = 1;
        private static const _Str_5391:int = 2;
        private static const _Str_4660:int = 3;
        private static const _Str_12387:int = 4;

        private var _lastCategory:String = "";
        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _view:IWindowContainer;
        private var _grid:FurniGridView;
        private var _model:FurniModel;
        private var _marketplace:MarketplaceModel;
        private var _roomEngine:IRoomEngine;
        private var _disposed:Boolean = false;
        private var _currentState:int = 0;
        private var _limitedItemOverlay:_Str_3338;
        private var _rarityItemOverlay:_Str_4520;
        private var _buttonList:IItemListWindow;
        private var _placeInRoomButton:IButtonWindow;
        private var _gotoRoomButton:IButtonWindow;
        private var _sellInMarketplaceButton:IButtonWindow;
        private var _offerInTradingButton:IButtonWindow;
        private var _offerInTradingCountButton:ITextFieldWindow;
        private var _useFurnitureButton:IButtonWindow;
        private var _extendRentPeriodButton:IButtonWindow;
        private var _buyRentedItemButton:IButtonWindow;
        private var _isInitialized:Boolean = false;
        private var _roomPreviewer:RoomPreviewer;
        private var _rentablesPlacementSelection:int = 0;

        public function FurniView(k:FurniModel, _arg_2:MarketplaceModel, _arg_3:IHabboWindowManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine)
        {
            this._model = k;
            this._marketplace = _arg_2;
            this._assetLibrary = _arg_4;
            this._windowManager = _arg_3;
            this._roomEngine = _arg_5;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isVisible():Boolean
        {
            return ((this._view) && (!(this._view.parent == null))) && (this._view.visible);
        }

        public function get isInitialized():Boolean
        {
            return this._isInitialized;
        }

        public function get _Str_12561():Vector.<GroupItem>
        {
            return (this._grid) ? this._grid._Str_12561 : null;
        }

        public function get grid():FurniGridView
        {
            return this._grid;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._model) && (this._model.controller)))
                {
                    this._model.controller.removeUpdateReceiver(this);
                }
                this._model = null;
                this._marketplace = null;
                this._assetLibrary = null;
                this._windowManager = null;
                this._roomEngine = null;
                if (this._limitedItemOverlay)
                {
                    this._limitedItemOverlay.dispose();
                    this._limitedItemOverlay = null;
                }
                if (this._rarityItemOverlay)
                {
                    this._rarityItemOverlay.dispose();
                    this._rarityItemOverlay = null;
                }
                if (this._view)
                {
                    this._view.dispose();
                    this._view = null;
                }
                this._disposed = true;
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (this._view == null)
            {
                return null;
            }
            if (this._view.disposed)
            {
                return null;
            }
            this._Str_20866(false);
            return this._view;
        }

        public function _Str_7636():void
        {
            var k:int;
            if (!this._model._Str_21873())
            {
                k = _Str_4299;
            }
            else
            {
                if (((!(this._model.furniData)) || (this._model.furniData.length == 0)))
                {
                    k = _Str_5391;
                }
                else
                {
                    k = _Str_4660;
                }
            }
            if (this._currentState == k)
            {
                return;
            }
            this._currentState = k;
            this._Str_6511();
        }

        public function _Str_22617():void
        {
            this._Str_2944();
        }

        public function _Str_15980():IWindowContainer
        {
            return (this._grid != null) ? this._grid._Str_15980() : null;
        }

        public function _Str_2944():void
        {
            var _local_2:FurnitureItem;
            var _local_3:IStaticBitmapWrapperWindow;
            var _local_4:ITextWindow;
            var _local_5:IRegionWindow;
            var _local_9:String;
            var _local_10:String;
            var _local_11:String;
            var _local_12:String;
            var _local_13:int;
            var _local_14:IWidgetWindow;
            var _local_15:IWidgetWindow;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_19:IFurnitureData;
            var _local_20:String;
            if (this._view == null)
            {
                return;
            }
            if (this._view.disposed)
            {
                return;
            }
            this._Str_6511();
            var k:Boolean;
            var _local_6:GroupItem = this._model._Str_3968();
            if (((!(_local_6 == null)) && (!(_local_6._Str_3205() == null))))
            {
                if (_local_6._Str_4405 >= 0)
                {
                    _local_2 = _local_6._Str_5087(_local_6._Str_4405);
                    if (!_local_2)
                    {
                        _local_2 = _local_6._Str_3205();
                    }
                }
                else
                {
                    _local_2 = _local_6._Str_3205();
                }
                k = true;
                _local_9 = this._roomEngine.getWallItemType(_local_2.type);
                this._view.findChildByName("nextItemButton").visible = (this._view.findChildByName("viewItemButton").visible = ((_local_9) && (!(_local_9.indexOf("external_image_wallitem") == -1))));
                this._view.findChildByName("furni_preview_widget").visible = true;
                _local_10 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_WALL_TYPE);
                _local_11 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                _local_12 = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId, RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                _local_10 = (((_local_10) && (_local_10.length > 0)) ? _local_10 : "101");
                _local_11 = (((_local_11) && (_local_11.length > 0)) ? _local_11 : "101");
                _local_12 = (((_local_12) && (_local_12.length > 0)) ? _local_12 : "1.1");
                this._roomPreviewer.reset(false);
                this._roomPreviewer.updateObjectRoom(_local_11, _local_10, _local_12);
                if ((((_local_2.category == FurniCategory._Str_3639) || (_local_2.category == FurniCategory._Str_3683)) || (_local_2.category == FurniCategory._Str_3432)))
                {
                    this._roomPreviewer.updateRoomWallsAndFloorVisibility(true, true);
                    _local_16 = ((_local_2.category == FurniCategory._Str_3683) ? _local_6.stuffData.getLegacyString() : _local_11);
                    _local_17 = ((_local_2.category == FurniCategory._Str_3639) ? _local_6.stuffData.getLegacyString() : _local_10);
                    _local_18 = ((_local_2.category == FurniCategory._Str_3432) ? _local_6.stuffData.getLegacyString() : _local_12);
                    this._roomPreviewer.updateObjectRoom(_local_16, _local_17, _local_18);
                    if (_local_2.category == FurniCategory._Str_3432)
                    {
                        _local_19 = this._model.controller._Str_18225("ads_twi_windw", ProductTypeEnum.WALL);
                        this._roomPreviewer.addWallItemIntoRoom(_local_19.id, new Vector3d(90, 0, 0), _local_19.customParams);
                    }
                }
                else
                {
                    if (_local_6._Str_2770)
                    {
                        this._roomPreviewer.updateRoomWallsAndFloorVisibility(true, true);
                        this._roomPreviewer.addWallItemIntoRoom(_local_6.type, new Vector3d(90, 0, 0), _local_2.stuffData.getLegacyString());
                    }
                    else
                    {
                        this._roomPreviewer.updateRoomWallsAndFloorVisibility(false, true);
                        this._roomPreviewer.addFurnitureIntoRoom(_local_6.type, new Vector3d(90, 0, 0), _local_6.stuffData, _local_6._Str_2794.toString());
                    }
                }
                _local_3 = (this._view.findChildByName("tradeable_icon") as IStaticBitmapWrapperWindow);
                _local_4 = (this._view.findChildByName("tradeable_number") as ITextWindow);
                _local_5 = (this._view.findChildByName("tradeable_info_region") as IRegionWindow);
                if ((((!(_local_3 == null)) && (!(_local_4 == null))) && (!(_local_5 == null))))
                {
                    _local_13 = _local_6._Str_24914();
                    if (_local_13 == 0)
                    {
                        _local_3.assetUri = "inventory_furni_no_trade_icon";
                        _local_4.visible = false;
                        _local_5._Str_2613 = "${inventory.furni.preview.not_tradeable}";
                        _local_4.filters = [];
                    }
                    else
                    {
                        _local_3.assetUri = "inventory_furni_trade_icon";
                        _local_4.visible = true;
                        _local_4.text = String(_local_13);
                        _local_5._Str_2613 = "${inventory.furni.preview.tradeable_amount}";
                        _local_4.filters = [new GlowFilter(0xFFFFFF, 1, 3, 3, 300)];
                    }
                }
                _local_3 = (this._view.findChildByName("recyclable_icon") as IStaticBitmapWrapperWindow);
                _local_4 = (this._view.findChildByName("recyclable_number") as ITextWindow);
                _local_5 = (this._view.findChildByName("recyclable_info_region") as IRegionWindow);
                if ((((!(_local_3 == null)) && (!(_local_4 == null))) && (!(_local_5 == null))))
                {
                    _local_13 = _local_6._Str_22135();
                    if (_local_13 == 0)
                    {
                        _local_3.assetUri = "inventory_furni_no_recycle_icon";
                        _local_4.visible = false;
                        _local_5._Str_2613 = "${inventory.furni.preview.not_recyclable}";
                        _local_4.filters = [];
                    }
                    else
                    {
                        _local_3.assetUri = "inventory_furni_recycle_icon";
                        _local_4.visible = true;
                        _local_4.text = String(_local_13);
                        _local_5._Str_2613 = "${inventory.furni.preview.recyclable_amount}";
                        _local_4.filters = [new GlowFilter(0xFFFFFF, 1, 3, 3, 300)];
                    }
                }
                _local_14 = IWidgetWindow(this._view.findChildByName("unique_limited_item_overlay_widget"));
                if (((_local_2.stuffData) && (_local_2.stuffData.uniqueSerialNumber > 0)))
                {
                    if (this._limitedItemOverlay == null)
                    {
                        this._limitedItemOverlay = _Str_3338(_local_14.widget);
                    }
                    this._limitedItemOverlay._Str_3442 = _local_2.stuffData.uniqueSerialNumber;
                    this._limitedItemOverlay._Str_4345 = _local_2.stuffData._Str_5330;
                    _local_14.visible = true;
                }
                else
                {
                    _local_14.visible = false;
                }
                _local_15 = IWidgetWindow(this._view.findChildByName("rarity_item_overlay_widget"));
                if (((_local_2.stuffData) && (_local_2.stuffData.rarityLevel >= 0)))
                {
                    if (this._rarityItemOverlay == null)
                    {
                        this._rarityItemOverlay = _Str_4520(_local_15.widget);
                    }
                    this._rarityItemOverlay.rarityLevel = _local_2.stuffData.rarityLevel;
                    _local_15.visible = true;
                }
                else
                {
                    _local_15.visible = false;
                }
            }
            else
            {
                this._view.findChildByName("furni_preview_widget").visible = (this._view.findChildByName("nextItemButton").visible = (this._view.findChildByName("viewItemButton").visible = false));
                _local_3 = (this._view.findChildByName("tradeable_icon") as IStaticBitmapWrapperWindow);
                _local_4 = (this._view.findChildByName("tradeable_number") as ITextWindow);
                _local_5 = (this._view.findChildByName("tradeable_info_region") as IRegionWindow);
                if ((((_local_3) && (_local_4)) && (_local_5)))
                {
                    _local_3.assetUri = "";
                    _local_4.visible = false;
                }
                _local_3 = (this._view.findChildByName("recyclable_icon") as IStaticBitmapWrapperWindow);
                _local_4 = (this._view.findChildByName("recyclable_number") as ITextWindow);
                _local_5 = (this._view.findChildByName("recyclable_info_region") as IRegionWindow);
                if ((((_local_3) && (_local_4)) && (_local_5)))
                {
                    _local_3.assetUri = "";
                    _local_4.visible = false;
                }
            }
            var _local_7:Boolean = this._model._Str_7553;
            this._Str_20866(k);
            if (((_local_6) && (_local_2)))
            {
                this._view.findChildByName("furni_name").caption = _local_6.name;
                if (((_local_2) && (this._roomEngine.getWallItemType(_local_2.type) == "external_image_wallitem")))
                {
                    this._view.findChildByName("furni_description").caption = _local_2.stuffData.getJSONValue("m");
                }
                else
                {
                    this._view.findChildByName("furni_description").caption = _local_6.description;
                }
            }
            else
            {
                this._view.findChildByName("furni_name").caption = "";
                this._view.findChildByName("furni_description").caption = "";
            }
            var _local_8:ITextWindow = (this._view.findChildByName("furni_extra") as ITextWindow);
            if (_local_8 != null)
            {
                if ((((!(_local_2 == null)) && (!(_local_2.stuffData == null))) && (_local_2.stuffData.rarityLevel >= 0)))
                {
                    _local_20 = (_local_2.stuffData as MapStuffData).getValue("rarity");
                    if (_local_20 != null)
                    {
                        this._windowManager.registerLocalizationParameter("inventory.rarity", "rarity", String(_local_2.stuffData.rarityLevel));
                        _local_8.text = this._model.localization.getLocalization("inventory.rarity");
                        _local_8.visible = true;
                    }
                }
                else
                {
                    _local_8.text = "";
                }
            }
            this._Str_19739();
        }

        public function _Str_12834(k:GroupItem):void
        {
            if (this._view == null)
            {
                return;
            }
            if (this._view.disposed)
            {
                return;
            }
            var _local_2:FurnitureItem = k._Str_3205();
            if (_local_2._Str_2770)
            {
                this._roomPreviewer.addWallItemIntoRoom(_local_2.type, new Vector3d(90, 0, 0), _local_2.stuffData.getLegacyString());
            }
            else
            {
                this._roomPreviewer.addFurnitureIntoRoom(_local_2.type, new Vector3d(90, 0, 0), _local_2.stuffData);
            }
            this._placeInRoomButton.disable();
            this._offerInTradingButton.disable();
            this._offerInTradingCountButton.disable();
        }

        public function _Str_18112(k:Vector.<GroupItem>):void
        {
            if (this._grid)
            {
                this._grid._Str_25722(k);
            }
        }

        public function _Str_7221():void
        {
            if (((this._view == null) || (this._view.disposed)))
            {
                return;
            }
            var k:IDropMenuWindow = (this._view.findChildByName("filter.options") as IDropMenuWindow);
            var _local_2:IDropMenuWindow = (this._view.findChildByName("placement.options") as IDropMenuWindow);
            var _local_3:String = this._view.findChildByName("filter").caption;
            var _local_4:String = k._Str_4487()[k.selection];
            this._grid._Str_25694(k.selection, _local_4, this._model._Str_22702, _local_3, _local_2.selection);
        }

        public function _Str_23210(k:String):void
        {
            var _local_2:IDropMenuWindow = (this._view.findChildByName("filter.options") as IDropMenuWindow);
            var _local_3:IDropMenuWindow = (this._view.findChildByName("placement.options") as IDropMenuWindow);
            _local_2.selection = 0;
            switch (k)
            {
                case InventoryCategory.FURNI:
                    _local_3.selection = ((_local_3.numMenuItems > 2) ? 2 : 0);
                    _local_3.disable();
                    break;
                case InventoryCategory.RENTABLES:
                    _local_3.selection = this._rentablesPlacementSelection;
                    _local_3.enable();
                    break;
            }
            if (this._lastCategory != k)
            {
                this._view.findChildByName("filter").caption = "";
                this._view.findChildByName("clear_filter_button").visible = false;
            }
            this._lastCategory = k;
            this._Str_7221();
        }

        private function init():void
        {
            this._view = this._model.controller.view._Str_9043(InventoryCategory.FURNI);
            this._view.visible = false;
            this._view.procedure = this._Str_3328;
            var k:IItemGridWindow = (this._view.findChildByName("item_grid") as IItemGridWindow);
            var _local_2:IItemListWindow = (this._view.findChildByName("item_grid_pages") as IItemListWindow);
            this._grid = new FurniGridView(k, _local_2);
            this._Str_23939();
            this._buttonList = (this._view.findChildByName("preview_element_list") as IItemListWindow);
            this._placeInRoomButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("placeinroom_btn")) as IButtonWindow);
            this._extendRentPeriodButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("extendrent_btn")) as IButtonWindow);
            this._buyRentedItemButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("buyrenteditem_btn")) as IButtonWindow);
            this._gotoRoomButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("goto_room_btn")) as IButtonWindow);
            this._useFurnitureButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("use_btn")) as IButtonWindow);
            this._offerInTradingCountButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("offertotrade_cnt")) as ITextFieldWindow);
            this._offerInTradingButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("offertotrade_btn")) as IButtonWindow);
            this._sellInMarketplaceButton = (this._buttonList.removeListItem(this._buttonList.getListItemByName("sell_btn")) as IButtonWindow);
            var _local_3:_Str_4709 = ((this._view.findChildByName("furni_preview_widget") as IWidgetWindow).widget as _Str_4709);
            this._roomPreviewer = _local_3._Str_26451;
            this._model.controller.registerUpdateReceiver(this, 1);
            this._Str_7636();
            this._isInitialized = true;
        }

        private function _Str_24626():void
        {
            var k:IWidgetWindow = (this._view.findChildByName("furni_preview_widget") as IWidgetWindow);
            var _local_2:_Str_4709 = ((this._view.findChildByName("furni_preview_widget") as IWidgetWindow).widget as _Str_4709);
            _local_2._Str_26451.modifyRoomCanvas(k.width, k.height);
        }

        private function _Str_20866(k:Boolean):void
        {
            if (this._model._Str_7553)
            {
                this._Str_24626();
            }
            this._parser0();
            var _local_2:Boolean = this._model._Str_7553;
            var _local_3:GroupItem = this._model._Str_3968();
            var _local_4:FurnitureItem;
            if (_local_3)
            {
                _local_4 = _local_3._Str_3205();
            }
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IFurnitureData = this._model.controller.getFurnitureData(_local_4.type, ((_local_4._Str_2770) ? ProductTypeEnum.WALL : ProductTypeEnum.FLOOR));
            var _local_6:Boolean = ((((((k) && (this._marketplace)) && (this._marketplace.enabled)) && (_local_4.sellable)) && (!(this._model.controller._Str_2627.isAccountSafetyLocked()))) && (!(_local_2)));
            var _local_7:Boolean = (((this._model._Str_7411) && (k)) && (((((_local_4.category == FurniCategory._Str_6096) || (_local_4.category == FurniCategory._Str_7297)) || (_local_4.category == FurniCategory._Str_7954)) || (_local_4.category == FurniCategory._Str_7696)) || (_local_4.category == FurniCategory._Str_6915)));
            var _local_8:Boolean = true;
            if (_local_4.rentable)
            {
                if (_local_4.flatId > -1)
                {
                    _local_8 = false;
                }
            }
            var _local_9:* = (_local_4.flatId > -1);
            var _local_10:Boolean = ((((_local_4.rentable) && (_local_8)) && (_local_5)) && (_local_5.rentCouldBeUsedForBuyout));
            var _local_11:Boolean = ((((_local_4.rentable) && (_local_8)) && (_local_5)) && (_local_5.purchaseCouldBeUsedForBuyout));
            if (((_local_5) && (_local_5.isExternalImageType)))
            {
                _local_6 = false;
            }
            this._Str_6690(this._placeInRoomButton, ((!(_local_2)) && (_local_8)));
            this._Str_6690(this._extendRentPeriodButton, ((!(_local_2)) && (_local_10)));
            this._Str_6690(this._buyRentedItemButton, ((!(_local_2)) && (_local_11)));
            this._Str_6690(this._gotoRoomButton, ((!(_local_2)) && (_local_9)));
            this._Str_6690(this._offerInTradingCountButton, ((_local_2) && (this._model.controller.getBoolean("multi.item.trading.enabled"))));
            this._Str_6690(this._offerInTradingButton, _local_2);
            this._Str_6690(this._sellInMarketplaceButton, _local_6);
            this._Str_6690(this._useFurnitureButton, _local_7);
            if (((k) && (this._model._Str_7411)))
            {
                this._placeInRoomButton.enable();
            }
            else
            {
                this._placeInRoomButton.disable();
            }
            if (((((k) && (!(_local_3 == null))) && (!(_local_4 == null))) && (this._model._Str_16742())))
            {
                if (((_local_3.getUnlockedCount()) && (_local_4._Str_8386)))
                {
                    this._offerInTradingButton.enable();
                    this._offerInTradingCountButton.enable();
                }
                else
                {
                    this._offerInTradingButton.disable();
                    this._offerInTradingCountButton.disable();
                }
            }
            else
            {
                this._offerInTradingButton.disable();
                this._offerInTradingCountButton.disable();
            }
        }

        private function _Str_6690(k:IInteractiveWindow, _arg_2:Boolean):void
        {
            if (this._buttonList.getListItemByName(k.name) == null)
            {
                if (_arg_2)
                {
                    this._buttonList.addListItem(k);
                }
            }
            else
            {
                if (!_arg_2)
                {
                    this._buttonList.removeListItem(k);
                }
            }
        }

        private function _parser0():void
        {
            this._buttonList.removeListItem(this._placeInRoomButton);
            this._buttonList.removeListItem(this._extendRentPeriodButton);
            this._buttonList.removeListItem(this._buyRentedItemButton);
            this._buttonList.removeListItem(this._gotoRoomButton);
            this._buttonList.removeListItem(this._useFurnitureButton);
            this._buttonList.removeListItem(this._offerInTradingCountButton);
            this._buttonList.removeListItem(this._offerInTradingButton);
            this._buttonList.removeListItem(this._sellInMarketplaceButton);
        }

        private function _Str_6511():void
        {
            if (!this._isInitialized)
            {
                return;
            }
            if (((!(this._model.controller._Str_9777 == InventoryCategory.FURNI)) && (!(this._model.controller._Str_9777 == InventoryCategory.RENTABLES))))
            {
                return;
            }
            var k:IWindowContainer = this._model.controller.view._Str_10034;
            var _local_2:IWindowContainer = this._model.controller.view._Str_11062;
            var _local_3:IWindowContainer = (this._view.findChildByName("grid_container") as IWindowContainer);
            var _local_4:IWindowContainer = (this._view.findChildByName("preview_container") as IWindowContainer);
            var _local_5:IWindowContainer = (this._view.findChildByName("options_container") as IWindowContainer);
            switch (this._currentState)
            {
                case _Str_4299:
                    if (k)
                    {
                        k.visible = true;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    }
                    _local_3.visible = false;
                    _local_4.visible = false;
                    _local_5.visible = false;
                    return;
                case _Str_5391:
                    if (k)
                    {
                        k.visible = false;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = true;
                    }
                    _local_3.visible = false;
                    _local_4.visible = false;
                    _local_5.visible = false;
                    return;
                case _Str_4660:
                    if (k)
                    {
                        k.visible = false;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    }
                    _local_3.visible = true;
                    _local_4.visible = true;
                    _local_5.visible = true;
                    return;
            }
        }

        private function _Str_25193():void
        {
            this._model._Str_3968()._Str_4405++;
            this._Str_2944();
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:GroupItem;
            var _local_4:FurnitureItem;
            var _local_5:int;
            var _local_6:GroupItem;
            var _local_7:IFurnitureItem;
            var _local_8:WindowKeyboardEvent;
            var _local_9:IDropMenuWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "placeinroom_btn":
                    case "furni_preview_region":
                        if (!this._model._Str_7553)
                        {
                            this._model._Str_5337(false);
                        }
                        break;
                    case "nextItemButton":
                        this._Str_25193();
                        break;
                    case "viewItemButton":
                        _local_3 = this._model._Str_3968();
                        _local_4 = _local_3._Str_5087(_local_3._Str_4405);
                        if (!_local_4)
                        {
                            _local_4 = _local_3._Str_3205();
                        }
                        this._roomEngine.showUseProductSelection(_local_4.ref, _local_4.type, _local_4.id);
                        break;
                    case "goto_room_btn":
                        this._model._Str_10094();
                        break;
                    case "offertotrade_btn":
                        _local_5 = Math.max(1, int(this._offerInTradingCountButton.caption));
                        if (_local_5 != int(this._offerInTradingCountButton.caption))
                        {
                            this._offerInTradingCountButton.caption = String(_local_5);
                        }
                        this._model._Str_21349(_local_5, this._offerInTradingCountButton);
                        break;
                    case "sell_btn":
                        this._model._Str_25554();
                        break;
                    case "use_btn":
                        this._model.showUseProductSelection();
                        break;
                    case "extendrent_btn":
                        this._model._Str_25502();
                        break;
                    case "buyrenteditem_btn":
                        this._model._Str_22829();
                        break;
                    case "clear_filter_button":
                        this._view.findChildByName("filter").caption = "";
                        _arg_2.visible = false;
                        this._Str_7221();
                        break;
                    default:
                        this._model._Str_5298();
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.DOWN)
                {
                    switch (_arg_2.name)
                    {
                        case "furni_preview_region":
                            _local_6 = this._model._Str_3968();
                            if (_local_6 == null)
                            {
                                return;
                            }
                            _local_7 = _local_6._Str_3205();
                            if ((((_local_7.category == FurniCategory._Str_3639) || (_local_7.category == FurniCategory._Str_3683)) || (_local_7.category == FurniCategory._Str_3432)))
                            {
                                return;
                            }
                            if (!this._model._Str_7553)
                            {
                                this._model._Str_5337(false);
                            }
                            break;
                    }
                }
                else
                {
                    if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP)
                    {
                        _local_8 = (k as WindowKeyboardEvent);
                        switch (_arg_2.name)
                        {
                            case "filter":
                                this._view.findChildByName("clear_filter_button").visible = (_arg_2.caption.length > 0);
                                if (_local_8.keyCode == 13)
                                {
                                    this._Str_7221();
                                }
                                break;
                        }
                    }
                }
            }
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                switch (_arg_2.name)
                {
                    case "filter.options":
                        this._Str_7221();
                        return;
                    case "placement.options":
                        _local_9 = (this._view.findChildByName("placement.options") as IDropMenuWindow);
                        if (this._model.controller._Str_9777 == InventoryCategory.RENTABLES)
                        {
                            this._rentablesPlacementSelection = _local_9.selection;
                        }
                        this._Str_7221();
                        return;
                }
            }
        }

        private function _Str_23939():void
        {
            var k:IDropMenuWindow = (this._view.findChildByName("filter.options") as IDropMenuWindow);
            var _local_2:Array = [];
            _local_2.push(this._model.controller.localization.getLocalization("inventory.filter.option.everything", "Everything"));
            _local_2.push(this._model.controller.localization.getLocalization("inventory.furni.tab.floor", "Floor"));
            _local_2.push(this._model.controller.localization.getLocalization("inventory.furni.tab.wall", "Wall"));
            k.populate(_local_2);
            k.selection = 0;
            var _local_3:IDropMenuWindow = (this._view.findChildByName("placement.options") as IDropMenuWindow);
            _local_2 = [];
            _local_2.push(this._model.controller.localization.getLocalization("inventory.placement.option.anywhere", "Anywhere"));
            _local_2.push(this._model.controller.localization.getLocalization("inventory.placement.option.inroom", "In room"));
            _local_2.push(this._model.controller.localization.getLocalization("inventory.placement.option.notinroom", "Not in room"));
            _local_3.populate(_local_2);
            _local_3.selection = 2;
            this._rentablesPlacementSelection = 2;
            this._view.findChildByName("filter").caption = "";
            this._view.findChildByName("items.shown").visible = false;
            this._view.invalidate();
        }

        public function _Str_19739():void
        {
            var k:GroupItem = this._model._Str_3968();
            var _local_2:FurnitureItem;
            if (k)
            {
                _local_2 = k._Str_3205();
            }
            if (_local_2 == null)
            {
                return;
            }
            if (!_local_2.rentable)
            {
                return;
            }
            var _local_3:IWindow = (this._view.findChildByName("furni_extra") as ITextWindow);
            _local_3.visible = true;
            if (_local_2.hasRentPeriodStarted)
            {
                this._model.controller.localization.registerParameter("inventory.rent.expiration", "time", FriendlyTime.format(this._model.controller.localization, _local_2.secondsToExpiration));
                _local_3.caption = this._model.controller.localization.getLocalization("inventory.rent.expiration");
            }
            else
            {
                this._model.controller.localization.registerParameter("inventory.rent.inactive", "time", FriendlyTime.format(this._model.controller.localization, _local_2.secondsToExpiration));
                _local_3.caption = this._model.controller.localization.getLocalization("inventory.rent.inactive");
            }
        }

        public function update(k:uint):void
        {
            if (this._roomPreviewer != null)
            {
                this._roomPreviewer.updatePreviewRoomView();
            }
        }
    }
}
