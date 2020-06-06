package com.sulake.habbo.groups
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboGroupsManager extends IUnknown 
    {
        function showGroupBadgeInfo(_arg_1:Boolean, _arg_2:int):void;
        function openGroupInfo(_arg_1:int):void;
        function updateVisibleExtendedProfile(_arg_1:int):void;
        function showExtendedProfile(_arg_1:int):void;
        function get events():IEventDispatcher;
    }
}
