//com.sulake.core.utils.LibraryLoaderQueue

package com.sulake.core.utils{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;

    public class LibraryLoaderQueue extends EventDispatcherWrapper implements IDisposable {

        protected static const MAX_SIMULTANEOUS_DOWNLOADS:int;

        private var _debug:Boolean;
        private var _queue:Array;
        private var _loaders:Array;

        public function LibraryLoaderQueue(k:Boolean=false);

        public function get length():int;

        override public function dispose():void;

        public function push(k:LibraryLoader):void;

        private function next():void;

        private function libraryLoadedHandler(k:LibraryLoaderEvent):void;

        private function loadProgressHandler(k:LibraryLoaderEvent):void;

        private function loaderDisposeHandler(k:LibraryLoaderEvent):void;

        private function loadErrorHandler(k:LibraryLoaderEvent):void;

        private function removeLoader(k:LibraryLoader):void;

        private function isUrlInQueue(k:String, _arg_2:Boolean=true):Boolean;

        public function findLibraryLoaderByURL(k:String, _arg_2:Boolean=true):LibraryLoader;


    }
}//package com.sulake.core.utils

