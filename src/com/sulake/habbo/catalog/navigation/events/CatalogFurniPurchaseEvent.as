package com.sulake.habbo.catalog.navigation.events
{
    import flash.events.Event;

    public class CatalogFurniPurchaseEvent extends Event 
    {
        public static const CATALOG_FURNI_PURCHASE:String = "CATALOG_FURNI_PURCHASE";

        private var _localizationId:String;

        public function CatalogFurniPurchaseEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CATALOG_FURNI_PURCHASE, _arg_2, _arg_3);
            this._localizationId = k;
        }

        public function get localizationId():String
        {
            return this._localizationId;
        }
    }
}
