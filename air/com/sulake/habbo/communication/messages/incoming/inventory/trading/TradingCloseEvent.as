//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;

    [SecureSWF(rename="true")]
    public class TradingCloseEvent extends MessageEvent {

        public function TradingCloseEvent(k:Function, _arg_2:Class);

        public function get userID():int;

        public function getParser():TradingCloseParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

