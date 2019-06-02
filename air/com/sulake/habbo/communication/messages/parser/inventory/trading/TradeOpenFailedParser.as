//com.sulake.habbo.communication.messages.parser.inventory.trading.TradeOpenFailedParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradeOpenFailedParser implements IMessageParser {

        public static const REASON_YOU_ARE_ALREADY_TRADING:int;
        public static const REASON_OTHER_USER_ALREADY_TRADING:int;

        private var _reason:int;
        private var _otherUserName:String;

        public function TradeOpenFailedParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;

        public function get otherUserName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

