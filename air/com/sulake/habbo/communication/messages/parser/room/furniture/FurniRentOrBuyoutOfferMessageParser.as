//com.sulake.habbo.communication.messages.parser.room.furniture.FurniRentOrBuyoutOfferMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurniRentOrBuyoutOfferMessageParser implements IMessageParser {

        private var _isWallItem:Boolean;
        private var _furniTypeName:String;
        private var _buyout:Boolean;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;

        public function FurniRentOrBuyoutOfferMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get isWallItem():Boolean;

        public function get furniTypeName():String;

        public function get buyout():Boolean;

        public function get priceInCredits():int;

        public function get priceInActivityPoints():int;

        public function get activityPointType():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

