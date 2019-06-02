package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.habbo.room.IStuffData;

    public class _Str_4192 
    {
        private var _Str_2507:int;
        private var _furniId:int;
        private var _Str_11835:int;
        private var _extraData:String;
        private var _stuffData:IStuffData;
        private var _price:int;
        private var _status:int;
        private var _Str_12399:int = -1;
        private var _Str_5049:int;
        private var _Str_4620:int;

        public function _Str_4192(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int=-1)
        {
            this._Str_2507 = k;
            this._furniId = _arg_2;
            this._Str_11835 = _arg_3;
            this._extraData = _arg_4;
            this._stuffData = _arg_5;
            this._price = _arg_6;
            this._status = _arg_7;
            this._Str_12399 = _arg_8;
            this._Str_5049 = _arg_9;
            this._Str_4620 = _arg_10;
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get furniType():int
        {
            return this._Str_11835;
        }

        public function get extraData():String
        {
            return this._extraData;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get price():int
        {
            return this._price;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get _Str_5853():int
        {
            return this._Str_12399;
        }

        public function get _Str_3925():int
        {
            return this._Str_5049;
        }

        public function get _Str_4121():int
        {
            return this._Str_4620;
        }
    }
}
