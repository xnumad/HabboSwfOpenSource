package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueInfoMessageParser;

    public class IssueInfoMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function IssueInfoMessageEvent(k:Function)
        {
            super(k, IssueInfoMessageParser);
        }

        public function getParser():IssueInfoMessageParser
        {
            return _parser as IssueInfoMessageParser;
        }
    }
}
