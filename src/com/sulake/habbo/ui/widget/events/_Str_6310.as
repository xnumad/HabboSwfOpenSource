package com.sulake.habbo.ui.widget.events
{
    import flash.events.Event;

    public class _Str_6310 extends Event 
    {
        public static const HRWE_HIDE_ROOM_WIDGET:String = "hrwe_hide_room_widget";

        private var _Str_9477:String;

        public function _Str_6310(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(HRWE_HIDE_ROOM_WIDGET, _arg_2, _arg_3);
            this._Str_9477 = k;
        }

        public function get _Str_23558():String
        {
            return this._Str_9477;
        }
    }
}
