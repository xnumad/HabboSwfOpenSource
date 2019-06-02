//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingCloseParser implements IMessageParser {

        public static const ERROR_WHILE_COMMIT:int;

        private var _userId:int;
        private var _reason:int;

        public function TradingCloseParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userID():int;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

