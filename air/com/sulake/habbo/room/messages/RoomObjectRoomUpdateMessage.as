//com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage {

        public static const ROOM_WALL_UPDATE:String;
        public static const ROOM_FLOOR_UPDATE:String;
        public static const ROOM_LANDSCAPE_UPDATE:String;

        private var _type:String;
        private var _value:String;

        public function RoomObjectRoomUpdateMessage(k:String, _arg_2:String);

        public function get type():String;

        public function get value():String;


    }
}//package com.sulake.habbo.room.messages

