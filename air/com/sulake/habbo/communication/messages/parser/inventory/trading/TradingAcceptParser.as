//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingAcceptParser implements IMessageParser {

        private var _userID:int;
        private var _userAccepts:Boolean;

        public function TradingAcceptParser();

        public function get userID():int;

        public function get userAccepts():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

