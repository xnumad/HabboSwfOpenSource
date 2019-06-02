//com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosedMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InfoHotelClosedMessageParser implements IMessageParser {

        private var _openHour:int;
        private var _openMinute:int;
        private var _userThrownOutAtClose:Boolean;

        public function InfoHotelClosedMessageParser();

        public function get openHour():int;

        public function get openMinute():int;

        public function get userThrownOutAtClose():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

