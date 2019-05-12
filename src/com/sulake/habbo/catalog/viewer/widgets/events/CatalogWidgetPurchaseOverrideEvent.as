package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetPurchaseOverrideEvent extends Event 
    {
        private var _callback:Function;

        public function CatalogWidgetPurchaseOverrideEvent(k:Function, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.PURCHASE_OVERRIDE, _arg_2, _arg_3);
            this._callback = k;
        }

        public function get callback():Function
        {
            return this._callback;
        }
    }
}
