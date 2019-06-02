package com.sulake.habbo.ui.widget.crafting
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingInventoryListController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingRecipeListController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingMixerController;
    import com.sulake.habbo.ui.widget.crafting.controller.CraftingInfoController;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingViewStateEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingResultObjectParser;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftinRecipeIngredientParser;
    import com.sulake.habbo.ui.handler.CraftingWidgetHandler;
    import __AS3__.vec.*;

    public class CraftingWidget extends ConversionTrackingWidget 
    {
        public static const _Str_17512:int = 0;
        public static const _Str_8972:int = 1;
        public static const _Str_12462:int = 2;

        private var _roomUI:RoomUI;
        private var _selectedProduct:CraftingFurnitureItem;
        private var _modal:_Str_2784;
        private var _itemTemplate:IWindowContainer;
        private var _inventoryCtrl:CraftingInventoryListController;
        private var _recipeCtrl:CraftingRecipeListController;
        private var _mixerCtrl:CraftingMixerController;
        private var _infoCtrl:CraftingInfoController;
        private var _craftingMode:int = 0;

        public function CraftingWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:RoomUI)
        {
            super(k, _arg_2, assets, localizations);
            this._roomUI = _arg_3;
            this._inventoryCtrl = new CraftingInventoryListController(this);
            this._recipeCtrl = new CraftingRecipeListController(this);
            this._mixerCtrl = new CraftingMixerController(this);
            this._infoCtrl = new CraftingInfoController(this);
            _assets = _arg_3.assets;
            this.handler.widget = this;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this.hide();
            this._roomUI = null;
            if (this._inventoryCtrl)
            {
                this._inventoryCtrl.dispose();
                this._inventoryCtrl = null;
            }
            if (this._recipeCtrl)
            {
                this._recipeCtrl.dispose();
                this._recipeCtrl = null;
            }
            if (this._mixerCtrl)
            {
                this._mixerCtrl.dispose();
                this._mixerCtrl = null;
            }
            if (this._infoCtrl)
            {
                this._infoCtrl.dispose();
                this._infoCtrl = null;
            }
            if (this._itemTemplate)
            {
                this._itemTemplate.dispose();
                this._itemTemplate = null;
            }
            super.dispose();
        }

        public function hide():void
        {
            this.handler._Str_15726();
            this._mixerCtrl.clearItems();
            this._inventoryCtrl.clearItems();
            this._recipeCtrl.clearItems();
            if (this.craftingInProgress)
            {
                this._infoCtrl._Str_19691();
            }
            this._craftingMode = _Str_17512;
            if (this._modal != null)
            {
                this._modal.dispose();
                this._modal = null;
            }
        }

        private function _Str_7718():void
        {
            if (this.window != null)
            {
                return;
            }
            this._modal = windowManager.buildModalDialogFromXML(XML(assets.getAssetByName("craftingwidget_xml").content));
            if (((!(this._modal)) || (!(this._modal._Str_2429))))
            {
                return;
            }
            var k:IWindow = this.window.findChildByTag("close");
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            var _local_2:IItemGridWindow = (this.window.findChildByName("itemgrid_products") as IItemGridWindow);
            this._itemTemplate = (_local_2._Str_2830(0) as IWindowContainer);
            _local_2._Str_4725(this._itemTemplate);
            this.window.procedure = this._Str_3055;
            this.window.center();
        }

        public function _Str_18732(k:Vector.<CraftingFurnitureItem>):void
        {
            this._inventoryCtrl._Str_18732(k);
        }

        public function _Str_17264(k:Vector.<CraftingFurnitureItem>):void
        {
            this._recipeCtrl._Str_17264(k);
        }

        public function setInfoState(k:int, ... _args):void
        {
            if (this._infoCtrl)
            {
                this._infoCtrl.setState(k, _args);
            }
        }

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.DOWN)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.hide();
                    return;
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.hide();
        }

        public function _Str_5311(k:String):void
        {
            var _local_2:ITextWindow = ((this.window) ? (this.window.findChildByName("header_mixer") as ITextWindow) : null);
            if (_local_2)
            {
                _local_2.text = k;
            }
        }

        public function _Str_22471():void
        {
            if (this.window)
            {
                return;
            }
            this._Str_7718();
            this._Str_5311("");
            this.setInfoState(CraftingViewStateEnum._Str_15900);
        }

        public function _Str_24786(k:Vector.<CraftingResultObjectParser>, _arg_2:Vector.<String>, _arg_3:IRoomEngine, _arg_4:ISessionDataManager):void
        {
            var _local_5:Vector.<CraftingFurnitureItem>;
            var _local_6:String;
            var _local_7:IFurnitureData;
            var _local_8:CraftingResultObjectParser;
            var _local_9:CraftingFurnitureItem;
            var _local_10:Array;
            _local_5 = new Vector.<CraftingFurnitureItem>(0);
            for each (_local_6 in _arg_2)
            {
                _local_7 = _arg_4.getFloorItemDataByName(_local_6);
                if (_local_7)
                {
                    _local_9 = new CraftingFurnitureItem(null, _local_7);
                    _local_10 = this.handler.container.inventory.getNonRentedInventoryIds(InventoryCategory.FURNI, _local_9.typeId);
                    if (((_local_10) && (_local_10.length > 0)))
                    {
                        _local_9._Str_23988 = Vector.<int>(_local_10);
                    }
                    _local_5.push(_local_9);
                }
            }
            this._Str_18732(_local_5);
            _local_5 = new Vector.<CraftingFurnitureItem>(0);
            for each (_local_8 in k)
            {
                _local_7 = _arg_4.getFloorItemDataByName(_local_8.itemName);
                if (_local_7)
                {
                    _local_5.push(new CraftingFurnitureItem(_local_8.recipeName, _local_7));
                }
            }
            this._Str_17264(_local_5);
        }

        public function showCraftableProduct(k:CraftingFurnitureItem):void
        {
            this._selectedProduct = k;
            if (!this._selectedProduct)
            {
                return;
            }
            this._Str_5311(((this._selectedProduct.furnitureData) ? this._selectedProduct.furnitureData.localizedName : ""));
            this.handler._Str_25388(this._selectedProduct.productCode);
        }

        public function _Str_23442(k:Vector.<CraftinRecipeIngredientParser>):void
        {
            this._Str_24029();
            this._recipeCtrl._Str_24714(this._selectedProduct, k);
        }

        public function _Str_14796():void
        {
            if (this._mixerCtrl)
            {
                this._mixerCtrl.clearItems();
            }
        }

        public function mixerContentChanged(k:Vector.<int>):void
        {
            if (k.length > 0)
            {
                this.setInfoState(CraftingViewStateEnum._Str_9671);
                this.handler._Str_25351(k);
            }
            else
            {
                this.setInfoState(CraftingViewStateEnum._Str_8764);
            }
        }

        public function showSecretRecipeView():void
        {
            if (this._craftingMode != _Str_8972)
            {
                this._Str_14796();
            }
            this._craftingMode = _Str_8972;
            this._Str_5311("");
            this.setInfoState(CraftingViewStateEnum._Str_8764);
        }

        public function _Str_24029():void
        {
            if (this._craftingMode != _Str_12462)
            {
                this._Str_14796();
            }
            this._craftingMode = _Str_12462;
            this.setInfoState(CraftingViewStateEnum._Str_13644);
        }

        public function _Str_24348():void
        {
            switch (this._craftingMode)
            {
                case _Str_8972:
                    this.handler._Str_23682();
                    return;
                case _Str_12462:
                    this.handler._Str_23985();
                    return;
            }
        }

        public function _Str_24728():Vector.<int>
        {
            return this._mixerCtrl._Str_16929();
        }

        public function get inSecretRecipeMode():Boolean
        {
            return this._craftingMode == _Str_8972;
        }

        public function get craftingInProgress():Boolean
        {
            return this.handler.craftingInProgress;
        }

        public function get inventoryDirty():Boolean
        {
            return this.handler.inventoryDirty;
        }

        public function get _Str_24863():IWindowContainer
        {
            return this._itemTemplate;
        }

        public function get handler():CraftingWidgetHandler
        {
            return _Str_2470 as CraftingWidgetHandler;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this.handler.container.sessionDataManager;
        }

        public function get inventoryCtrl():CraftingInventoryListController
        {
            return this._inventoryCtrl;
        }

        public function get _Str_26346():CraftingRecipeListController
        {
            return this._recipeCtrl;
        }

        public function get mixerCtrl():CraftingMixerController
        {
            return this._mixerCtrl;
        }

        public function get _Str_11931():CraftingInfoController
        {
            return this._infoCtrl;
        }

        public function get window():IWindowContainer
        {
            return (this._modal) ? (this._modal._Str_2429 as IWindowContainer) : null;
        }
    }
}
