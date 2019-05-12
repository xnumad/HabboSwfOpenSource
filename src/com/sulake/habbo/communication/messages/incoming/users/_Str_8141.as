package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9569;

    public class _Str_8141 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8141(k:Function)
        {
            super(k, _Str_9569);
        }

        public function get data():GuildEditorData
        {
            return _Str_9569(_parser).data;
        }
    }
}
