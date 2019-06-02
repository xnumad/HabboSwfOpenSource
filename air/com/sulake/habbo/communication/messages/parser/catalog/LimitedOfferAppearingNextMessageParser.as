//com.sulake.habbo.communication.messages.parser.catalog.LimitedOfferAppearingNextMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LimitedOfferAppearingNextMessageParser implements IMessageParser {

        private var _appearsInSeconds:int;
        private var _pageId:int;
        private var _offerId:int;
        private var _productType:String;

        public function LimitedOfferAppearingNextMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get appearsInSeconds():int;

        public function get pageId():int;

        public function get offerId():int;

        public function get productType():String;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

