//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceCancelOfferResultParser implements IMessageParser {

        private var _offerId:int;
        private var _success:Boolean;

        public function MarketplaceCancelOfferResultParser();

        public function get success():Boolean;

        public function get offerId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

