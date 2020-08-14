package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.QuizDataMessageParser;

    public class QuizDataMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function QuizDataMessageEvent(k:Function)
        {
            super(k, QuizDataMessageParser);
        }

        public function getParser():QuizDataMessageParser
        {
            return _parser as QuizDataMessageParser;
        }
    }
}
