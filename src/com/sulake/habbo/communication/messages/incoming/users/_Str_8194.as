package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildCreationInfoMessageParser;

    public class _Str_8194 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8194(k:Function)
        {
            super(k, GuildCreationInfoMessageParser);
        }

        public function get data():GuildCreationData
        {
            return GuildCreationInfoMessageParser(_parser).data;
        }
    }
}
