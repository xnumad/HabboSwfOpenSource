//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCompletedParser;

    [SecureSWF(rename="true")]
    public class TradingCompletedEvent extends MessageEvent {

        public function TradingCompletedEvent(k:Function, _arg_2:Class);

        public function getParser():TradingCompletedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

