//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingYouAreNotAllowedParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingYouAreNotAllowedParser implements IMessageParser {

        public function TradingYouAreNotAllowedParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

