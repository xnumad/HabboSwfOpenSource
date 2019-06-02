//com.sulake.habbo.communication.messages.parser.room.layout.RoomOccupiedTilesMessageParser

package com.sulake.habbo.communication.messages.parser.room.layout{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomOccupiedTilesMessageParser implements IMessageParser {

        private var _occupiedTiles:Array;

        public function RoomOccupiedTilesMessageParser();

        public function get occupiedTiles():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.layout

