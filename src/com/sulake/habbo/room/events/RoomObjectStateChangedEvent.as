package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectStateChangedEvent extends RoomObjectEvent 
    {
        public static const STATE_CHANGE:String = "ROSCE_STATE_CHANGE";
        public static const STATE_RANDOM:String = "ROSCE_STATE_RANDOM";

        private var _param:int = 0;

        public function RoomObjectStateChangedEvent(k:String, _arg_2:IRoomObject, _arg_3:int=0, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_2, _arg_4, _arg_5);
            this._param = _arg_3;
        }

        public function get param():int
        {
            return this._param;
        }
    }
}
