package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ElementPointerMessageParser;

    public class _Str_8054 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8054(k:Function)
        {
            super(k, ElementPointerMessageParser);
        }

        public function getParser():ElementPointerMessageParser
        {
            return _parser as ElementPointerMessageParser;
        }
    }
}
