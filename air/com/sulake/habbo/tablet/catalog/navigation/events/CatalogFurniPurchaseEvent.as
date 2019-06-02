//com.sulake.habbo.tablet.catalog.navigation.events.CatalogFurniPurchaseEvent

package com.sulake.habbo.tablet.catalog.navigation.events{
    import flash.events.Event;

    public class CatalogFurniPurchaseEvent extends Event {

        public static const CATALOG_FURNI_PURCHASE:String;

        private var _localizationId:String;

        public function CatalogFurniPurchaseEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false);

        public function get localizationId():String;


    }
}//package com.sulake.habbo.tablet.catalog.navigation.events

