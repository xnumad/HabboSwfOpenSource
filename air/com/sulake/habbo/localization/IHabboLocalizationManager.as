//com.sulake.habbo.localization.IHabboLocalizationManager

package com.sulake.habbo.localization{
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IHabboLocalizationManager extends ICoreLocalizationManager, IUnknown {

        function requestLocalizationInit():void;
        function getLocalizationWithParams(k:String, _arg_2:String="", ... _args):String;
        function getLocalizationWithParamMap(k:String, _arg_2:String="", _arg_3:Map=null):String;
        function getAchievementName(k:String):String;
        function getAchievementDesc(k:String, _arg_2:int):String;
        function getAchievementInstruction(k:String):String;
        function getBadgeBaseName(k:String):String;
        function getBadgeName(k:String):String;
        function getBadgeDesc(k:String):String;
        function setBadgePointLimit(k:String, _arg_2:int):void;
        function getPreviousLevelBadgeId(k:String):String;

    }
}//package com.sulake.habbo.localization

