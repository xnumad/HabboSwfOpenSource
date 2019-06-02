//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingOpenParser implements IMessageParser {

        private var _userID:int;
        private var _userCanTrade:Boolean;
        private var _otherUserID:int;
        private var _otherUserCanTrade:Boolean;

        public function TradingOpenParser();

        public function get userID():int;

        public function get userCanTrade():Boolean;

        public function get otherUserID():int;

        public function get otherUserCanTrade():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

