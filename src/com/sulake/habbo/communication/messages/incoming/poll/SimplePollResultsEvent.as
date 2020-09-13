package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionFinishedParser;

    public class SimplePollResultsEvent extends MessageEvent implements IMessageEvent 
    {
        public function SimplePollResultsEvent(k:Function)
        {
            super(k, QuestionFinishedParser);
        }

        public function getParser():QuestionFinishedParser
        {
            return _parser as QuestionFinishedParser;
        }
    }
}
