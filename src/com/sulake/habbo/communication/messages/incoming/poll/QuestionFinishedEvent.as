package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionFinishedParser;

    public class QuestionFinishedEvent extends MessageEvent implements IMessageEvent
    {
        public function QuestionFinishedEvent(k:Function)
        {
            super(k, QuestionFinishedParser);
        }

        public function getParser():QuestionFinishedParser
        {
            return _parser as QuestionFinishedParser;
        }
    }
}
