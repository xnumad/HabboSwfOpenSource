package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildEditInfoMessageParser;

    public class _Str_7878 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7878(k:Function)
        {
            super(k, GuildEditInfoMessageParser);
        }

        public function get data():GuildEditData
        {
            return GuildEditInfoMessageParser(_parser).data;
        }
    }
}
