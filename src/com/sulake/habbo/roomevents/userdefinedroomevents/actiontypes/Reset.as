package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    public class Reset extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.RESET;
        }
    }
}
