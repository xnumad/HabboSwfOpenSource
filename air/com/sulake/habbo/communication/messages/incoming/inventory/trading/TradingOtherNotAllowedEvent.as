//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOtherNotAllowedParser;

    [SecureSWF(rename="true")]
    public class TradingOtherNotAllowedEvent extends MessageEvent {

        public function TradingOtherNotAllowedEvent(k:Function, _arg_2:Class);

        public function getParser():TradingOtherNotAllowedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

