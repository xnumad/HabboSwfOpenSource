package com.sulake.habbo.ui.widget.events
{
    public class _Str_5638 extends RoomWidgetUpdateEvent 
    {
        public static const RWUEUE_UPDATE_EFFECTS:String = "RWUEUE_UPDATE_EFFECTS";

        private var _effects:Array;

        public function _Str_5638(k:Array=null, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(RWUEUE_UPDATE_EFFECTS, _arg_2, _arg_3);
            this._effects = k;
        }

        public function get effects():Array
        {
            return this._effects;
        }
    }
}
