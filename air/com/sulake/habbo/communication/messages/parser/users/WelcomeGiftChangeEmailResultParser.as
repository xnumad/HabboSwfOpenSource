//com.sulake.habbo.communication.messages.parser.users.WelcomeGiftChangeEmailResultParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WelcomeGiftChangeEmailResultParser implements IMessageParser {

        private var _result:int;

        public function WelcomeGiftChangeEmailResultParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get result():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

