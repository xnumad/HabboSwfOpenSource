package com.sulake.habbo.ui.widget.events
{
    public class _Str_4818 extends RoomWidgetUpdateEvent 
    {
        public static const RWPLUE_PET_LEVEL_UPDATE:String = "RWPLUE_PET_LEVEL_UPDATE";

        private var _petId:int;
        private var _level:int;

        public function _Str_4818(k:int, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWPLUE_PET_LEVEL_UPDATE, _arg_3, _arg_4);
            this._petId = k;
            this._level = _arg_2;
        }

        public function get petId():int
        {
            return this._petId;
        }

        public function get level():int
        {
            return this._level;
        }
    }
}
