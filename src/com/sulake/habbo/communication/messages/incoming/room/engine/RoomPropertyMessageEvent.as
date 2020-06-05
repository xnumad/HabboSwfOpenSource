package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomPropertyMessageParser;

    public class RoomPropertyMessageEvent extends MessageEvent
    {
        public function RoomPropertyMessageEvent(k:Function)
        {
            super(k, RoomPropertyMessageParser);
        }

        public function getParser():RoomPropertyMessageParser
        {
            return _parser as RoomPropertyMessageParser;
        }
    }
}
