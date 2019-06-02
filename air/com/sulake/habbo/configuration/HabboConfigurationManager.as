//com.sulake.habbo.configuration.HabboConfigurationManager

package com.sulake.habbo.configuration{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.ICoreConfiguration;
    import flash.utils.Dictionary;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;

    public class HabboConfigurationManager extends Component implements ICoreConfiguration, IHabboConfigurationManager {

        private static const DEFAULT_ENVIRONMENT:String;
        private static const INTERPOLATION_DEPTH_LIMIT:int;
        private static const REPLACE_CHAR:String;
        private static const SOL_ID:String;

        private var _skipExternalConfigurations:Boolean;
        private var _configurations:Dictionary;
        private var _initialized:Boolean;
        private var _readOnlyProperties:Array;
        private var _useHttps:Boolean;
        private var _environmentId:String;

        public function HabboConfigurationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public function updateEnvironmentId(k:String):void;

        public function resetAll():void;

        private function setupDefaultDevelopmentEnvironment():void;

        override public function dispose():void;

        override public function propertyExists(k:String):Boolean;

        override public function getProperty(k:String, _arg_2:Dictionary=null):String;

        override public function setProperty(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void;

        override public function getBoolean(k:String):Boolean;

        override public function getInteger(k:String, _arg_2:int):int;

        override public function updateUrlProtocol(k:String):String;

        override public function interpolate(k:String):String;

        public function initConfigurationDownload():void;

        private function parseConfiguration(k:String):void;

        private function fillParams(k:String, _arg_2:Dictionary):String;

        private function onConfigurationError(k:Event=null):void;

        private function onInitConfiguration(k:Event=null):void;

        private function configurationsLoaded():void;

        private function onConfigurationOverrideError(k:Event):void;

        private function onInitConfigurationOverride(k:Event):void;

        private function setDefaults():void;

        private function parseDevelopmentVariables():void;

        private function parseCommonVariables():void;

        private function parseLocalizationVariables():void;

        private function parseConfigurationAsset(k:String):void;

        private function updateEnvironmentVariables():void;

        private function parseStageVariables():void;


    }
}//package com.sulake.habbo.configuration

