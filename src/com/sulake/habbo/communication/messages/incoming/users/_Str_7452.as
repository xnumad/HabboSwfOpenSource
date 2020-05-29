package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembershipsMessageParser;

    public class _Str_7452 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7452(k:Function)
        {
            super(k, GuildMembershipsMessageParser);
        }

        public function get guilds():Array
        {
            return GuildMembershipsMessageParser(_parser).guilds;
        }
    }
}
