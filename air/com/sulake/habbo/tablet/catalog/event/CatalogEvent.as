//com.sulake.habbo.tablet.catalog.event.CatalogEvent

package com.sulake.habbo.tablet.catalog.event{
    import flash.events.Event;

    public class CatalogEvent extends Event {

        public static const CATALOG_INITIALIZED:String;
        public static const CATALOG_NOT_READY:String;
        public static const CATALOG_NEW_ITEMS_SHOW:String;
        public static const CATALOG_NEW_ITEMS_HIDE:String;
        public static const CATALOG_USER_SELECTED:String;
        public static const CATALOG_BUILDER_MEMBERSHIP_EXPIRED:String;
        public static const CLOSE_REQUEST:String;
        public static const IAP_IDS_READY:String;

        public function CatalogEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false);

    }
}//package com.sulake.habbo.tablet.catalog.event

