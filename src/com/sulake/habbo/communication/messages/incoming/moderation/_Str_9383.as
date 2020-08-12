package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueDeletedMessageParser;

    public class _Str_9383 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9383(k:Function)
        {
            super(k, IssueDeletedMessageParser);
        }

        public function getParser():IssueDeletedMessageParser
        {
            return _parser as IssueDeletedMessageParser;
        }
    }
}
