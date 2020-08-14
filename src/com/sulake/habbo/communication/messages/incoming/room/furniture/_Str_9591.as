package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.PresentOpenedMessageParser;

    public class _Str_9591 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9591(k:Function)
        {
            super(k, PresentOpenedMessageParser);
        }

        public function getParser():PresentOpenedMessageParser
        {
            return _parser as PresentOpenedMessageParser;
        }
    }
}
