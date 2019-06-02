//com.sulake.habbo.communication.messages.parser.users.ChangeEmailResultParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChangeEmailResultParser implements IMessageParser {

        public static const EMAIL_STATUS_OK:int;

        private var _result:int;

        public function ChangeEmailResultParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get result():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

