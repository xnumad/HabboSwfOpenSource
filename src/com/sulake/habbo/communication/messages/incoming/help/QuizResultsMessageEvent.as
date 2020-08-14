package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_7308;

    public class QuizResultsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function QuizResultsMessageEvent(k:Function)
        {
            super(k, _Str_7308);
        }

        public function getParser():_Str_7308
        {
            return _parser as _Str_7308;
        }
    }
}
