//com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomFloorHoleUpdateMessage extends RoomObjectUpdateMessage {

        public static const ADD_HOLE:String;
        public static const REMOVE_HOLE:String;

        private var _type:String;
        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _width:int;
        private var _height:int;

        public function RoomObjectRoomFloorHoleUpdateMessage(k:String, _arg_2:int, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0);

        public function get type():String;

        public function get id():int;

        public function get x():int;

        public function get y():int;

        public function get width():int;

        public function get height():int;


    }
}//package com.sulake.habbo.room.messages

