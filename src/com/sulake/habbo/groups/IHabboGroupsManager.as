package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboGroupsManager extends IUnknown 
    {
        function _Str_12867(_arg_1:Boolean, _arg_2:int):void;
        function _Str_12717(_arg_1:int):void;
        function _Str_14387(_arg_1:int):void;
        function _Str_21987(_arg_1:int):void;
        function get events():IEventDispatcher;
    }
}
