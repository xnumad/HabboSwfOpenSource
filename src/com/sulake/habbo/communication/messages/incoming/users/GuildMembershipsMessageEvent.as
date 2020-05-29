package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembershipsMessageParser;

    public class GuildMembershipsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuildMembershipsMessageEvent(k:Function)
        {
            super(k, GuildMembershipsMessageParser);
        }

        public function get guilds():Array
        {
            return GuildMembershipsMessageParser(_parser).guilds;
        }
    }
}
