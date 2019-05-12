package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class ActorOnFurni extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.TRIGGERER_IS_ON_FURNI;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_ACTOR_ON_FURNI;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }
    }
}
