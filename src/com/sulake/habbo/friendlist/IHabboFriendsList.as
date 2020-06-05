package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;

    public interface IHabboFriendsList extends IUnknown 
    {
        function get events():IEventDispatcher;
        function canBeAskedForAFriend(_arg_1:int):Boolean;
        function askForAFriend(_arg_1:int, _arg_2:String):Boolean;
        function getFriend(_arg_1:int):IFriend;
        function openFriendList():void;
        function openFriendRequests():void;
        function openFriendSearch():void;
        function close():void;
        function alignBottomLeftTo(_arg_1:Point):void;
        function isOpen():Boolean;
        function currentTabId():int;
        function getFriendCount(_arg_1:Boolean, _arg_2:Boolean):int;
        function openHabboWebPage(_arg_1:String, _arg_2:Dictionary, _arg_3:int, _arg_4:int):void;
        function getFriendNames():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function get mainWindow():IWindowContainer;
        function getRelationshipStatus(_arg_1:int):int;
        function setRelationshipStatus(_arg_1:int, _arg_2:int):void;
        function get hasfriendsListInitialized():Boolean;
    }
}
