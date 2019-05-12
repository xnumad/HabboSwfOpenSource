package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class Flee extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.FLEE;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5430;
        }
    }
}
