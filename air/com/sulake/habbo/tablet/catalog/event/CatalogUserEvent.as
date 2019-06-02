//com.sulake.habbo.tablet.catalog.event.CatalogUserEvent

package com.sulake.habbo.tablet.catalog.event{
    public class CatalogUserEvent extends CatalogEvent {

        private var _userId:int;
        private var _userName:String;

        public function CatalogUserEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get userId():int;

        public function get userName():String;


    }
}//package com.sulake.habbo.tablet.catalog.event

