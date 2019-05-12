package com.sulake.core.utils
{
    import flash.events.Event;

    public class LibraryLoaderEvent extends Event 
    {
        public static const LIBRARY_LOADER_EVENT_COMPLETE:String = "LIBRARY_LOADER_EVENT_COMPLETE";
        public static const LIBRARY_LOADER_EVENT_PROGRESS:String = "LIBRARY_LOADER_EVENT_PROGRESS";
        public static const LIBRARY_LOADER_EVENT_UNLOAD:String = "LIBRARY_LOADER_EVENT_UNLOAD";
        public static const LIBRARY_LOADER_EVENT_STATUS:String = "LIBRARY_LOADER_EVENT_STATUS";
        public static const LIBRARY_LOADER_EVENT_ERROR:String = "LIBRARY_LOADER_EVENT_ERROR";
        public static const LIBRARY_LOADER_EVENT_DEBUG:String = "LIBRARY_LOADER_EVENT_DEBUG";
        public static const LIBRARY_LOADER_EVENT_DISPOSE:String = "LIBRARY_LOADER_EVENT_DISPOSE";

        private var _status:int;
        private var _bytesTotal:uint;
        private var _bytesLoaded:uint;
        private var _elapsedTime:uint;

        public function LibraryLoaderEvent(type:String, _status:int, bytesTotal:uint, bytesLoaded:uint, elapsedTime:uint)
        {
            this._status = status;
            this._bytesTotal = bytesTotal;
            this._bytesLoaded = bytesLoaded;
            this._elapsedTime = elapsedTime;
            super(type, false, false);
        }

        public function get status():int
        {
            return this._status;
        }

        public function get bytesTotal():uint
        {
            return this._bytesTotal;
        }

        public function get bytesLoaded():uint
        {
            return this._bytesLoaded;
        }

        public function get elapsedTime():uint
        {
            return this._elapsedTime;
        }

        override public function clone():Event
        {
            return new LibraryLoaderEvent(type, this._status, this._bytesTotal, this._bytesLoaded, this.elapsedTime);
        }
    }
}
