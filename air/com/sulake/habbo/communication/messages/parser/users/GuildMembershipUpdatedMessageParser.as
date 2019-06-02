//com.sulake.habbo.communication.messages.parser.users.GuildMembershipUpdatedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.MemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMembershipUpdatedMessageParser implements IMessageParser {

        private var _guildId:int;
        private var _data:MemberData;

        public function GuildMembershipUpdatedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get guildId():int;

        public function get data():MemberData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

