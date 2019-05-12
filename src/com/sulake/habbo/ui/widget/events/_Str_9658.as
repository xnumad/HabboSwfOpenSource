package com.sulake.habbo.ui.widget.events
{
    public class _Str_9658 extends RoomWidgetUpdateEvent 
    {
        public static const RWUE_DANCE:String = "RWUE_DANCE";

        private var _style:int;

        public function _Str_9658(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(RWUE_DANCE, _arg_2, _arg_3);
            this._style = k;
        }

        public function get style():int
        {
            return this._style;
        }
    }
}
