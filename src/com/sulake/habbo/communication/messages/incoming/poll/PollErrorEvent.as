package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollErrorParser;

    public class PollErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function PollErrorEvent(k:Function)
        {
            super(k, PollErrorParser);
        }

        public function getParser():PollErrorParser
        {
            return _parser as PollErrorParser;
        }
    }
}
