package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMemberMgmtFailedMessageParser;

    public class GuildMemberMgmtFailedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuildMemberMgmtFailedMessageEvent(k:Function)
        {
            super(k, GuildMemberMgmtFailedMessageParser);
        }

        public function get reason():int
        {
            return GuildMemberMgmtFailedMessageParser(_parser).reason;
        }

        public function get guildId():int
        {
            return GuildMemberMgmtFailedMessageParser(_parser).guildId;
        }
    }
}
