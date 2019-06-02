//com.sulake.habbo.room.events.RoomObjectStateChangeEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectStateChangeEvent extends RoomObjectEvent {

        public static const ROOM_OBJECT_STATE_CHANGE:String;
        public static const ROOM_OBJECT_STATE_RANDOM:String;

        private var _param:int;

        public function RoomObjectStateChangeEvent(k:String, _arg_2:IRoomObject, _arg_3:int=0, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get param():int;


    }
}//package com.sulake.habbo.room.events

