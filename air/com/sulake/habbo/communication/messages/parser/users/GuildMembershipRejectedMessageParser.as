//com.sulake.habbo.communication.messages.parser.users.GuildMembershipRejectedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMembershipRejectedMessageParser implements IMessageParser {

        private var _guildId:int;
        private var _userId:int;

        public function GuildMembershipRejectedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get guildId():int;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

