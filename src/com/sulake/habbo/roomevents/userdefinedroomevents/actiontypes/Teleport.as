package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class Teleport extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.TELEPORT;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4991;
        }
    }
}
