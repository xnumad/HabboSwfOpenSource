package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembersMessageParser;

    public class GuildMembersEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuildMembersEvent(k:Function)
        {
            super(k, GuildMembersMessageParser);
        }

        public function get data():GuildMemberData
        {
            return GuildMembersMessageParser(_parser).data;
        }
    }
}
