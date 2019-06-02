//com.sulake.habbo.communication.messages.parser.gifts.TryVerificationCodeResultParser

package com.sulake.habbo.communication.messages.parser.gifts{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TryVerificationCodeResultParser implements IMessageParser {

        private var _resultCode:int;
        private var _allowResetProcess:int;

        public function TryVerificationCodeResultParser();

        public function get resultCode():int;

        public function get allowResetProcess():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.gifts

