package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;

    public interface IHabboNavigator extends IUnknown 
    {
        function get events():IEventDispatcher;
        function goToHomeRoom():Boolean;
        function performTagSearch(_arg_1:String):void;
        function _Str_12234(_arg_1:String):void;
        function performGuildBaseSearch():void;
        function _Str_11462(_arg_1:int, _arg_2:int):void;
        function _Str_8024():void;
        function goToPrivateRoom(_arg_1:int):void;
        function _Str_12571(_arg_1:int):Boolean;
        function _Str_13089(_arg_1:int):void;
        function _Str_15621(_arg_1:int, _arg_2:Boolean):void;
        function _Str_11727():void;
        function _Str_6822(_arg_1:Point=null):void;
        function _Str_7852():void;
        function get _Str_3374():int;
        function get enteredGuestRoomData():_Str_2370;
        function _Str_9718(_arg_1:Point):void;
        function _Str_12014(_arg_1:Boolean):void;
        function _Str_13422():void;
        function _Str_14507():Boolean;
        function _Str_12281(_arg_1:int):Boolean;
        function _Str_8458(_arg_1:int):Boolean;
        function get _Str_8075():Array;
    }
}
