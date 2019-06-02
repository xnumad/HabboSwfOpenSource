//com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketPlaceOwnOffersParser implements IMessageParser {

        private const MAX_LIST_LENGTH:int;
        private var _offers:Array;
        private var _creditsWaiting:int;

        public function MarketPlaceOwnOffersParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get offers():Array;

        public function get creditsWaiting():int;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

