package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetSongUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const PLAYING_CHANGED:String = "RWSUE_PLAYING_CHANGED";
        public static const DATA_RECEIVED:String = "RWSUE_DATA_RECEIVED";

        private var _songId:int;
        private var _songName:String;
        private var _songAuthor:String;

        public function RoomWidgetSongUpdateEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._songId = _arg_2;
            this._songName = _arg_3;
            this._songAuthor = _arg_4;
        }

        public function get _Str_3951():int
        {
            return this._songId;
        }

        public function get _Str_10782():String
        {
            return this._songName;
        }

        public function get _Str_20860():String
        {
            return this._songAuthor;
        }
    }
}
