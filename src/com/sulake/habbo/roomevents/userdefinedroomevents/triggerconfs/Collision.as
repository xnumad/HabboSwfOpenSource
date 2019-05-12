package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    public class Collision extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.COLLISION;
        }
    }
}
