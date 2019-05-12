package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class PlayListStatusEvent extends Event 
    {
        public static const PLUE_PLAY_LIST_UPDATED:String = "PLUE_PLAY_LIST_UPDATED";
        public static const PLUE_PLAY_LIST_FULL:String = "PLUE_PLAY_LIST_FULL";

        public function PlayListStatusEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
