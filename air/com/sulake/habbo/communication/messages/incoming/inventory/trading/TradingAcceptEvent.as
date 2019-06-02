//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser;

    [SecureSWF(rename="true")]
    public class TradingAcceptEvent extends MessageEvent {

        public function TradingAcceptEvent(k:Function, _arg_2:Class);

        public function get userID():int;

        public function get userAccepts():Boolean;

        public function getParser():TradingAcceptParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

