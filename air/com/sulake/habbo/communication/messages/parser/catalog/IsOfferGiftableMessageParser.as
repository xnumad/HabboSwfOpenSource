//com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IsOfferGiftableMessageParser implements IMessageParser {

        private var _offerId:int;
        private var _isGiftable:Boolean;

        public function IsOfferGiftableMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get offerId():int;

        public function get isGiftable():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

