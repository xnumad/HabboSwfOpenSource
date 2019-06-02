//com.sulake.habbo.communication.messages.parser.catalog.SnowWarGameTokensMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameTokensMessageParser implements IMessageParser {

        private var _offerId:int;
        private var _localizationId:String;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;
        private var _clubLevel:int;
        private var _giftable:Boolean;

        public function SnowWarGameTokensMessageParser();

        public function get offerId():int;

        public function get localizationId():String;

        public function get priceInCredits():int;

        public function get priceInActivityPoints():int;

        public function get activityPointType():int;

        public function get clubLevel():int;

        public function get giftable():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

