//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceMakeOfferResultParser implements IMessageParser {

        private var _result:int;

        public function MarketplaceMakeOfferResultParser();

        public function get result():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

