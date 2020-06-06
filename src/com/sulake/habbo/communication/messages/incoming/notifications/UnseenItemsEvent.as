package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.UnseenItemsParser;

    public class UnseenItemsEvent extends MessageEvent implements IMessageEvent
    {
        public function UnseenItemsEvent(k:Function)
        {
            super(k, UnseenItemsParser);
        }

        public function getParser():UnseenItemsParser
        {
            return _parser as UnseenItemsParser;
        }
    }
}
