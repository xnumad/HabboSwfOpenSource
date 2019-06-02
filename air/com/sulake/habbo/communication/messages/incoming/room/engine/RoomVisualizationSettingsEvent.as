//com.sulake.habbo.communication.messages.incoming.room.engine.RoomVisualizationSettingsEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomVisualizationSettingsParser;

    [SecureSWF(rename="true")]
    public class RoomVisualizationSettingsEvent extends MessageEvent {

        public function RoomVisualizationSettingsEvent(k:Function);

        public function getParser():RoomVisualizationSettingsParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

