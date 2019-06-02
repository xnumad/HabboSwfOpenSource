//com.sulake.habbo.room.events.RoomEngineRoomColorEvent

package com.sulake.habbo.room.events{
    public class RoomEngineRoomColorEvent extends RoomEngineEvent {

        public static const ROOM_COLOR:String;

        private var _color:uint;
        private var _brighness:uint;
        private var _bgOnly:Boolean;

        public function RoomEngineRoomColorEvent(k:int, _arg_2:uint, _arg_3:uint, _arg_4:Boolean, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get color():uint;

        public function get brightness():uint;

        public function get bgOnly():Boolean;


    }
}//package com.sulake.habbo.room.events

