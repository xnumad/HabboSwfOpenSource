//com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosingMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InfoHotelClosingMessageParser implements IMessageParser {

        private var _minutesUntilClosing:int;

        public function InfoHotelClosingMessageParser();

        public function get minutesUntilClosing():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

