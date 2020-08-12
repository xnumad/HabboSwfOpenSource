package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboQuestEngine extends IUnknown 
    {
        function isTrackerVisible():Boolean;
        function ensureAchievementsInitialized():void;
        function showAchievements():void;
        function showQuests():void;
        function getAchievementLevel(_arg_1:String, _arg_2:String):int;
        function reenableRoomCompetitionWindow():void;
        function requestSeasonalQuests():void;
        function requestQuests():void;
        function get events():IEventDispatcher;
        function activateQuest(_arg_1:int):void;
        function goToQuestRooms():void;
    }
}
