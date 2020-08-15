package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomVisitsMessageParser;

    public class RoomVisitsEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomVisitsEvent(k:Function)
        {
            super(k, RoomVisitsMessageParser);
        }

        public function getParser():RoomVisitsMessageParser
        {
            return _parser as RoomVisitsMessageParser;
        }
    }
}
