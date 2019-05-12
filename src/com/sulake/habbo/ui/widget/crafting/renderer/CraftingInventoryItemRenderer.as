package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;

    public class CraftingInventoryItemRenderer extends FurniThumbnailRendererBase 
    {
        public function CraftingInventoryItemRenderer(k:CraftingFurnitureItem, _arg_2:IWindowContainer, _arg_3:CraftingWidget)
        {
            super(k, _arg_2, _arg_3);
            _Str_22233();
        }

        override protected function onTriggered():void
        {
            if ((((!(_Str_2268)) || (!(content))) || (_Str_2268.craftingInProgress)))
            {
                return;
            }
            _Str_2268.showCraftableProduct(content);
        }
    }
}
