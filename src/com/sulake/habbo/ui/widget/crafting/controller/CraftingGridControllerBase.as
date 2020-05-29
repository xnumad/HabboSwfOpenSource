package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window.IWindowContainer;

    public class CraftingGridControllerBase 
    {
        protected var _widget:CraftingWidget;

        public function CraftingGridControllerBase(k:CraftingWidget)
        {
            this._widget = k;
        }

        public function dispose():void
        {
            this._widget = null;
        }

        public function get mainWindow():IWindowContainer
        {
            return this._widget.window;
        }

        public function getItemTemplate():IWindowContainer
        {
            return this._widget._Str_24863;
        }
    }
}
