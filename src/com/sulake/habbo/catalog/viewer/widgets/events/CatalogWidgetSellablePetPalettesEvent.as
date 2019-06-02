package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetSellablePetPalettesEvent extends Event 
    {
        private var _productCode:String;
        private var _sellablePalettes:Array;

        public function CatalogWidgetSellablePetPalettesEvent(k:String, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(CatalogWidgetEvent.SELLABLE_PET_PALETTES, _arg_3, _arg_4);
            this._productCode = k;
            this._sellablePalettes = _arg_2;
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get _Str_13588():Array
        {
            if (this._sellablePalettes != null)
            {
                return this._sellablePalettes.slice();
            }
            return [];
        }
    }
}
