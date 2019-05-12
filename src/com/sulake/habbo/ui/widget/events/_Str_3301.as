package com.sulake.habbo.ui.widget.events
{
    public class _Str_3301 extends RoomWidgetUpdateEvent 
    {
        public static const RWPLENPE_USER_PLAY_SONG:String = "RWPLENPE_USER_PLAY_SONG";
        public static const RWPLENPW_USER_STOP_SONG:String = "RWPLENPW_USER_STOP_SONG";
        public static const RWPLENPE_SONG_CHANGED:String = "RWPLENPE_SONG_CHANGED";

        private var _id:int;
        private var _position:int;
        private var _priority:int;

        public function _Str_3301(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._id = _arg_2;
            this._position = _arg_3;
            this._priority = _arg_4;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get position():int
        {
            return this._position;
        }

        public function get priority():int
        {
            return this._priority;
        }
    }
}
