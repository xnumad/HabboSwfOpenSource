package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class SoundControllerEvent extends Event 
    {
        public static const TRAX_SONG_COMPLETE:String = "SCE_TRAX_SONG_COMPLETE";

        private var _id:int;

        public function SoundControllerEvent(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._id = _arg_2;
        }

        public function get id():int
        {
            return this._id;
        }
    }
}
