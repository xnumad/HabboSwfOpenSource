//com.sulake.habbo.tablet.catalog.navigation.RequestedPage

package com.sulake.habbo.tablet.catalog.navigation{
    public class RequestedPage {

        public static const REQUEST_TYPE_NONE:int;
        public static const REQUEST_TYPE_ID:int;
        public static const REQUEST_TYPE_NAME:int;

        private var _requestType:int;
        private var _requestId:int;
        private var _requestedOfferId:int;
        private var _requestName:String;

        public function RequestedPage();

        public function set requestById(k:int):void;

        public function set requestByName(k:String):void;

        public function resetRequest():void;

        public function get requestType():int;

        public function get requestId():int;

        public function get requestedOfferId():int;

        public function set requestedOfferId(k:int):void;

        public function get requestName():String;


    }
}//package com.sulake.habbo.tablet.catalog.navigation

