//com.sulake.core.localization.CoreLocalizationManager

package com.sulake.core.localization{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class CoreLocalizationManager extends Component implements IDisposable, ICoreLocalizationManager {

        private var _localizations:Dictionary;
        private var _localizationDefinitions:Map;
        private var _activeLocalizationDefinition:String;
        private var _nonExistingKeysTable:Array;

        public function CoreLocalizationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override protected function initComponent():void;

        override public function dispose():void;

        public function registerLocalizationDefinition(k:String, _arg_2:String, _arg_3:String, _arg_4:String):void;

        public function activateLocalizationDefinition(k:String):Boolean;

        public function getLocalizationDefinitions():Map;

        public function getLocalizationDefinition(k:String):ILocalizationDefinition;

        public function getActiveLocalizationDefinition():ILocalizationDefinition;

        public function loadLocalizationFromURL(k:String):void;

        private function onLocalizationReady(k:AssetLoaderEvent):void;

        protected function onLocalizationFailed(k:AssetLoaderEvent):void;

        public function hasLocalization(k:String):Boolean;

        public function getLocalization(k:String, _arg_2:String=""):String;

        private function getRawValue(k:String, _arg_2:String=""):String;

        public function updateLocalization(k:String, _arg_2:String):void;

        private function updateAllListeners():void;

        public function registerListener(k:String, _arg_2:ILocalizable):Boolean;

        public function removeListener(k:String, _arg_2:ILocalizable):Boolean;

        public function registerParameter(k:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):String;

        public function getLocalizationRaw(k:String):ILocalization;

        public function getKeys():Array;

        public function printNonExistingKeys():void;

        protected function parseLocalizationData(k:String):void;


    }
}//package com.sulake.core.localization

