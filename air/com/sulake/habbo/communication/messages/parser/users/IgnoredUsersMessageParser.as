//com.sulake.habbo.communication.messages.parser.users.IgnoredUsersMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IgnoredUsersMessageParser implements IMessageParser {

        protected var _ignoredUsers:Array;

        public function IgnoredUsersMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get ignoredUsers():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.users

