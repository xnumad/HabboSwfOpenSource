package com.sulake.room.events
{
    import flash.events.Event;

    public class RoomToObjectEvent extends Event 
    {
        public function RoomToObjectEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
