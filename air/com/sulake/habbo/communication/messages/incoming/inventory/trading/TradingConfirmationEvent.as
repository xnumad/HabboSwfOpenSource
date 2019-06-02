//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingConfirmationParser;

    [SecureSWF(rename="true")]
    public class TradingConfirmationEvent extends MessageEvent {

        public function TradingConfirmationEvent(k:Function, _arg_2:Class);

        public function getParser():TradingConfirmationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

