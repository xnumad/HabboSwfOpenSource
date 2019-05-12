package com.sulake.habbo.friendbar.data
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboFriendBarData extends IUnknown 
    {
        function get events():IEventDispatcher;
        function get _Str_7830():int;
        function _Str_17238(_arg_1:int):IFriendEntity;
        function _Str_19609(_arg_1:int):IFriendEntity;
        function _Str_25174(_arg_1:String):IFriendEntity;
        function get _Str_10570():int;
        function _Str_21160(_arg_1:int):IFriendRequest;
        function _Str_23651(_arg_1:int):IFriendRequest;
        function _Str_23043(_arg_1:String):IFriendRequest;
        function _Str_16405():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function followToRoom(_arg_1:int):void;
        function startConversation(_arg_1:int):void;
        function findNewFriends():void;
        function _Str_21870():void;
        function _Str_18959():void;
        function toggleMessenger():void;
        function showProfile(_arg_1:int):void;
        function _Str_19230(_arg_1:String):void;
    }
}
