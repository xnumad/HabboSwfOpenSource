package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;

    public class AvatarWalksOnFurni extends WiredTrigger 
    {


        override public function get code():int
        {
            return WiredTriggerType.AVATAR_WALKS_ON_FURNI;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4991;
        }
    }
}
