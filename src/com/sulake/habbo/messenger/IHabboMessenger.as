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
        function _Str_20291(_arg_1:int):void;
        function _Str_14047(_arg_1:int, _arg_2:Boolean):void;
        function _Str_10473(_arg_1:int, _arg_2:Boolean):void;
        function getUnseenMiniMailMessageCount():int;
        function _Str_16882():Boolean;
        function _Str_19823(_arg_1:Boolean):void;
        function get _Str_7577():Boolean;
    }
}
