package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class CallAnotherStack extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.CALL_ANOTHER_STACK;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }
    }
}
