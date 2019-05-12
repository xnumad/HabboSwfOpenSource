package com.sulake.habbo.ui.widget.events
{
    public class _Str_6300 extends RoomWidgetUpdateEvent 
    {
        public static const RWFCE_FLOOD_CONTROL:String = "RWFCE_FLOOD_CONTROL";

        private var _seconds:int = 0;

        public function _Str_6300(k:int)
        {
            super(RWFCE_FLOOD_CONTROL, false, false);
            this._seconds = k;
        }

        public function get seconds():int
        {
            return this._seconds;
        }
    }
}
