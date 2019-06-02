//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradeOpenFailedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradeOpenFailedParser;

    [SecureSWF(rename="true")]
    public class TradeOpenFailedEvent extends MessageEvent {

        public function TradeOpenFailedEvent(k:Function, _arg_2:Class);

        public function getParser():TradeOpenFailedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

