package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.RemainingMutePeriodParser;

    public class RemainingMutePeriodEvent extends MessageEvent implements IMessageEvent 
    {
        public function RemainingMutePeriodEvent(k:Function)
        {
            super(k, RemainingMutePeriodParser);
        }

        public function get secondsRemaining():int
        {
            return RemainingMutePeriodParser(_parser).secondsRemaining;
        }
    }
}
