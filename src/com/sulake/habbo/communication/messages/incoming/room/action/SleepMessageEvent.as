package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.SleepMessageParser;

    public class SleepMessageEvent extends MessageEvent 
    {
        public function SleepMessageEvent(k:Function)
        {
            super(k, SleepMessageParser);
        }

        public function getParser():SleepMessageParser
        {
            return _parser as SleepMessageParser;
        }
    }
}
