//com.sulake.core.assets.loaders.AssetLoaderEvent

package com.sulake.core.assets.loaders{
    import flash.events.Event;

    public class AssetLoaderEvent extends Event {

        public static const ASSET_LOADER_EVENT_COMPLETE:String;
        public static const ASSET_LOADER_EVENT_PROGRESS:String;
        public static const ASSET_LOADER_EVENT_UNLOAD:String;
        public static const ASSET_LOADER_EVENT_STATUS:String;
        public static const ASSET_LOADER_EVENT_ERROR:String;
        public static const ASSET_LOADER_EVENT_OPEN:String;

        private var _status:int;

        public function AssetLoaderEvent(k:String, _arg_2:int);

        public function get status():int;

        override public function clone():Event;

        override public function toString():String;


    }
}//package com.sulake.core.assets.loaders

