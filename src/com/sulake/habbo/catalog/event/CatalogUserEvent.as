package com.sulake.habbo.catalog.event
{
    public class CatalogUserEvent extends CatalogEvent 
    {
        private var _userId:int;
        private var _userName:String;

        public function CatalogUserEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._userId = _arg_2;
            this._userName = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
