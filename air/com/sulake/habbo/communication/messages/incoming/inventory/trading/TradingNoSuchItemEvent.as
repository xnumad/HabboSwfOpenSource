//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNoSuchItemEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNoSuchItemParser;

    [SecureSWF(rename="true")]
    public class TradingNoSuchItemEvent extends MessageEvent {

        public function TradingNoSuchItemEvent(k:Function, _arg_2:Class);

        public function getParser():TradingNoSuchItemParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

