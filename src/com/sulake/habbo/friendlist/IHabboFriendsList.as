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
        function _Str_14642(_arg_1:int, _arg_2:String):Boolean;
        function getFriend(_arg_1:int):IFriend;
        function openFriendList():void;
        function _Str_19682():void;
        function _Str_22200():void;
        function close():void;
        function _Str_18944(_arg_1:Point):void;
        function isOpen():Boolean;
        function _Str_19440():int;
        function _Str_5401(_arg_1:Boolean, _arg_2:Boolean):int;
        function _Str_12559(_arg_1:String, _arg_2:Dictionary, _arg_3:int, _arg_4:int):void;
        function _Str_9287():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function get mainWindow():IWindowContainer;
        function getRelationshipStatus(_arg_1:int):int;
        function setRelationshipStatus(_arg_1:int, _arg_2:int):void;
        function get _Str_7577():Boolean;
    }
}
