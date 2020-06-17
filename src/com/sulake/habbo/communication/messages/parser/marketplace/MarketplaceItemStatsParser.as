package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MarketplaceItemStatsParser implements IMessageParser
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

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._averagePrice = k.readInteger();
            this._currentOfferCount = k.readInteger();
            this._historyLength = k.readInteger();
            var _local_2:int = k.readInteger();
            this._dayOffsets = [];
            this._averagePrices = [];
            this._soldAmounts = [];
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._dayOffsets.push(k.readInteger());
                this._averagePrices.push(k.readInteger());
                this._soldAmounts.push(k.readInteger());
                _local_3++;
            }
            this._furniCategoryId = k.readInteger();
            this._furniTypeId = k.readInteger();
            return true;
        }
    }
}
