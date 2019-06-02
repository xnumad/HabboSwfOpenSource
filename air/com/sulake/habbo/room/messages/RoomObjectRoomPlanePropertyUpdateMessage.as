//com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomPlanePropertyUpdateMessage extends RoomObjectUpdateMessage {

        public static const WALL_THICKNESS:String;
        public static const FLOOR_THICKNESS:String;

        private var _type:String;
        private var _value:Number = 0;

        public function RoomObjectRoomPlanePropertyUpdateMessage(k:String, _arg_2:Number);

        public function get type():String;

        public function get value():Number;


    }
}//package com.sulake.habbo.room.messages

