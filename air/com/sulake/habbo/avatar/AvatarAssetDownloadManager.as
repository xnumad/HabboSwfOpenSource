//com.sulake.habbo.avatar.AvatarAssetDownloadManager

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.Timer;
    import flash.events.Event;
    import com.sulake.core.runtime.events.LowMemoryEvent;

    public class AvatarAssetDownloadManager extends EventDispatcherWrapper {

        private static const GC_IMMINENCE_THRESHOLD:Number;
        public static const LIBRARY_LOADED:String;
        private static const LIB_BODY:String;
        private static const LIB_ITEMS:String;
        private static const LIB_FX:String;
        private static const LIB_AVATAR_EDITOR:String;

        private const DOWNLOAD_TIMEOUT:int;
        private const MAX_SIMULTANEOUS_DOWNLOADS:int;
        private const FIGURE_MAP:String;

        private var _missingMandatoryLibs:Array;
        private var _manager:AvatarRenderManager;
        private var _libraries:Dictionary;
        private var _figureMap:Dictionary;
        private var _assets:IAssetLibrary;
        private var _incompleteFigures:Dictionary;
        private var _listeners:Dictionary;
        private var _structure:AvatarStructure;
        private var _assetDownloadUrl:String;
        private var _configurationURL:String;
        private var _mapDownloadTriesLeft:int;
        private var _mapLoader:AssetLoaderStruct;
        private var _downloadShiftTimer:Timer;
        private var _isReady:Boolean;
        private var _isMapReady:Boolean;
        private var _initDownloadBuffer:Array;
        private var _pendingDownloadQueue:Array;
        private var _currentDownloads:Array;
        private var _assetLibraryNameTemplate:String;

        public function AvatarAssetDownloadManager(k:AvatarRenderManager, _arg_2:IAssetLibrary, _arg_3:String, _arg_4:String, _arg_5:AvatarStructure, _arg_6:String);

        override public function dispose():void;

        public function isReady():Boolean;

        private function addMapLoaderEventListeners(k:AssetLoaderStruct):void;

        private function removeMapLoaderEventListeners(k:AssetLoaderStruct):void;

        private function onfigureMapLoadError(k:Event=null):void;

        private function onFigureMapLoaded(k:Event):void;

        private function loadFigureMapData(k:XML):void;

        public function loadMandatoryLibs():void;

        public function purgeAvatarEditorLib():void;

        public function loadAvatarEditorLib():void;

        private function purgeInitDownloadBuffer(k:Event):void;

        private function generateMap(k:XML):void;

        public function isFigureReady(k:IAvatarFigureContainer):Boolean;

        public function loadFigureSetData(k:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void;

        private function libraryComplete(k:Event):void;

        public function isMissingMandatoryLibs():Boolean;

        private function getLibsToDownload(k:IAvatarFigureContainer):Array;

        private function processPending():void;

        private function addToQueue(k:AvatarAssetDownloadLibrary):void;

        private function onNextDownloadTimeout(k:Event=null):void;

        private function onLowMemoryWarning(k:LowMemoryEvent):void;

        private function forcePurgeLib(k:String):Boolean;

        public function purge():void;


    }
}//package com.sulake.habbo.avatar

