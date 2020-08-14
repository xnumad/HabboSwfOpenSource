package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.ChatReviewSessionDetachedMessageParser;

    public class ChatReviewSessionDetachedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ChatReviewSessionDetachedMessageEvent(k:Function)
        {
            super(k, ChatReviewSessionDetachedMessageParser);
        }
    }
}
