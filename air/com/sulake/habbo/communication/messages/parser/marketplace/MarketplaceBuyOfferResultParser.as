//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceBuyOfferResultParser implements IMessageParser {

        private var _result:int;
        private var _newOfferId:int;
        private var _newPrice:int;
        private var _requestedOfferId:int;

        public function MarketplaceBuyOfferResultParser();

        public function get result():int;

        public function get offerId():int;

        public function get newPrice():int;

        public function get requestedOfferId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

