//com.sulake.habbo.communication.messages.parser.users.GuildMembershipsMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMembershipsMessageParser implements IMessageParser {

        private var _guilds:Array;

        public function GuildMembershipsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get guilds():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.users

