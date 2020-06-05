package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboMessenger extends IUnknown 
    {
        function get events():IEventDispatcher;
        function isOpen():Boolean;
        function toggleMessenger():void;
        function startConversation(_arg_1:int):void;
        function closeConversation(_arg_1:int):void;
        function setFollowingAllowed(_arg_1:int, _arg_2:Boolean):void;
        function setOnlineStatus(_arg_1:int, _arg_2:Boolean):void;
        function getUnseenMiniMailMessageCount():int;
        function getRoomInvitesIgnored():Boolean;
        function setRoomInvitesIgnored(_arg_1:Boolean):void;
        function get hasfriendsListInitialized():Boolean;
    }
}
