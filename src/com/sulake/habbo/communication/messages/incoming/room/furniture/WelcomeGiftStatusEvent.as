package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7719;

    public class WelcomeGiftStatusEvent extends MessageEvent
    {
        public function WelcomeGiftStatusEvent(k:Function)
        {
            super(k, _Str_7719);
        }

        public function getParser():_Str_7719
        {
            return _parser as _Str_7719;
        }
    }
}
