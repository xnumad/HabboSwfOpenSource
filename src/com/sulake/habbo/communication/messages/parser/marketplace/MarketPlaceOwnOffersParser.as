package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataParser;
    import com.sulake.habbo.room.object.data.StuffDataFactory;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MarketPlaceOwnOffersParser implements IMessageParser
    {
        private const MAX_LIST_LENGTH:int = 500;

        private var _offers:Array;
        private var _creditsWaiting:int;


        public function flush():Boolean
        {
            this._offers = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_7:IStuffData;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_13:MarketPlaceOffer;
            this._offers = new Array();
            var _local_6:String = "";
            this._creditsWaiting = k.readInteger();
            var _local_11:int = k.readInteger();
            var _local_12:int;
            while (_local_12 < _local_11)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readInteger();
                _local_4 = k.readInteger();
                if (_local_4 == MarketPlaceOffersParser.FURNITYPE_STUFF)
                {
                    _local_5 = k.readInteger();
                    _local_7 = ObjectDataParser.parseStuffData(k);
                }
                else
                {
                    if (_local_4 == MarketPlaceOffersParser.FURNITYPE_WALL)
                    {
                        _local_5 = k.readInteger();
                        _local_6 = k.readString();
                    }
                    else
                    {
                        if (_local_4 == MarketPlaceOffersParser.FAKE_FURNITYPE_UNIQUE)
                        {
                            _local_5 = k.readInteger();
                            _local_7 = StuffDataFactory.getStuffDataWrapperForType(LegacyStuffData.FORMAT_KEY);
                            _local_7.uniqueSerialNumber = k.readInteger();
                            _local_7.uniqueSeriesSize = k.readInteger();
                            _local_4 = MarketPlaceOffersParser.FURNITYPE_STUFF;
                        }
                    }
                }
                _local_8 = k.readInteger();
                _local_9 = k.readInteger();
                _local_10 = k.readInteger();
                _local_13 = new MarketPlaceOffer(_local_2, _local_5, _local_4, _local_6, _local_7, _local_8, _local_3, _local_9, _local_10);
                if (_local_12 < this.MAX_LIST_LENGTH)
                {
                    this._offers.push(_local_13);
                }
                _local_12++;
            }
            return true;
        }

        public function get offers():Array
        {
            return this._offers;
        }

        public function get creditsWaiting():int
        {
            return this._creditsWaiting;
        }
    }
}
