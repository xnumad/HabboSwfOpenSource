package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssuePickFailedMessageParser;

    public class IssuePickFailedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function IssuePickFailedMessageEvent(k:Function)
        {
            super(k, IssuePickFailedMessageParser);
        }

        public function getParser():IssuePickFailedMessageParser
        {
            return _parser as IssuePickFailedMessageParser;
        }
    }
}
