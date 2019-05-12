package com.sulake.habbo.ui.widget.events
{
    public class _Str_4818 extends RoomWidgetUpdateEvent 
    {
        public static const RWPLUE_PET_LEVEL_UPDATE:String = "RWPLUE_PET_LEVEL_UPDATE";

        private var _Str_2388:int;
        private var _level:int;

        public function _Str_4818(k:int, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWPLUE_PET_LEVEL_UPDATE, _arg_3, _arg_4);
            this._Str_2388 = k;
            this._level = _arg_2;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get level():int
        {
            return this._level;
        }
    }
}
