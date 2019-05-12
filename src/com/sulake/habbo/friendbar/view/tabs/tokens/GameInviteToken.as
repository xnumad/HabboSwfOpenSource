package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.habbo.game.GameAssetEnum;
    import com.sulake.habbo.friendbar.data.IFriendEntity;
    import com.sulake.habbo.friendbar.data.IFriendNotification;

    public class GameInviteToken extends Token 
    {
        public function GameInviteToken(k:IFriendEntity, _arg_2:IFriendNotification)
        {
            super(_arg_2);
            var _local_3:String = _arg_2.message;
            var _local_4:* = (("${gamecenter." + _local_3) + ".name}");
            var _local_5:int = _Str_9155.getGameId(_arg_2.message);
            var _local_6:String = _Str_9155.getGameAssetURL(_local_5, GameAssetEnum.SMALL_ICON);
            prepare("${friendbar.notify.game_invite}", _local_4, "message_piece_xml", _local_6);
        }
    }
}
