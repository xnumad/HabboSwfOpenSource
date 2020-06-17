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


        public function get averagePrice():int
        {
            return this._averagePrice;
        }

        public function get offerCount():int
        {
            return this._currentOfferCount;
        }

        public function get historyLength():int
        {
            return this._historyLength;
        }

        public function get dayOffsets():Array
        {
            return this._dayOffsets;
        }

        public function get averagePrices():Array
        {
            return this._averagePrices;
        }

        public function get soldAmounts():Array
        {
            return this._soldAmounts;
        }

        public function get furniTypeId():int
        {
            return this._furniTypeId;
        }

        public function get furniCategoryId():int
        {
            return this._furniCategoryId;
        }

        public function set averagePrice(k:int):void
        {
            this._averagePrice = k;
        }

        public function set offerCount(k:int):void
        {
            this._currentOfferCount = k;
        }

        public function set historyLength(k:int):void
        {
            this._historyLength = k;
        }

        public function set dayOffsets(k:Array):void
        {
            this._dayOffsets = k.slice();
        }

        public function set averagePrices(k:Array):void
        {
            this._averagePrices = k.slice();
        }

        public function set soldAmounts(k:Array):void
        {
            this._soldAmounts = k.slice();
        }

        public function set furniTypeId(k:int):void
        {
            this._furniTypeId = k;
        }

        public function set furniCategoryId(k:int):void
        {
            this._furniCategoryId = k;
        }
    }
}
