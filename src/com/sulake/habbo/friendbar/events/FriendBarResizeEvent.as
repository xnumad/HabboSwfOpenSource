package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FriendBarResizeEvent extends Event 
    {
        public static const FBE_BAR_RESIZE_EVENT:String = "FBE_BAR_RESIZE_EVENT";

        public function FriendBarResizeEvent()
        {
            super(FBE_BAR_RESIZE_EVENT);
        }
    }
}
