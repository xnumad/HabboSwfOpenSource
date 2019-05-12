package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;

    public class CraftingRecipeItemRenderer extends FurniThumbnailRendererBase 
    {
        public function CraftingRecipeItemRenderer(k:CraftingFurnitureItem, _arg_2:IWindowContainer, _arg_3:CraftingWidget)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function onTriggered():void
        {
            if ((((!(_Str_2268)) || (_Str_2268.craftingInProgress)) || (_Str_2268.inventoryDirty)))
            {
                return;
            }
            if (!_Str_2268.mixerCtrl.canAdd())
            {
                return;
            }
            var k:int = content.getItemToMixer();
            if (k == 0)
            {
                return;
            }
            _Str_2268.showSecretRecipeView();
            _Str_2268.mixerCtrl.addItemToMixer(content, k);
            _Str_2268.inventoryCtrl.updateItemCounts();
        }

        override public function updateItemCount():void
        {
            if (content)
            {
                _Str_21081(content.countInInventory);
                _Str_14878((content.countInInventory > 0));
            }
        }
    }
}
