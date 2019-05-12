package com.sulake.habbo.ui.widget.events
{
    public class _Str_3345 extends RoomWidgetUpdateEvent 
    {
        public static const RWREUE_GAME_MODE:String = "RWREUE_GAME_MODE";
        public static const RWREUE_NORMAL_MODE:String = "RWREUE_NORMAL_MODE";

        private var _roomId:int = 0;

        public function _Str_3345(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._roomId = _arg_2;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
