package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9168;

    public class GuildMembersEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuildMembersEvent(k:Function)
        {
            super(k, _Str_9168);
        }

        public function get data():GuildMemberData
        {
            return _Str_9168(_parser).data;
        }
    }
}
