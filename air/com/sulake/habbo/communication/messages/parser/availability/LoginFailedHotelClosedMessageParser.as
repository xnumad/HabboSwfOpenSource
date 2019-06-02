//com.sulake.habbo.communication.messages.parser.availability.LoginFailedHotelClosedMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LoginFailedHotelClosedMessageParser implements IMessageParser {

        private var _openHour:int;
        private var _openMinute:int;

        public function LoginFailedHotelClosedMessageParser();

        public function get openHour():int;

        public function get openMinute():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

