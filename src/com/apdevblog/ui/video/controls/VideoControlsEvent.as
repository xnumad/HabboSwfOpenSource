package com.apdevblog.ui.video.controls
{
    import flash.events.Event;

    public class VideoControlsEvent extends Event 
    {
        public static const SEEK:String = "seek";
        public static const SCRUB:String = "scrub";
        public static const TOGGLEFULLSCREEN:String = "toggleFullscreen";
        public static const TOGGLEPLAYPAUSE:String = "togglePlayPause";
        public static const TOGGLESOUND:String = "toggleSound";
        public static const SETVOLUME:String = "setVolume";
        public static const ENTERFULLSCREEN:String = "enterFullscreen";
        public static const STATEUPDATE:String = "stateUpdate";

        private var _data:*;

        public function VideoControlsEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:*=null)
        {
            super(k, _arg_2, _arg_3);
            this._data = _arg_4;
        }

        override public function clone():Event
        {
            return new VideoControlsEvent(type, bubbles, cancelable, this.data);
        }

        override public function toString():String
        {
            return formatToString("VideoControlsEvent", "type", "bubbles", "cancelable", "eventPhase", "data");
        }

        public function get data():*
        {
            return this._data;
        }

        public function set data(k:*):void
        {
            this._data = k;
        }
    }
}
