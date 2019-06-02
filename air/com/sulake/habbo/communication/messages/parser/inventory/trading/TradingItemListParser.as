//com.sulake.habbo.communication.messages.parser.inventory.trading.TradingItemListParser

package com.sulake.habbo.communication.messages.parser.inventory.trading{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TradingItemListParser implements IMessageParser {

        private var _firstUserID:int;
        private var _firstUserItemArray:Array;
        private var _secondUserID:int;
        private var _secondUserItemArray:Array;

        public function TradingItemListParser();

        public function get firstUserID():int;

        public function get firstUserItemArray():Array;

        public function get secondUserID():int;

        public function get secondUserItemArray():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        private function parseItemData(k:IMessageDataWrapper, _arg_2:Array):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.trading

