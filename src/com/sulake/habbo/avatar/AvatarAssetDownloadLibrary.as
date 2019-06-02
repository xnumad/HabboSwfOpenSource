package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.net.URLRequest;
    import com.sulake.core.utils.LibraryLoader;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import com.sulake.core.Core;
    import flash.events.Event;

    public class AvatarAssetDownloadLibrary extends EventDispatcherWrapper 
    {
        private static var _Str_694:int = 0;
        private static var _Str_997:int = 1;
        private static var _Str_599:int = 2;

        private var _state:int;
        private var _libraryName:String;
        private var _revision:String;
        private var _downloadUrl:String;
        private var _assets:IAssetLibrary;

        public function AvatarAssetDownloadLibrary(k:String, _arg_2:String, _arg_3:String, _arg_4:IAssetLibrary, _arg_5:String)
        {
            this._state = _Str_694;
            this._assets = _arg_4;
            this._libraryName = String(k);
            this._revision = String(_arg_2);
            this._downloadUrl = (_arg_3 + _arg_5);
            this._downloadUrl = this._downloadUrl.replace("%libname%", this._libraryName);
            this._downloadUrl = this._downloadUrl.replace("%revision%", this._revision);
            var _local_6:AssetLibraryCollection = (this._assets as AssetLibraryCollection);
            var _local_7:IAssetLibrary = _local_6.getAssetLibraryByUrl((this._libraryName + ".swf"));
            if (_local_7 != null)
            {
                this._state = _Str_599;
            }
        }

        override public function dispose():void
        {
            super.dispose();
        }

        public function startDownloading():void
        {
            this._state = _Str_997;
            var k:URLRequest = new URLRequest(this._downloadUrl);
            var _local_2:LibraryLoader = new LibraryLoader();
            this._assets.loadFromFile(_local_2, true);
            _local_2.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.onLoaderComplete);
            _local_2.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.onLoaderError);
            _local_2.load(k);
        }

        private function onLoaderError(k:LibraryLoaderEvent):void
        {
            Core.error(((((((((("Could not load avatar asset library " + this._libraryName) + " from URL ") + this._downloadUrl) + " HTTP status ") + k.status) + " bytes loaded ") + k.bytesLoaded) + "/") + k.bytesTotal), false, Core.ERROR_CATEGORY_DOWNLOAD_LIBRARY);
        }

        private function onLoaderComplete(k:Event):void
        {
            var _local_2:LibraryLoader = (k.target as LibraryLoader);
            _local_2.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.onLoaderComplete);
            _local_2.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.onLoaderError);
            this._state = _Str_599;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        public function get libraryName():String
        {
            return this._libraryName;
        }

        public function get isReady():Boolean
        {
            return this._state == _Str_599;
        }

        public function toString():String
        {
            var k:String = this._libraryName;
            k = (k + ((this.isReady) ? "[x]" : "[ ]"));
            return k;
        }
    }
}
