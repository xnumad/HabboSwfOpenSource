//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingYouAreNotAllowedParser;

    [SecureSWF(rename="true")]
    public class TradingYouAreNotAllowedEvent extends MessageEvent {

        public function TradingYouAreNotAllowedEvent(k:Function, _arg_2:Class);

        public function getParser():TradingYouAreNotAllowedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

