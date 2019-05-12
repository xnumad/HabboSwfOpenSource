package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class RoomEventToken extends Token 
    {
        public function RoomEventToken(k:IFriendEntity, _arg_2:IFriendNotification)
        {
            super(_arg_2);
            prepare("${friendbar.notify.event}", _arg_2.message, "message_piece_xml", "friend_bar_event_notification_icon");
        }
    }
}
