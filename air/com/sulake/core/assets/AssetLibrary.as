//com.sulake.core.assets.AssetLibrary

package com.sulake.core.assets{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.LibraryLoader;
    import flash.utils.ByteArray;
    import com.sulake.core.utils.IFileProxy;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.IAssetLoader;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.events.Event;
    import flash.events.ProgressEvent;

    public class AssetLibrary extends EventDispatcherWrapper implements IAssetLibrary {

        public static const ASSET_LIBRARY_READY:String;
        public static const ASSET_LIBRARY_LOADED:String;
        public static const ASSET_LIBRARY_UNLOADED:String;
        public static const ASSET_LIBRARY_LOAD_ERROR:String;
        private static const NAME:String;
        private static const ASSET:String;
        private static const PARAM:String;
        private static const TYPE:String;
        private static const LIB:String;
        private static const REF:String;
        private static var _sharedListOfTypesByMime:Dictionary;
        private static var _lazyAssetProcessor:LazyAssetProcessor;
        private static const USE_LAZY_ASSET_PROCESSOR:Boolean;
        private static var _numAssetLibraryInstances:uint;
        private static var _assetLibraryRefArray:Array;

        private var _name:String;
        private var _file:String;
        private var _manifest:XML;
        private var _isReady:Boolean;
        private var _numAssets:uint;
        private var _loader:LibraryLoader;
        private var _resource:Class;
        private var _loadedClasses:Dictionary;
        private var _loadedAssets:Dictionary;
        private var _prepareAssets:Boolean;
        private var _assetLoaderStructs:Dictionary;
        private var _assetNameArray:Array;
        private var _localListOfTypesByMime:Dictionary;

        public function AssetLibrary(k:String, _arg_2:XML=null);

        public static function get numAssetLibraryInstances():uint;

        public static function get assetLibraryRefArray():Array;

        public static function cloneBytes(k:ByteArray):ByteArray;

        private static function fetchLibraryContents(k:AssetLibrary, _arg_2:XML, _arg_3:Class):Boolean;


        public function get url():String;

        public function get name():String;

        public function get isReady():Boolean;

        public function get manifest():XML;

        public function get numAssets():uint;

        public function get nameArray():Array;

        private function get fileProxy():IFileProxy;

        private function getCacheFilePath(k:String, _arg_2:int, _arg_3:String):String;

        private function getCacheDirectoryPath(k:String):String;

        override public function dispose():void;

        public function loadFromFile(k:LibraryLoader, _arg_2:Boolean=true):void;

        public function loadFromResource(k:XML, _arg_2:Class):Boolean;

        public function unload():void;

        public function getClass(k:String):Class;

        public function loadAssetFromFile(k:String, _arg_2:URLRequest, _arg_3:String=null, _arg_4:String=null, _arg_5:int=-1, _arg_6:int=-1):AssetLoaderStruct;

        private function addToCache(k:IAssetLoader, _arg_2:String):void;

        private function assetLoadEventHandler(k:AssetLoaderEvent):void;

        public function getAssetByName(k:String):IAsset;

        public function getAssetByIndex(k:uint):IAsset;

        public function getAssetByContent(k:Object):IAsset;

        public function getAssetIndex(k:IAsset):int;

        public function hasAsset(k:String):Boolean;

        public function setAsset(k:String, _arg_2:IAsset, _arg_3:Boolean=true):Boolean;

        public function createAsset(k:String, _arg_2:AssetTypeDeclaration):IAsset;

        public function removeAsset(k:IAsset):IAsset;

        public function registerAssetTypeDeclaration(k:AssetTypeDeclaration, _arg_2:Boolean=true):Boolean;

        public function getAssetTypeDeclarationByMimeType(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;

        public function getAssetTypeDeclarationByClass(k:Class, _arg_2:Boolean=true):AssetTypeDeclaration;

        public function getAssetTypeDeclarationByFileName(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;

        private function libraryLoadedHandler(k:LibraryLoaderEvent):void;

        private function finalizeLoaderEventHandler(k:Event):void;

        private function onLoadProgress(k:ProgressEvent):void;

        private function loadErrorHandler(k:LibraryLoaderEvent):void;

        private function solveAssetTypeDeclarationFromUrl(k:String):AssetTypeDeclaration;

        private function fetchAssetFromResource(k:String):IAsset;

        public function toString():String;


    }
}//package com.sulake.core.assets

