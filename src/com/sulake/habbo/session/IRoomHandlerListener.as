package com.sulake.habbo.session
{
    import flash.events.IEventDispatcher;

    public interface IRoomHandlerListener 
    {
        function sessionUpdate(_arg_1:int, _arg_2:String):void;
        function sessionReinitialize(_arg_1:int, _arg_2:int):void;
        function getSession(_arg_1:int):IRoomSession;
        function get events():IEventDispatcher;
    }
}
