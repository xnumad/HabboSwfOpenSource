//com.sulake.habbo.communication.messages.parser.users.ExtendedProfileChangedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ExtendedProfileChangedMessageParser implements IMessageParser {

        private var _userId:int;

        public function ExtendedProfileChangedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

