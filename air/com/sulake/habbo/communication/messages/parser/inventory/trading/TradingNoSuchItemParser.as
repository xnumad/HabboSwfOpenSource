//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNoSuchItemParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingNoSuchItemParser implements IMessageParser {

        public function TradingNoSuchItemParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

