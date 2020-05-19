package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.SleepMessageParser;

    public class _Str_7216 extends MessageEvent 
    {
        public function _Str_7216(k:Function)
        {
            super(k, SleepMessageParser);
        }

        public function getParser():SleepMessageParser
        {
            return _parser as SleepMessageParser;
        }
    }
}
