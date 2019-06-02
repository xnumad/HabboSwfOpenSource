//com.sulake.habbo.communication.messages.parser.catalog.DirectSMSClubBuyAvailableMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class DirectSMSClubBuyAvailableMessageParser implements IMessageParser {

        private var _available:Boolean;
        private var _pricePointUrl:String;
        private var _market:String;
        private var _lengthInDays:int;

        public function DirectSMSClubBuyAvailableMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get available():Boolean;

        public function get pricePointUrl():String;

        public function get market():String;

        public function get lengthInDays():int;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

