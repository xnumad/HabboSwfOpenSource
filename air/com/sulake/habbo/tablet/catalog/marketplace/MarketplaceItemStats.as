//com.sulake.habbo.tablet.catalog.marketplace.MarketplaceItemStats

package com.sulake.habbo.tablet.catalog.marketplace{
    public class MarketplaceItemStats {

        private var _averagePrice:int;
        private var _currentOfferCount:int;
        private var _historyLength:int;
        private var _dayOffsets:Array;
        private var _averagePrices:Array;
        private var _soldAmounts:Array;
        private var _furniTypeId:int;
        private var _furniCategoryId:int;

        public function MarketplaceItemStats();

        public function get averagePrice():int;

        public function get offerCount():int;

        public function get historyLength():int;

        public function get dayOffsets():Array;

        public function get averagePrices():Array;

        public function get soldAmounts():Array;

        public function get furniTypeId():int;

        public function get furniCategoryId():int;

        public function set averagePrice(k:int):void;

        public function set offerCount(k:int):void;

        public function set historyLength(k:int):void;

        public function set dayOffsets(k:Array):void;

        public function set averagePrices(k:Array):void;

        public function set soldAmounts(k:Array):void;

        public function set furniTypeId(k:int):void;

        public function set furniCategoryId(k:int):void;


    }
}//package com.sulake.habbo.tablet.catalog.marketplace

