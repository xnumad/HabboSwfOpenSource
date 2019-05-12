package com.sulake.habbo.catalog.marketplace
{
    public class MarketplaceItemStats 
    {
        private var _averagePrice:int;
        private var _currentOfferCount:int;
        private var _historyLength:int;
        private var _dayOffsets:Array;
        private var _averagePrices:Array;
        private var _soldAmounts:Array;
        private var _furniTypeId:int;
        private var _furniCategoryId:int;


        public function get _Str_3925():int
        {
            return this._averagePrice;
        }

        public function get _Str_4121():int
        {
            return this._currentOfferCount;
        }

        public function get _Str_10461():int
        {
            return this._historyLength;
        }

        public function get _Str_9174():Array
        {
            return this._dayOffsets;
        }

        public function get _Str_11365():Array
        {
            return this._averagePrices;
        }

        public function get _Str_11956():Array
        {
            return this._soldAmounts;
        }

        public function get _Str_8798():int
        {
            return this._furniTypeId;
        }

        public function get _Str_9431():int
        {
            return this._furniCategoryId;
        }

        public function set _Str_3925(k:int):void
        {
            this._averagePrice = k;
        }

        public function set _Str_4121(k:int):void
        {
            this._currentOfferCount = k;
        }

        public function set _Str_10461(k:int):void
        {
            this._historyLength = k;
        }

        public function set _Str_9174(k:Array):void
        {
            this._dayOffsets = k.slice();
        }

        public function set _Str_11365(k:Array):void
        {
            this._averagePrices = k.slice();
        }

        public function set _Str_11956(k:Array):void
        {
            this._soldAmounts = k.slice();
        }

        public function set _Str_8798(k:int):void
        {
            this._furniTypeId = k;
        }

        public function set _Str_9431(k:int):void
        {
            this._furniCategoryId = k;
        }
    }
}
