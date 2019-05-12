package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class QuestToken extends Token 
    {
        public function QuestToken(k:IFriendEntity, _arg_2:IFriendNotification)
        {
            super(_arg_2);
            var _local_3:* = (("${quests." + _arg_2.message) + ".name}");
            prepare("${friendbar.notify.quest}", _local_3, "message_piece_xml", "friend_bar_event_notification_icon");
        }
    }
}
