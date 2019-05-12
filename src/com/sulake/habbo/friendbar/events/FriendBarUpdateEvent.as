package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FriendBarUpdateEvent extends Event 
    {
        public static const FBE_UPDATED:String = "FBE_UPDATED";

        public function FriendBarUpdateEvent()
        {
            super(FBE_UPDATED, false, false);
        }
    }
}
