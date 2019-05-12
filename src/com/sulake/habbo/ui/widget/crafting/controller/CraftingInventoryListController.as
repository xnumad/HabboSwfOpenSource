package com.sulake.habbo.ui.widget.crafting.controller
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.widget.crafting.renderer.CraftingRecipeItemRenderer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.*;

    public class CraftingInventoryListController extends CraftingGridControllerBase 
    {
        private var _items:Vector.<CraftingRecipeItemRenderer>;

        public function CraftingInventoryListController(k:CraftingWidget)
        {
            super(k);
            this._items = new Vector.<CraftingRecipeItemRenderer>(0);
        }

        override public function dispose():void
        {
            this.clearItems();
            super.dispose();
        }

        public function clearItems():void
        {
            var k:CraftingRecipeItemRenderer;
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

        public function _Str_18732(k:Vector.<CraftingFurnitureItem>):void
        {
            var _local_4:CraftingRecipeItemRenderer;
            if (!this.container)
            {
                return;
            }
            var _local_2:IWindowContainer = getItemTemplate();
            this.container._Str_3956();
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = new CraftingRecipeItemRenderer(k[_local_3], (_local_2.clone() as IWindowContainer), _Str_2268);
                this.container._Str_2816(_local_4.window);
                this._items.push(_local_4);
                _local_3++;
            }
        }

        public function updateItemCounts():void
        {
            var k:CraftingRecipeItemRenderer;
            for each (k in this._items)
            {
                k.updateItemCount();
            }
        }

        private function get container():IItemGridWindow
        {
            return (mainWindow) ? (mainWindow.findChildByName("itemgrid_inventory") as IItemGridWindow) : null;
        }
    }
}
