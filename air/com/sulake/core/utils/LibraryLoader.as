//com.sulake.core.utils.LibraryLoader

package com.sulake.core.utils{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.display.Loader;
    import flash.net.URLLoader;
    import flash.system.LoaderContext;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import com.codeazur.as3swf.SWF;
    import flash.utils.Dictionary;
    import flash.system.ApplicationDomain;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class LibraryLoader extends EventDispatcherWrapper implements IDisposable {

        protected static const STATE_EVENT_COMPLETE:uint;
        protected static const STATE_EVENT_INIT:uint;
        protected static const STATE_ANALYZE:uint;
        protected static const STATE_EVENT_FRAME:uint;
        protected static const STATE_EVENT_OPEN:uint;
        protected static const STATE_READY:uint;
        public static const DEFAULT_MAX_RETRIES:int;
        public static const LIBRARY_LOADER_FINALIZE:String;
        private static const CACHE_FILE_NAME:String;
        private static const TIMESTAMP_FILE_NAME:String;
        public static const USE_DOWNLOAD_THROTTLING:Boolean;
        public static const MAX_SIMULTANEOUS_DOWNLOADS:int;
        private static var _throttleQueue:Array;
        private static var _activeDownloads:Array;

        protected var _loader:Loader;
        protected var _urlLoader:URLLoader;
        protected var _context:LoaderContext;
        protected var _status:int;
        protected var _request:URLRequest;
        protected var _manifest:XML;
        protected var _resource:Class;
        protected var _process:uint;
        protected var _name:String;
        protected var _ready:Boolean;
        protected var _debug:Boolean;
        protected var _paused:Boolean;
        protected var _errorMsg:String;
        protected var _debugMsg:String;
        protected var _cachedBytes:ByteArray;
        protected var _downloadStartTime:int;
        protected var _downloadEndTime:int;
        protected var _downloadRetriesLeft:int;
        protected var _analyzeAttempts:uint;
        protected var _cacheKey:String;
        protected var _cacheRevision:int;
        private var _iosCompatibilityMode:Boolean;

        public function LibraryLoader(k:LoaderContext=null, _arg_2:Boolean=false, _arg_3:Boolean=false);

        protected static function parseNameFromUrl(k:String):String;

        protected static function queue(k:LibraryLoader):void;

        protected static function throttle():void;

        public static function makeSWF(k:String, _arg_2:ByteArray, _arg_3:Class):ByteArray;

        private static function getSymbolClassList(k:SWF, _arg_2:String):Dictionary;

        private static function getBinaryBlobs(k:SWF):Dictionary;

        private static function getLosslessImageBlobs(k:SWF):Dictionary;


        public function get url():String;

        public function get name():String;

        public function get ready():Boolean;

        public function get status():int;

        public function get domain():ApplicationDomain;

        public function get request():URLRequest;

        public function get resource():Class;

        public function get manifest():XML;

        public function get bytesTotal():uint;

        public function get bytesLoaded():uint;

        public function get elapsedTime():uint;

        public function get paused():Boolean;

        protected function get content():DisplayObject;

        private function get fileProxy():IFileProxy;

        override public function dispose():void;

        public function load(k:URLRequest, _arg_2:String=null, _arg_3:int=-1, _arg_4:int=5):void;

        private function getCacheFilePath():String;

        private function getCacheDirectoryPath():String;

        public function resume():void;

        protected function retry():Boolean;

        public function hasDefinition(k:String):Boolean;

        public function getDefinition(k:String):Object;

        protected function loadEventHandler(k:Event):void;

        private function addToCache():void;

        protected function analyzeLibrary():Boolean;

        protected function prepareLibrary():Boolean;

        protected function handleHttpStatus(k:int):Boolean;

        protected function addRequestCounterToUrlRequest(k:URLRequest, _arg_2:int):void;

        protected function removeEventListeners():void;

        protected function debug(k:String):void;

        protected function failure(k:String):void;

        public function getLastDebugMessage():String;

        public function getLastErrorMessage():String;

        public function get bytes():ByteArray;


    }
}//package com.sulake.core.utils

