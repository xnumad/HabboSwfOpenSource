//com.sulake.habbo.avatar.AvatarAssetDownloadLibrary

package com.sulake.habbo.avatar{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.events.Event;

    public class AvatarAssetDownloadLibrary extends EventDispatcherWrapper {

        private static var STATE_IDLE:int;
        private static var STATE_DOWNLOADING:int;
        private static var STATE_READY:int;
        private static const CACHE_KEY_PREFIX:String;

        private var _state:int;
        private var _libraryName:String;
        private var _revision:String;
        private var _downloadUrl:String;
        private var _assets:IAssetLibrary;
        private var _cacheKey:String;
        private var _isMandatory:Boolean;

        public function AvatarAssetDownloadLibrary(k:String, _arg_2:String, _arg_3:String, _arg_4:IAssetLibrary, _arg_5:String);

        override public function dispose():void;

        public function startDownloading():void;

        private function onLoaderError(k:LibraryLoaderEvent):void;

        private function onLoaderComplete(k:Event):void;

        public function get libraryName():String;

        public function get isReady():Boolean;

        public function purge():void;

        public function get isMandatory():Boolean;

        public function set isMandatory(k:Boolean):void;

        public function toString():String;


    }
}//package com.sulake.habbo.avatar

