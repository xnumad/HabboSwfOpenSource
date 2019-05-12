package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectMoveEvent extends RoomObjectEvent 
    {
        public static const ROME_POSITION_CHANGED:String = "ROME_POSITION_CHANGED";
        public static const ROME_OBJECT_REMOVED:String = "ROME_OBJECT_REMOVED";

        public function RoomObjectMoveEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
