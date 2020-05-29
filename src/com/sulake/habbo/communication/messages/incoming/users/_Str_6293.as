package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildMemberMgmtFailedMessageParser;

    public class _Str_6293 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6293(k:Function)
        {
            super(k, GuildMemberMgmtFailedMessageParser);
        }

        public function get reason():int
        {
            return GuildMemberMgmtFailedMessageParser(_parser).reason;
        }

        public function get _Str_3916():int
        {
            return GuildMemberMgmtFailedMessageParser(_parser).guildId;
        }
    }
}
