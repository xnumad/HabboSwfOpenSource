package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class NowPlayingEvent extends Event 
    {
        public static const NPE_USER_PLAY_SONG:String = "NPE_USER_PLAY_SONG";
        public static const NPW_USER_STOP_SONG:String = "NPW_USER_STOP_SONG";
        public static const NPE_SONG_CHANGED:String = "NPE_SONG_CHANGED";

        private var _id:int;
        private var _position:int;
        private var _priority:int;

        public function NowPlayingEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._id = _arg_3;
            this._position = _arg_4;
            this._priority = _arg_2;
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
