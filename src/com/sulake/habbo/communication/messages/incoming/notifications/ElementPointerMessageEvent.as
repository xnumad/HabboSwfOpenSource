package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ElementPointerMessageParser;

    public class ElementPointerMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ElementPointerMessageEvent(k:Function)
        {
            super(k, ElementPointerMessageParser);
        }

        public function getParser():ElementPointerMessageParser
        {
            return _parser as ElementPointerMessageParser;
        }
    }
}
