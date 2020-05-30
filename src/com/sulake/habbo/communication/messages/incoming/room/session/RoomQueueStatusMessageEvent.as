package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomQueueStatusMessageParser;

    public class RoomQueueStatusMessageEvent extends MessageEvent
    {
        public function RoomQueueStatusMessageEvent(k:Function)
        {
            super(k, RoomQueueStatusMessageParser);
        }

        public function getParser():RoomQueueStatusMessageParser
        {
            return _parser as RoomQueueStatusMessageParser;
        }
    }
}
