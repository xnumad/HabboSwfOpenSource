//com.sulake.habbo.communication.messages.incoming.room.layout.RoomOccupiedTilesMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.layout{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.layout.RoomOccupiedTilesMessageParser;

    public class RoomOccupiedTilesMessageEvent extends MessageEvent {

        public function RoomOccupiedTilesMessageEvent(k:Function);

        public function getParser():RoomOccupiedTilesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.layout

