package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_8043;

    public class QuizDataMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function QuizDataMessageEvent(k:Function)
        {
            super(k, _Str_8043);
        }

        public function getParser():_Str_8043
        {
            return _parser as _Str_8043;
        }
    }
}
