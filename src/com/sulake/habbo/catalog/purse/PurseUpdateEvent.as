package com.sulake.habbo.catalog.purse
{
    import flash.events.Event;

    public class PurseUpdateEvent extends Event 
    {
        public static const CATALOG_PURSE_UPDATE:String = "catalog_purse_update";

        public function PurseUpdateEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(CATALOG_PURSE_UPDATE, k, _arg_2);
        }
    }
}
