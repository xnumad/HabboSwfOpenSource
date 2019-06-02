//com.sulake.habbo.communication.messages.parser.users.GuildMemberMgmtFailedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMemberMgmtFailedMessageParser implements IMessageParser {

        private var _guildId:int;
        private var _reason:int;

        public function GuildMemberMgmtFailedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get guildId():int;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

