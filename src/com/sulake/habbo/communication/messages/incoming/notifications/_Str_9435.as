package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.UnseenItemsParser;

    public class _Str_9435 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9435(k:Function)
        {
            super(k, UnseenItemsParser);
        }

        public function getParser():UnseenItemsParser
        {
            return _parser as UnseenItemsParser;
        }
    }
}
