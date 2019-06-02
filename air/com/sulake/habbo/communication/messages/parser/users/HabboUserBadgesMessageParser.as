//com.sulake.habbo.communication.messages.parser.users.HabboUserBadgesMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboUserBadgesMessageParser implements IMessageParser {

        private var _userId:int;
        private var _badges:Array;

        public function HabboUserBadgesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get badges():Array;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

