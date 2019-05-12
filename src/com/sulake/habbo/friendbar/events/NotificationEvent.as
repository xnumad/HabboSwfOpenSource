package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class NotificationEvent extends Event 
    {
        public static const FBE_NOTIFICATION_EVENT:String = "FBE_NOTIFICATION_EVENT";

        public var _Str_9566:int;
        public var notification:IFriendNotification;

        public function NotificationEvent(k:int, _arg_2:IFriendNotification)
        {
            super(FBE_NOTIFICATION_EVENT);
            this._Str_9566 = k;
            this.notification = _arg_2;
        }
    }
}
