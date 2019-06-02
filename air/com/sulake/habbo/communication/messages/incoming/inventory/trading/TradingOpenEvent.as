//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenParser;

    [SecureSWF(rename="true")]
    public class TradingOpenEvent extends MessageEvent {

        public function TradingOpenEvent(k:Function, _arg_2:Class);

        public function get userID():int;

        public function get userCanTrade():Boolean;

        public function get otherUserID():int;

        public function get otherUserCanTrade():Boolean;

        public function getParser():TradingOpenParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

