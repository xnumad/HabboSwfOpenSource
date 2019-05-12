package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.habbo.localization.IHabboLocalizationManager;

    public class AchievementToken extends Token 
    {
        public function AchievementToken(k:IFriendEntity, _arg_2:IFriendNotification, _arg_3:IHabboLocalizationManager)
        {
            super(_arg_2);
            var _local_4:String = _arg_3.getBadgeName(_arg_2.message);
            prepare("${friendbar.notify.achievement}", _local_4, "message_piece_xml", "friend_bar_event_notification_icon");
        }
    }
}
