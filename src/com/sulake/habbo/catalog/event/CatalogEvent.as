package com.sulake.habbo.catalog.event
{
    import flash.events.Event;

    public class CatalogEvent extends Event 
    {
        public static const CATALOG_INITIALIZED:String = "CATALOG_INITIALIZED";
        public static const CATALOG_NOT_READY:String = "CATALOG_NOT_READY";
        public static const CATALOG_NEW_ITEMS_SHOW:String = "CATALOG_NEW_ITEMS_SHOW";
        public static const CATALOG_NEW_ITEMS_HIDE:String = "CATALOG_NEW_ITEMS_HIDE";
        public static const CATALOG_USER_SELECTED:String = "CATALOG_USER_SELECTED";
        public static const CATALOG_BUILDER_MEMBERSHIP_EXPIRED:String = "CATALOG_BUILDER_MEMBERSHIP_EXPIRED";
        public static const CATALOG_BUILDER_MEMBERSHIP_IN_GRACE:String = "CATALOG_BUILDER_MEMBERSHIP_IN_GRACE";
        public static const CATALOG_INVISIBLE_PAGE_VISITED:String = "CATALOG_INVISIBLE_PAGE_VISITED";

        public function CatalogEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
