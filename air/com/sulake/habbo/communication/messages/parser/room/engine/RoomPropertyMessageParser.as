//com.sulake.habbo.communication.messages.parser.room.engine.RoomPropertyMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomPropertyMessageParser implements IMessageParser {

        private var _floorType:String;
        private var _wallType:String;
        private var _landscapeType:String;
        private var _animatedLandscapeType:String;

        public function RoomPropertyMessageParser();

        public function get floorType():String;

        public function get wallType():String;

        public function get landscapeType():String;

        public function get animatedLandscapeType():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

