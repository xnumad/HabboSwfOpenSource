//com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent

package com.sulake.habbo.catalog.navigation.events{
    import flash.events.Event;

    public class CatalogPageOpenedEvent extends Event {

        public static const CATALOG_PAGE_OPENED:String;

        private var _pageId:int;
        private var _pageLocalization:String;

        public function CatalogPageOpenedEvent(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get pageId():int;

        public function get pageLocalization():String;


    }
}//package com.sulake.habbo.catalog.navigation.events

