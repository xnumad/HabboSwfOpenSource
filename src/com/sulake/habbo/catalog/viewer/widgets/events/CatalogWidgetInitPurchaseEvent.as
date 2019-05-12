package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetInitPurchaseEvent extends Event 
    {
        private var _enableBuyAsGift:Boolean = true;
        private var _userName:String;

        public function CatalogWidgetInitPurchaseEvent(k:Boolean=true, _arg_2:String=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(CatalogWidgetEvent.INIT_PURCHASE, _arg_3, _arg_4);
            this._enableBuyAsGift = k;
            this._userName = _arg_2;
        }

        public function get _Str_25955():Boolean
        {
            return this._enableBuyAsGift;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
