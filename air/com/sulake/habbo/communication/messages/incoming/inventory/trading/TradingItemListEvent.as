//com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingItemListEvent

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingItemListParser;

    [SecureSWF(rename="true")]
    public class TradingItemListEvent extends MessageEvent {

        public function TradingItemListEvent(k:Function, _arg_2:Class);

        public function get firstUserID():int;

        public function get secondUserID():int;

        public function get firstUserItemArray():Array;

        public function get secondUserItemArray():Array;

        public function getParser():TradingItemListParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

