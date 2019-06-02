//com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage {

        public static const WALL_VISIBILITY:String;
        public static const FLOOR_VISIBILITY:String;

        private var _type:String;
        private var _visible:Boolean;

        public function RoomObjectRoomPlaneVisibilityUpdateMessage(k:String, _arg_2:Boolean);

        public function get type():String;

        public function get visible():Boolean;


    }
}//package com.sulake.habbo.room.messages

