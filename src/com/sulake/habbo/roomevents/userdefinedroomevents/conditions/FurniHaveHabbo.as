package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class FurniHaveHabbo extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.FURNIS_HAVE_AVATARS;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.FURNI_NOT_HAVE_HABBO;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }
    }
}
