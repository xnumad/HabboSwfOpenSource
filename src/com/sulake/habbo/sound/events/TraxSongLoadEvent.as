package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class TraxSongLoadEvent extends Event 
    {
        public static const TSLE_TRAX_LOAD_COMPLETE:String = "TSLE_TRAX_LOAD_COMPLETE";
        public static const TSLE_TRAX_LOAD_FAILED:String = "TSLE_TRAX_LOAD_FAILED";

        private var _id:int;

        public function TraxSongLoadEvent(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
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
