package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_7457;

    public class _Str_8246 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8246(k:Function)
        {
            super(k, _Str_7457);
        }

        public function getParser():_Str_7457
        {
            return _parser as _Str_7457;
        }
    }
}
