//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceItemStatsParser implements IMessageParser {

        private var _averagePrice:int;
        private var _currentOfferCount:int;
        private var _historyLength:int;
        private var _dayOffsets:Array;
        private var _averagePrices:Array;
        private var _soldAmounts:Array;
        private var _furniTypeId:int;
        private var _furniCategoryId:int;

        public function MarketplaceItemStatsParser();

        public function get averagePrice():int;

        public function get offerCount():int;

        public function get historyLength():int;

        public function get dayOffsets():Array;

        public function get averagePrices():Array;

        public function get soldAmounts():Array;

        public function get furniTypeId():int;

        public function get furniCategoryId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

