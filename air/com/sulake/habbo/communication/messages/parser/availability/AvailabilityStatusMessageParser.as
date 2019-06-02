//com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvailabilityStatusMessageParser implements IMessageParser {

        private var _isOpen:Boolean;
        private var _onShutDown:Boolean;

        public function AvailabilityStatusMessageParser();

        public function get isOpen():Boolean;

        public function get onShutDown():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

