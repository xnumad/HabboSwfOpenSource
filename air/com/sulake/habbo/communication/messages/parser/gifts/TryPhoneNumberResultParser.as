//com.sulake.habbo.communication.messages.parser.gifts.TryPhoneNumberResultParser

package com.sulake.habbo.communication.messages.parser.gifts{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TryPhoneNumberResultParser implements IMessageParser {

        private var _resultCode:int;
        private var _millisToAllowProcessReset:int;

        public function TryPhoneNumberResultParser();

        public function get resultCode():int;

        public function get millisToAllowProcessReset():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.gifts

