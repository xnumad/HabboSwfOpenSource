package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.widget.crafting.renderer.CraftingInventoryItemRenderer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftinRecipeIngredientParser;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingViewStateEnum;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.*;

    public class CraftingRecipeListController extends CraftingGridControllerBase 
    {
        private var _craftableProduct:CraftingFurnitureItem;
        private var _items:Vector.<CraftingInventoryItemRenderer>;

        public function CraftingRecipeListController(k:CraftingWidget)
        {
            super(k);
            this._items = new Vector.<CraftingInventoryItemRenderer>(0);
        }

        override public function dispose():void
        {
            this.clearItems();
            this._craftableProduct = null;
            super.dispose();
        }

        public function clearItems():void
        {
            var k:CraftingInventoryItemRenderer;
            if (this._items)
            {
                for each (k in this._items)
                {
                    k.dispose();
                }
                this._items.length = 0;
            }
            if (this.container)
            {
                this.container.destroyGridItems();
            }
        }

        public function _Str_17264(k:Vector.<CraftingFurnitureItem>):void
        {
            var _local_4:CraftingInventoryItemRenderer;
            if (!this.container)
            {
                return;
            }
            var _local_2:IWindowContainer = getItemTemplate();
            this.container._Str_3956();
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = new CraftingInventoryItemRenderer(k[_local_3], (_local_2.clone() as IWindowContainer), _Str_2268);
                this.container._Str_2816(_local_4.window);
                this._items.push(_local_4);
                _local_3++;
            }
        }

        public function _Str_24714(k:CraftingFurnitureItem, _arg_2:Vector.<CraftinRecipeIngredientParser>):void
        {
            var _local_5:int;
            var _local_6:CraftinRecipeIngredientParser;
            var _local_7:IFurnitureData;
            var _local_8:Array;
            var _local_9:int;
            var _local_10:CraftingFurnitureItem;
            this._craftableProduct = k;
            if (!_arg_2)
            {
                _Str_2268.setInfoState(CraftingViewStateEnum._Str_9812);
                return;
            }
            _Str_2268.mixerCtrl.clearItems();
            var _local_3:Boolean = true;
            var _local_4:Vector.<String> = new Vector.<String>(0);
            for each (_local_6 in _arg_2)
            {
                _local_7 = _Str_2268.sessionDataManager.getFloorItemDataByName(_local_6.itemName);
                if (!_local_7)
                {
                    return;
                }
                _local_8 = _Str_2268.handler.container.inventory.getNonRentedInventoryIds(InventoryCategory.FURNI, _local_7.id);
                if (((_local_8 == null) || (_local_8.length < _local_6.count)))
                {
                    _local_3 = false;
                }
                _local_9 = 0;
                while (_local_9 < _local_6.count)
                {
                    _local_10 = new CraftingFurnitureItem(null, _local_7);
                    if (((_local_8) && (_local_8.length)))
                    {
                        _local_5 = _local_8.shift();
                    }
                    else
                    {
                        _local_5 = 0;
                        if (_local_4.indexOf(_local_7.localizedName) == -1)
                        {
                            _local_4.push(_local_7.localizedName);
                        }
                    }
                    _Str_2268.mixerCtrl.addItemToMixer(_local_10, _local_5);
                    _local_9++;
                }
            }
            if (_local_3)
            {
                _Str_2268.setInfoState(CraftingViewStateEnum._Str_15345, this._craftableProduct.furnitureData);
            }
            else
            {
                _Str_2268.setInfoState(CraftingViewStateEnum._Str_9812, this._craftableProduct.furnitureData, _local_4);
            }
        }

        private function get container():IItemGridWindow
        {
            return (mainWindow) ? (mainWindow.findChildByName("itemgrid_products") as IItemGridWindow) : null;
        }
    }
}
