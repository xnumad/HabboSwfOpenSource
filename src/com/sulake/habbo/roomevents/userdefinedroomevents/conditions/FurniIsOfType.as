package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class FurniIsOfType extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.STUFF_TYPE_MATCHES;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_FURNI_IS_OF_TYPE;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4991;
        }
    }
}
