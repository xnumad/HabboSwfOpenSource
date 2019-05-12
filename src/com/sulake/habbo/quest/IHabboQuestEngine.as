package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboQuestEngine extends IUnknown 
    {
        function _Str_23424():Boolean;
        function _Str_12909():void;
        function showAchievements():void;
        function _Str_23387():void;
        function _Str_13119(_arg_1:String, _arg_2:String):int;
        function reenableRoomCompetitionWindow():void;
        function _Str_9649():void;
        function _Str_18428():void;
        function get events():IEventDispatcher;
        function _Str_23483(_arg_1:int):void;
        function _Str_13260():void;
    }
}
