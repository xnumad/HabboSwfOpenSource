package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FindFriendsNotificationEvent extends Event 
    {
        public static const FIND_FRIENDS_RESULT:String = "FIND_FRIENDS_RESULT";

        private var _success:Boolean;

        public function FindFriendsNotificationEvent(k:Boolean)
        {
            this._success = k;
            super(FIND_FRIENDS_RESULT);
        }

        public function get success():Boolean
        {
            return this._success;
        }
    }
}
