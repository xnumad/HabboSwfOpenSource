package com.sulake.habbo.catalog.navigation
{
    public class RequestedPage 
    {
        public static const REQUEST_TYPE_NONE:int = 0;
        public static const REQUEST_TYPE_ID:int = 1;
        public static const REQUEST_TYPE_NAME:int = 2;

        private var _requestType:int;
        private var _requestId:int;
        private var _requestedOfferId:int;
        private var _requestName:String;

        public function RequestedPage()
        {
            this._requestType = REQUEST_TYPE_NONE;
        }

        public function set _Str_22771(k:int):void
        {
            this._requestType = REQUEST_TYPE_ID;
            this._requestId = k;
        }

        public function set _Str_23666(k:String):void
        {
            this._requestType = REQUEST_TYPE_NAME;
            this._requestName = k;
        }

        public function _Str_21345():void
        {
            this._requestType = REQUEST_TYPE_NONE;
            this._requestedOfferId = -1;
        }

        public function get _Str_3989():int
        {
            return this._requestType;
        }

        public function get requestId():int
        {
            return this._requestId;
        }

        public function get _Str_7501():int
        {
            return this._requestedOfferId;
        }

        public function set _Str_7501(k:int):void
        {
            this._requestedOfferId = k;
        }

        public function get _Str_22486():String
        {
            return this._requestName;
        }
    }
}
