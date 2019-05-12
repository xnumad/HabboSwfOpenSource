package com.sulake.core.runtime.events
{
    import flash.events.Event;

    public class HotelViewReadyEvent extends Event 
    {
        public static const HOTEL_VIEW_READY:String = "HOTEL_VIEW_READY";

        public function HotelViewReadyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
    }
}
