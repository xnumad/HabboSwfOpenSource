//com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceStatusMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RentableSpaceStatusMessageParser implements IMessageParser {

        private var _rented:Boolean;
        private var _renterId:int;
        private var _renterName:String;
        private var _canRent:Boolean;
        private var _canRentErrorCode:int;
        private var _timeRemaining:int;
        private var _price:int;

        public function RentableSpaceStatusMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get rented():Boolean;

        public function get renterId():int;

        public function get renterName():String;

        public function get canRent():Boolean;

        public function get price():int;

        public function get timeRemaining():int;

        public function get canRentErrorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

