package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionParser;

    public class QuestionEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestionEvent(k:Function)
        {
            super(k, QuestionParser);
        }

        public function getParser():QuestionParser
        {
            return _parser as QuestionParser;
        }
    }
}
