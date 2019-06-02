//com.sulake.habbo.communication.messages.parser.room.layout.RoomEntryTileMessageParser

package com.sulake.habbo.communication.messages.parser.room.layout{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomEntryTileMessageParser implements IMessageParser {

        private var _x:int;
        private var _y:int;
        private var _dir:uint;

        public function RoomEntryTileMessageParser();

        public function get x():int;

        public function get y():int;

        public function get dir():uint;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.layout

