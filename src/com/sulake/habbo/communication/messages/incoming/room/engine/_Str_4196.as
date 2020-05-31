package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomVisualizationSettingsParser;

    public class _Str_4196 extends MessageEvent 
    {
        public function _Str_4196(k:Function)
        {
            super(k, RoomVisualizationSettingsParser);
        }

        public function getParser():RoomVisualizationSettingsParser
        {
            return _parser as RoomVisualizationSettingsParser;
        }
    }
}
