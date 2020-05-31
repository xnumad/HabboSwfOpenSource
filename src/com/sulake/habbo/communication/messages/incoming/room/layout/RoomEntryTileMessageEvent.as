package com.sulake.habbo.communication.messages.incoming.room.layout
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.layout.RoomEntryTileMessageParser;

    public class RoomEntryTileMessageEvent extends MessageEvent
    {
        public function RoomEntryTileMessageEvent(k:Function)
        {
            super(k, RoomEntryTileMessageParser);
        }

        public function getParser():RoomEntryTileMessageParser
        {
            return _parser as RoomEntryTileMessageParser;
        }
    }
}
