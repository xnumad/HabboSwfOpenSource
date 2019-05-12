package com.sulake.room
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.events.IEventDispatcher;

    public interface IRoomObjectFactory extends IUnknown 
    {
        function _Str_21210(_arg_1:Function):void;
        function _Str_22490(_arg_1:Function):void;
        function _Str_16699(_arg_1:String):IRoomObjectEventHandler;
        function _Str_9811():IRoomObjectManager;
        function get events():IEventDispatcher;
    }
}
