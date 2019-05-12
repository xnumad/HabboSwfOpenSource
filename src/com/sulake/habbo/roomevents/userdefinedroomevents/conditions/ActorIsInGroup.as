package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    public class ActorIsInGroup extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.ACTOR_IS_GROUP_MEMBER;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_ACTOR_IN_GROUP;
        }
    }
}
