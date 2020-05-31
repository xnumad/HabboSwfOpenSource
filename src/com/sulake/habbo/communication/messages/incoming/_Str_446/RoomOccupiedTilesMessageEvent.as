package com.sulake.habbo.communication.messages.incoming._Str_446
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.layout.RoomOccupiedTilesMessageParser;

    public class RoomOccupiedTilesMessageEvent extends MessageEvent
    {
        public function RoomOccupiedTilesMessageEvent(k:Function)
        {
            super(k, RoomOccupiedTilesMessageParser);
        }

        public function getParser():RoomOccupiedTilesMessageParser
        {
            return _parser as RoomOccupiedTilesMessageParser;
        }
    }
}
