package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectFloorHoleEvent extends RoomObjectEvent 
    {
        public static const ROFHO_ADD_HOLE:String = "ROFHO_ADD_HOLE";
        public static const ROFHO_REMOVE_HOLE:String = "ROFHO_REMOVE_HOLE";

        public function RoomObjectFloorHoleEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
