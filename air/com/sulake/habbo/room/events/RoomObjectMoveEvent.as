//com.sulake.habbo.room.events.RoomObjectMoveEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectMoveEvent extends RoomObjectEvent {

        public static const POSITION_CHANGED:String;
        public static const OBJECT_REMOVED:String;

        public function RoomObjectMoveEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.room.events

