//com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ClubGiftInfoParser implements IMessageParser {

        private var _daysUntilNextGift:int;
        private var _giftsAvailable:int;
        private var _offers:Array;
        private var _giftData:Map;

        public function ClubGiftInfoParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get daysUntilNextGift():int;

        public function get giftsAvailable():int;

        public function get offers():Array;

        public function get giftData():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

