package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    public class LeaveTeam extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.LEAVE_TEAM;
        }
    }
}
