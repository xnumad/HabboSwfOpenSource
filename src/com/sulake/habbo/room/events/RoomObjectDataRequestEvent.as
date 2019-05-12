package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectDataRequestEvent extends RoomObjectEvent 
    {
        public static const RODRE_CURRENT_USER_ID:String = "RODRE_CURRENT_USER_ID";
        public static const RODRE_URL_PREFIX:String = "RODRE_URL_PREFIX";

        public function RoomObjectDataRequestEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
