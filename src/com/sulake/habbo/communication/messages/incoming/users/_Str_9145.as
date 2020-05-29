package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser;

    public class _Str_9145 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9145(k:Function)
        {
            super(k, ApproveNameMessageParser);
        }

        public function getParser():ApproveNameMessageParser
        {
            return _parser as ApproveNameMessageParser;
        }
    }
}
