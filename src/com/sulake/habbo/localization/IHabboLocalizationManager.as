package com.sulake.habbo.localization
{
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public interface IHabboLocalizationManager extends ICoreLocalizationManager, IUnknown 
    {
        function getLocalizationWithParams(_arg_1:String, _arg_2:String="", ... _args):String;
        function _Str_21551(_arg_1:String, _arg_2:String="", _arg_3:Map=null):String;
        function _Str_18132(_arg_1:String):String;
        function getAchievementDesc(_arg_1:String, _arg_2:int):String;
        function getAchievementInstruction(_arg_1:String):String;
        function getBadgeBaseName(_arg_1:String):String;
        function getBadgeName(_arg_1:String):String;
        function getBadgeDesc(_arg_1:String):String;
        function setBadgePointLimit(_arg_1:String, _arg_2:int):void;
        function getPreviousLevelBadgeId(_arg_1:String):String;
    }
}
