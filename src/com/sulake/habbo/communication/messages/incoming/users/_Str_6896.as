package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMembershipUpdatedMessageParser;

    public class _Str_6896 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6896(k:Function)
        {
            super(k, GuildMembershipUpdatedMessageParser);
        }

        public function get data():_Str_2891
        {
            return GuildMembershipUpdatedMessageParser(_parser).data;
        }

        public function get guildId():int
        {
            return GuildMembershipUpdatedMessageParser(_parser).guildId;
        }
    }
}
