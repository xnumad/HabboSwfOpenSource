package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssuePickFailedMessageParser;

    public class _Str_7889 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7889(k:Function)
        {
            super(k, IssuePickFailedMessageParser);
        }

        public function getParser():IssuePickFailedMessageParser
        {
            return _parser as IssuePickFailedMessageParser;
        }
    }
}
