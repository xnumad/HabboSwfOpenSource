//com.sulake.habbo.localization.HabboLocalizationManager

package com.sulake.habbo.localization{
    import com.sulake.core.localization.CoreLocalizationManager;
    import flash.utils.Dictionary;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class HabboLocalizationManager extends CoreLocalizationManager implements IHabboLocalizationManager {

        private var _loadingInitialized:Boolean;
        private var _skipExternals:Boolean;
        private var _badgePointLimits:Dictionary;
        private var _romanNumerals:Array;

        public function HabboLocalizationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override public function dispose():void;

        override protected function initComponent():void;

        private function onAuthenticated(k:Event):void;

        public function getLocalizationWithParams(k:String, _arg_2:String="", ... _args):String;

        public function getLocalizationWithParamMap(k:String, _arg_2:String="", _arg_3:Map=null):String;

        override public function getLocalization(k:String, _arg_2:String=""):String;

        public function getAchievementName(k:String):String;

        public function getAchievementDesc(k:String, _arg_2:int):String;

        public function getAchievementInstruction(k:String):String;

        public function getBadgeBaseName(k:String):String;

        public function getBadgeName(k:String):String;

        public function getBadgeDesc(k:String):String;

        public function getPreviousLevelBadgeId(k:String):String;

        public function setBadgePointLimit(k:String, _arg_2:int):void;

        private function configureLocalizationLocations():void;

        public function requestLocalizationInit():void;

        private function getBadgePointLimit(k:String):int;

        private function getExistingKey(k:Array):String;

        private function getRomanNumeral(k:int):String;

        private function parseDevelopmentLocalizations():void;

        override protected function onLocalizationFailed(k:AssetLoaderEvent):void;

        public function onLocalizationLoaded(k:Event):void;

        public function onLocalizationOverrideLoaded(k:Event):void;


    }
}//package com.sulake.habbo.localization

