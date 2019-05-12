package com.sulake.habbo.ui.widget.events
{
    import flash.events.Event;

    public class RoomWidgetUpdateEvent extends Event 
    {
        public static const EVENT_TEST:String = "RWUE_EVENT_TEST";

        public function RoomWidgetUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
