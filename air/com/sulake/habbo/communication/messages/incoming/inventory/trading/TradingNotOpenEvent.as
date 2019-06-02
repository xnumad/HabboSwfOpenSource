//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser;

    [SecureSWF(rename="true")]
    public class TradingNotOpenEvent extends MessageEvent {

        public function TradingNotOpenEvent(k:Function, _arg_2:Class);

        public function getParser():TradingNotOpenParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

