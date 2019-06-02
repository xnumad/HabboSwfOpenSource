//com.sulake.habbo.communication.messages.parser.catalog.BonusRareInfoMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BonusRareInfoMessageParser implements IMessageParser {

        private var _productType:String;
        private var _productClassId:int;
        private var _totalCoinsForBonus:int;
        private var _coinsStillRequiredToBuy:int;

        public function BonusRareInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get totalCoinsForBonus():int;

        public function get coinsStillRequiredToBuy():int;

        public function get productType():String;

        public function get productClassId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

