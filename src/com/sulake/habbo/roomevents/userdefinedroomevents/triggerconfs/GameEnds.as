package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    public class GameEnds extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.GAME_ENDS;
        }
    }
}
