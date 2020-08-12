package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.RestoreClientMessageParser;

    public class _Str_9995 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9995(k:Function)
        {
            super(k, RestoreClientMessageParser);
        }

        public function getParser():RestoreClientMessageParser
        {
            return _parser as RestoreClientMessageParser;
        }
    }
}
