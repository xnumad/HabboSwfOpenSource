package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IRoomSessionManager extends IUnknown 
    {
        function _Str_10094(_arg_1:int, _arg_2:String="", _arg_3:String=""):Boolean;
        function _Str_21545(_arg_1:int, _arg_2:int):Boolean;
        function _Str_12778(_arg_1:IRoomSession):Boolean;
        function getSession(_arg_1:int):IRoomSession;
        function get events():IEventDispatcher;
        function get _Str_22809():Boolean;
        function _Str_24970():void;
        function _Str_22920():void;
        function _Str_7613(_arg_1:int, _arg_2:Boolean=true):void;
    }
}
