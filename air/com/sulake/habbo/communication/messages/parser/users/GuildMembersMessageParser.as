//com.sulake.habbo.communication.messages.parser.users.GuildMembersMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMembersMessageParser implements IMessageParser {

        private var _data:GuildMemberData;

        public function GuildMembersMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():GuildMemberData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

