//com.sulake.core.utils.LibraryLoaderEvent

package com.sulake.core.utils{
    import flash.events.Event;

    public class LibraryLoaderEvent extends Event {

        public static const LIBRARY_LOADER_EVENT_COMPLETE:String;
        public static const LIBRARY_LOADER_EVENT_PROGRESS:String;
        public static const LIBRARY_LOADER_EVENT_UNLOAD:String;
        public static const LIBRARY_LOADER_EVENT_STATUS:String;
        public static const LIBRARY_LOADER_EVENT_ERROR:String;
        public static const LIBRARY_LOADER_EVENT_DEBUG:String;
        public static const LIBRARY_LOADER_EVENT_DISPOSE:String;

        private var _status:int;
        private var _bytesTotal:uint;
        private var _bytesLoaded:uint;
        private var _elapsedTime:uint;

        public function LibraryLoaderEvent(k:String, _arg_2:int, _arg_3:uint, _arg_4:uint, _arg_5:uint);

        public function get status():int;

        public function get bytesTotal():uint;

        public function get bytesLoaded():uint;

        public function get elapsedTime():uint;

        override public function clone():Event;


    }
}//package com.sulake.core.utils

