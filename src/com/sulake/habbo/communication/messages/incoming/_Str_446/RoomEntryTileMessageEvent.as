package com.sulake.habbo.communication.messages.incoming._Str_446
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
