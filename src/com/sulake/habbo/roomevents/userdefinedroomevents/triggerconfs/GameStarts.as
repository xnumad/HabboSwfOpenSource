package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    public class GameStarts extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.GAME_STARTS;
        }
    }
}
