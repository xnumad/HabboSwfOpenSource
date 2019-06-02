//com.sulake.habbo.communication.messages.parser.availability.AvailabilityTimeMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvailabilityTimeMessageParser implements IMessageParser {

        private var _isOpen:Boolean;
        private var _minutesUntilChange:int;

        public function AvailabilityTimeMessageParser();

        public function get isOpen():Boolean;

        public function get minutesUntilChange():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

