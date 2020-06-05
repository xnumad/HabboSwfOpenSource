package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomVisualizationSettingsParser;

    public class RoomVisualizationSettingsEvent extends MessageEvent
    {
        public function RoomVisualizationSettingsEvent(k:Function)
        {
            super(k, RoomVisualizationSettingsParser);
        }

        public function getParser():RoomVisualizationSettingsParser
        {
            return _parser as RoomVisualizationSettingsParser;
        }
    }
}
