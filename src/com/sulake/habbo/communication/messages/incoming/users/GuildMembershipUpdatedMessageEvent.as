package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembershipUpdatedMessageParser;

    public class GuildMembershipUpdatedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuildMembershipUpdatedMessageEvent(k:Function)
        {
            super(k, GuildMembershipUpdatedMessageParser);
        }

        public function get data():MemberData
        {
            return GuildMembershipUpdatedMessageParser(_parser).data;
        }

        public function get guildId():int
        {
            return GuildMembershipUpdatedMessageParser(_parser).guildId;
        }
    }
}
