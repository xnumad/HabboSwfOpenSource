package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window.IWindowContainer;

    public class CraftingGridControllerBase 
    {
        protected var _Str_2268:CraftingWidget;

        public function CraftingGridControllerBase(k:CraftingWidget)
        {
            this._Str_2268 = k;
        }

        public function dispose():void
        {
            this._Str_2268 = null;
        }

        public function get mainWindow():IWindowContainer
        {
            return this._Str_2268.window;
        }

        public function getItemTemplate():IWindowContainer
        {
            return this._Str_2268._Str_24863;
        }
    }
}
