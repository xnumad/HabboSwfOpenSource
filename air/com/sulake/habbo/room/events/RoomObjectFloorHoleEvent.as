//com.sulake.habbo.room.events.RoomObjectFloorHoleEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectFloorHoleEvent extends RoomObjectEvent {

        public static const ADD_HOLE:String;
        public static const REMOVE_HOLE:String;

        public function RoomObjectFloorHoleEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.room.events

