package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_9102;

    public class ChatReviewSessionOfferedToGuideMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ChatReviewSessionOfferedToGuideMessageEvent(k:Function)
        {
            super(k, _Str_9102);
        }

        public function getParser():_Str_9102
        {
            return _parser as _Str_9102;
        }
    }
}
