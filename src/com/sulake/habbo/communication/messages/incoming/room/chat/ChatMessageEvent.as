package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser;

    public class ChatMessageEvent extends MessageEvent 
    {
        public function ChatMessageEvent(k:Function)
        {
            super(k, ChatMessageParser);
        }

        public function getParser():ChatMessageParser
        {
            return _parser as ChatMessageParser;
        }
    }
}
