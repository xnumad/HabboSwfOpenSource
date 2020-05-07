package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollStartParser;

    public class PollOfferEvent extends MessageEvent implements IMessageEvent 
    {
        public function PollOfferEvent(k:Function)
        {
            super(k, PollStartParser);
        }

        public function getParser():PollStartParser
        {
            return _parser as PollStartParser;
        }
    }
}
