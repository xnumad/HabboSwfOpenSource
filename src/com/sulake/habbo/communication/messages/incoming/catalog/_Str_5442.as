package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5442 
    {
        private var _Str_2507:int;
        private var _Str_2570:String;
        private var _priceCredits:int;
        private var _priceActivityPoints:int;
        private var _Str_10007:int;
        private var _vip:Boolean;
        private var _months:int;
        private var _Str_10377:int;
        private var _Str_9967:int;
        private var _year:int;
        private var _month:int;
        private var _day:int;
        private var _Str_4135:Boolean;

        public function _Str_5442(k:IMessageDataWrapper)
        {
            this._Str_2507 = k.readInteger();
            this._Str_2570 = k.readString();
            k.readBoolean();
            this._priceCredits = k.readInteger();
            this._priceActivityPoints = k.readInteger();
            this._Str_10007 = k.readInteger();
            this._vip = k.readBoolean();
            this._months = k.readInteger();
            this._Str_10377 = k.readInteger();
            this._Str_4135 = k.readBoolean();
            this._Str_9967 = k.readInteger();
            this._year = k.readInteger();
            this._month = k.readInteger();
            this._day = k.readInteger();
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get priceCredits():int
        {
            return this._priceCredits;
        }

        public function get vip():Boolean
        {
            return this._vip;
        }

        public function get months():int
        {
            return this._months;
        }

        public function get _Str_15178():int
        {
            return this._Str_10377;
        }

        public function get _Str_11224():int
        {
            return this._Str_9967;
        }

        public function get year():int
        {
            return this._year;
        }

        public function get month():int
        {
            return this._month;
        }

        public function get day():int
        {
            return this._day;
        }

        public function get priceActivityPoints():int
        {
            return this._priceActivityPoints;
        }

        public function get _Str_23501():int
        {
            return this._Str_10007;
        }

        public function get _Str_18028():Boolean
        {
            return this._Str_4135;
        }
    }
}
