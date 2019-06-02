//com.sulake.habbo.avatar.AvatarRenderManager

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.habbo.avatar.structure.IFigureData;
    import com.sulake.habbo.avatar.animation.IAnimationManager;
    import com.sulake.core.assets.IAsset;

    public class AvatarRenderManager extends Component implements IAvatarRenderManager {

        private const PRE_PLACEHOLDER_FIGURE:String;
        private const PLACEHOLDER_FIGURE:String;

        private var _aliasCollection:AssetAliasCollection;
        private var _structure:AvatarStructure;
        private var _mode:String;
        private var _avatarAssetDownloadManager:AvatarAssetDownloadManager;
        private var _placeholderFigure:AvatarFigureContainer;
        private var _prePlaceholderFigure:AvatarFigureContainer;
        private var _gpuMode:Boolean;
        private var _isReady:Boolean;
        private var _isConfigurationReady:Boolean;
        private var _inNuxFlow:Boolean;

        public function AvatarRenderManager(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary, _arg_4:Boolean=false);

        override protected function get dependencies():Vector.<ComponentDependency>;

        override protected function initComponent():void;

        override public function dispose():void;

        private function onConfigurationComplete(k:Event):void;

        private function createAssetDownloadManager():void;

        private function createStructure():void;

        private function onAvatarAssetsLibraryReady(k:Event=null):void;

        public function onMandatoryLibrariesReady():void;

        public function loadAvatarEditorLibrary():void;

        public function purgeAvatarEditorLibrary():void;

        public function onAvatarEditorLibraryReady():void;

        public function continueInitSequence():void;

        public function createFigureContainer(k:String):IAvatarFigureContainer;

        public function isFigureReady(k:IAvatarFigureContainer):Boolean;

        public function downloadFigure(k:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void;

        public function createAvatarImage(k:String, _arg_2:String, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:String=null):IAvatarImage;

        private function createPrePlaceholderImage(k:String):IAvatarImage;

        private function createPlaceholderImage(k:String):IAvatarImage;

        private function createImage(k:AvatarFigureContainer, _arg_2:String, _arg_3:String):IAvatarImage;

        public function getFigureData():IFigureData;

        public function getItemIds():Array;

        public function getAnimationManager():IAnimationManager;

        public function getMandatoryAvatarPartSetIds(k:String, _arg_2:int):Array;

        public function getAssetByName(k:String):IAsset;

        public function get mode():String;

        public function set mode(k:String):void;

        public function injectFigureData(k:XML):void;

        private function validateAvatarFigure(k:AvatarFigureContainer, _arg_2:String):Boolean;

        public function resolveClubLevel(k:IAvatarFigureContainer, _arg_2:String, _arg_3:Array=null):int;

        public function resetAssetManager():void;

        public function purgeAssets():void;


    }
}//package com.sulake.habbo.avatar

