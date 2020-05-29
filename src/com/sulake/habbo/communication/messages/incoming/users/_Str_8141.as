package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildEditorDataMessageParser;

    public class _Str_8141 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8141(k:Function)
        {
            super(k, GuildEditorDataMessageParser);
        }

        public function get data():GuildEditorData
        {
            return GuildEditorDataMessageParser(_parser).data;
        }
    }
}
