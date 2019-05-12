package com.sulake.habbo.room.events
{
    public class RoomEngineDragWidgetMouseEvent extends RoomEngineEvent 
    {
        public static const DRAG_START:String = "REDWME_DRAG_START";
        public static const DRAG_END:String = "REDWME_DRAG_END";

        public function RoomEngineDragWidgetMouseEvent(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
