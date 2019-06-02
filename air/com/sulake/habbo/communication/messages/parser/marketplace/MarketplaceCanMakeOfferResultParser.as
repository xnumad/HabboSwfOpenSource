//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceCanMakeOfferResultParser implements IMessageParser {

        private var _tokenCount:int;
        private var _result:int;

        public function MarketplaceCanMakeOfferResultParser();

        public function get tokenCount():int;

        public function get resultCode():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

