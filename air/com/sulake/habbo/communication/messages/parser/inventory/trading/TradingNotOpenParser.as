//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingNotOpenParser implements IMessageParser {

        public function TradingNotOpenParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

