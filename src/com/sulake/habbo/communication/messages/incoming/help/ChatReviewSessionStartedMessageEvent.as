package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionStartedMessageParser;

    public class ChatReviewSessionStartedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ChatReviewSessionStartedMessageEvent(k:Function)
        {
            super(k, ChatReviewSessionStartedMessageParser);
        }

        public function getParser():ChatReviewSessionStartedMessageParser
        {
            return _parser as ChatReviewSessionStartedMessageParser;
        }
    }
}
