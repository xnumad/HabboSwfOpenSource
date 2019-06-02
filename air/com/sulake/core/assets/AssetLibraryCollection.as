//com.sulake.core.assets.AssetLibraryCollection

package com.sulake.core.assets{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import flash.system.LoaderContext;
    import com.sulake.core.utils.LibraryLoader;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.net.URLRequest;

    public class AssetLibraryCollection extends EventDispatcherWrapper implements IAssetLibrary {

        protected var _assetLibraries:Vector.<IAssetLibrary>;
        protected var _fileLoadQueue:Array;
        protected var _loaderContext:LoaderContext;
        protected var _binLibrary:AssetLibrary;
        protected var _manifest:XML;
        protected var _name:String;
        private var _counter:uint;

        public function AssetLibraryCollection(k:String);

        public function get url():String;

        public function get name():String;

        public function get isReady():Boolean;

        public function get numAssets():uint;

        public function get nameArray():Array;

        public function get manifest():XML;

        public function get loaderContext():LoaderContext;

        public function set loaderContext(k:LoaderContext):void;

        private function get binLibrary():IAssetLibrary;

        public function loadFromFile(k:LibraryLoader, _arg_2:Boolean=false):void;

        public function loadFromResource(k:XML, _arg_2:Class):Boolean;

        public function unload():void;

        override public function dispose():void;

        private function loadEventHandler(k:LibraryLoaderEvent):void;

        public function getAssetLibraries():Vector.<IAssetLibrary>;

        public function hasAssetLibrary(k:String):Boolean;

        public function getAssetLibraryByName(k:String):IAssetLibrary;

        public function getAssetLibraryByUrl(k:String):IAssetLibrary;

        public function addAssetLibrary(k:IAssetLibrary):void;

        public function removeAssetLibrary(k:IAssetLibrary):void;

        public function loadAssetFromFile(k:String, _arg_2:URLRequest, _arg_3:String=null, _arg_4:String=null, _arg_5:int=-1, _arg_6:int=-1):AssetLoaderStruct;

        public function getAssetByName(k:String):IAsset;

        public function getAssetsByName(k:String):Array;

        public function getAssetByContent(k:Object):IAsset;

        public function getAssetByIndex(k:uint):IAsset;

        public function getAssetIndex(k:IAsset):int;

        public function hasAsset(k:String):Boolean;

        public function setAsset(k:String, _arg_2:IAsset, _arg_3:Boolean=true):Boolean;

        public function createAsset(k:String, _arg_2:AssetTypeDeclaration):IAsset;

        public function removeAsset(k:IAsset):IAsset;

        public function registerAssetTypeDeclaration(k:AssetTypeDeclaration, _arg_2:Boolean=true):Boolean;

        public function getAssetTypeDeclarationByMimeType(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;

        public function getAssetTypeDeclarationByClass(k:Class, _arg_2:Boolean=true):AssetTypeDeclaration;

        public function getAssetTypeDeclarationByFileName(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;

        private function getNumAssets():uint;

        private function getAssetNameArray():Array;

        public function getManifests():Array;

        private function buildManifest():XML;

        private function applyManifestNodes(k:XMLList, _arg_2:IAssetLibrary):void;


    }
}//package com.sulake.core.assets

