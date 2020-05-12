package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomDimmerPresetsMessageParser;

    public class RoomDimmerPresetsEvent extends MessageEvent 
    {
        public function RoomDimmerPresetsEvent(k:Function)
        {
            super(k, RoomDimmerPresetsMessageParser);
        }

        public function getParser():RoomDimmerPresetsMessageParser
        {
            return _parser as RoomDimmerPresetsMessageParser;
        }
    }
}
