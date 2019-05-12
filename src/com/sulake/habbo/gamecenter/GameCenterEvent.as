package com.sulake.habbo.gamecenter
{
    import flash.events.Event;

    public class GameCenterEvent extends Event 
    {
        public static const GAME_CONFIGURATIONS_INITIALIZED:String = "GAME_CONFIGURATIONS_INITIALIZED";

        public function GameCenterEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
