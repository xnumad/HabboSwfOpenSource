package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomDimmerPresetsMessageParser;

    public class _Str_8039 extends MessageEvent 
    {
        public function _Str_8039(k:Function)
        {
            super(k, RoomDimmerPresetsMessageParser);
        }

        public function getParser():RoomDimmerPresetsMessageParser
        {
            return _parser as RoomDimmerPresetsMessageParser;
        }
    }
}
