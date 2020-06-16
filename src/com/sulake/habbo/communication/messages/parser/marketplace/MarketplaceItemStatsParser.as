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
        private var _Str_8961:Array;
        private var _Str_10894:int;
        private var _Str_10644:int;


        public function get averagePrice():int
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

        public function get averagePrices():Array
        {
            return this._averagePrices;
        }

        public function get _Str_11956():Array
        {
            return this._Str_8961;
        }

        public function get _Str_8798():int
        {
            return this._Str_10894;
        }

        public function get _Str_9431():int
        {
            return this._Str_10644;
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
            this._Str_8961 = [];
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._dayOffsets.push(k.readInteger());
                this._averagePrices.push(k.readInteger());
                this._Str_8961.push(k.readInteger());
                _local_3++;
            }
            this._Str_10644 = k.readInteger();
            this._Str_10894 = k.readInteger();
            return true;
        }
    }
}
