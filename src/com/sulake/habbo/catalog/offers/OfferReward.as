package com.sulake.habbo.catalog.offers
{
    public class OfferReward 
    {
        private var _name:String;
        private var _contentType:String;
        private var _classId:int;

        public function OfferReward(k:String, _arg_2:String, _arg_3:int)
        {
            this._name = k;
            this._contentType = _arg_2;
            this._classId = _arg_3;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get contentType():String
        {
            return this._contentType;
        }

        public function get classId():int
        {
            return this._classId;
        }
    }
}
