package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionAnsweredParser;

    public class _Str_8879 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8879(k:Function)
        {
            super(k, QuestionAnsweredParser);
        }

        public function getParser():QuestionAnsweredParser
        {
            return _parser as QuestionAnsweredParser;
        }
    }
}
