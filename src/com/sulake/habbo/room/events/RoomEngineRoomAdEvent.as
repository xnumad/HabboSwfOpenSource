package com.sulake.habbo.room.events
{
    public class RoomEngineRoomAdEvent extends RoomEngineObjectEvent 
    {
        public static const FURNI_CLICK:String = "RERAE_FURNI_CLICK";
        public static const FURNI_DOUBLE_CLICK:String = "RERAE_FURNI_DOUBLE_CLICK";
        public static const TOOLTIP_SHOW:String = "RERAE_TOOLTIP_SHOW";
        public static const TOOLTIP_HIDE:String = "RERAE_TOOLTIP_HIDE";

        public function RoomEngineRoomAdEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }
    }
}
