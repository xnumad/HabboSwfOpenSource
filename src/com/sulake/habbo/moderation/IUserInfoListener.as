package com.sulake.habbo.moderation
{
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoData;

    public interface IUserInfoListener 
    {
        function onUserInfo(_arg_1:ModeratorUserInfoData):void;
    }
}
