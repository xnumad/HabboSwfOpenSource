package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingViewStateEnum;

    public class CraftingMixerItemRenderer extends FurniThumbnailRendererBase 
    {
        private var _inventoryId:int;

        public function CraftingMixerItemRenderer(k:CraftingFurnitureItem, _arg_2:IWindowContainer, _arg_3:CraftingWidget)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function onTriggered():void
        {
            if ((((!(_Str_2268)) || (_Str_2268.craftingInProgress)) || (_Str_2268.inventoryDirty)))
            {
                return;
            }
            if (this._inventoryId == 0)
            {
                _Str_2268.setInfoState(CraftingViewStateEnum._Str_15827, furnitureData);
                return;
            }
            if (_Str_2268.inSecretRecipeMode)
            {
                _Str_2268.mixerCtrl.removeListItem(this);
            }
        }

        public function returnItemToInventory():void
        {
            if (this._inventoryId != 0)
            {
                _data.returnItemToInventory(this._inventoryId);
            }
            this.dispose();
        }

        override public function updateItemCount():void
        {
            _Str_14878((!(this._inventoryId == 0)));
        }

        public function get _Str_18598():int
        {
            return this._inventoryId;
        }

        public function set _Str_18598(k:int):void
        {
            this._inventoryId = k;
            this.updateItemCount();
        }
    }
}
