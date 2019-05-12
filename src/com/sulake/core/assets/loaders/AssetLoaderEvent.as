package com.sulake.core.assets.loaders
{
    import flash.events.Event;

    public class AssetLoaderEvent extends Event 
    {
        public static const ASSETLOADEREVENTCOMPLETE:String = "AssetLoaderEventComplete";
        public static const ASSETLOADEREVENTPROGRESS:String = "AssetLoaderEventProgress";
        public static const ASSETLOADEREVENTUNLOAD:String = "AssetLoaderEventUnload";
        public static const ASSETLOADEREVENTSTATUS:String = "AssetLoaderEventStatus";
        public static const ASSETLOADEREVENTERROR:String = "AssetLoaderEventError";
        public static const ASSETLOADEREVENTOPEN:String = "AssetLoaderEventOpen";

        private var _status:int;

        public function AssetLoaderEvent(type:String, status:int)
        {
            this._status = status;
            super(type, false, false);
        }

        public function get status():int
        {
            return this._status;
        }

        override public function clone():Event
        {
            return new AssetLoaderEvent(type, this._status);
        }

        override public function toString():String
        {
            return formatToString("AssetLoaderEvent", "type", "status");
        }
    }
}
