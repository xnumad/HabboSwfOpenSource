package com.sulake.habbo.friendbar.data
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboFriendBarData extends IUnknown 
    {
        function get events():IEventDispatcher;
        function get numFriends():int;
        function getFriendAt(_arg_1:int):IFriendEntity;
        function getFriendByID(_arg_1:int):IFriendEntity;
        function getFriendByName(_arg_1:String):IFriendEntity;
        function get numFriendRequests():int;
        function getFriendRequestAt(_arg_1:int):IFriendRequest;
        function getFriendRequestByID(_arg_1:int):IFriendRequest;
        function getFriendRequestByName(_arg_1:String):IFriendRequest;
        function getFriendRequestList():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function followToRoom(_arg_1:int):void;
        function startConversation(_arg_1:int):void;
        function findNewFriends():void;
        function openUserTextSearch():void;
        function toggleFriendList():void;
        function toggleMessenger():void;
        function showProfile(_arg_1:int):void;
        function showProfileByName(_arg_1:String):void;
    }
}
