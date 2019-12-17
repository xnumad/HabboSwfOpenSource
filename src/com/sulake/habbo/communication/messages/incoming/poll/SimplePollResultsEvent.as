package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.SimplePollResultsMessageParser;

    public class SimplePollResultsEvent extends MessageEvent implements IMessageEvent 
    {
        public function SimplePollResultsEvent(k:Function)
        {
            super(k, SimplePollResultsMessageParser);
        }

        public function getParser():SimplePollResultsMessageParser
        {
            return _parser as SimplePollResultsMessageParser;
        }
    }
}
