//com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketPlaceOffersParser implements IMessageParser {

        public static const FURNITYPE_STUFF:int;
        public static const FURNITYPE_WALL:int;
        public static const FAKE_FURNITYPE_UNIQUE:int;

        private const MAX_LIST_LENGTH:int;
        private var _offers:Array;
        private var _totalItemsFound:int;

        public function MarketPlaceOffersParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get offers():Array;

        public function get totalItemsFound():int;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

