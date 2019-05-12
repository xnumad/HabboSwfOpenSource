package com.sulake.core.utils
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;

    public class LibraryLoaderQueue extends EventDispatcherWrapper implements IDisposable 
    {
        protected static const MAX_SIMULTANEOUS_DOWNLOADS:int = 4;

        private var _debug:Boolean = false;
        private var _queue:Array;
        private var _loaders:Array;

        public function LibraryLoaderQueue(debug:Boolean=false)
        {
            this._queue = new Array();
            this._loaders = new Array();
            this._debug = debug;
            super();
        }

        public function get length():int
        {
            return this._queue.length + this._loaders.length;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                for each (var loader:LibraryLoader in this._loaders)
                {
                    loader.dispose();
                }
                for each (loader in this._queue)
                {
                    loader.dispose();
                }
                this._loaders = null;
                this._queue = null;
                super.dispose();
            }
        }

        public function push(loader:LibraryLoader):void
        {
            if ((((!(disposed)) && (!(this.isUrlInQueue(loader.url)))) && (!(this.findLibraryLoaderByURL(loader.url)))))
            {
                if (loader.paused)
                {
                    this._queue.push(loader);
                }
                else
                {
                    this._loaders.push(loader);
                }
                loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.libraryLoadedHandler);
                loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this.loadProgressHandler);
                loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE, this.loaderDisposeHandler);
                loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadErrorHandler);
                this.next();
            }
        }

        private function next():void
        {
            if (!disposed)
            {
                while (((this._loaders.length < MAX_SIMULTANEOUS_DOWNLOADS) && (this._queue.length > 0)))
                {
                    var loader:LibraryLoader = this._queue.shift();
                    this._loaders.push(loader);
                    loader.resume();
                }
            }
        }

        private function libraryLoadedHandler(event:LibraryLoaderEvent):void
        {
            var loader:LibraryLoader = (event.target as LibraryLoader);
            if (loader)
            {
                this.removeLoader(loader);
            }
            this.next();
        }

        private function loadProgressHandler(event:LibraryLoaderEvent):void
        {
            var _local_2:LibraryLoader = (event.target as LibraryLoader);
        }

        private function loaderDisposeHandler(event:LibraryLoaderEvent):void
        {
            var loader:LibraryLoader = (event.target as LibraryLoader);
            this.removeLoader(loader);
            this.next();
        }

        private function loadErrorHandler(event:LibraryLoaderEvent):void
        {
            var loader:LibraryLoader = (event.target as LibraryLoader);
            if (loader)
            {
                this.removeLoader(loader);
            }
            this.next();
        }

        private function removeLoader(loader:LibraryLoader):void
        {
            var index:int;
            loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.libraryLoadedHandler);
            loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this.loadProgressHandler);
            loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE, this.loaderDisposeHandler);
            loader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadErrorHandler);
            try
            {
                index = this._queue.indexOf(loader);
                if (index > -1)
                {
                    this._queue.splice(index, 1);
                }
                index = this._loaders.indexOf(loader);
                if (index > -1)
                {
                    this._loaders.splice(index, 1);
                }
            }
            catch(e:Error)
            {
            }
        }

        private function isUrlInQueue(url:String, removeParameter:Boolean=true):Boolean
        {
            if (!disposed)
            {
                if (((removeParameter) && (url.indexOf("?") > -1)))
                {
                    url = url.slice(0, url.indexOf("?"));
                }
                for each (var loader:LibraryLoader in this._queue)
                {
                    if (removeParameter)
                    {
                        if (loader.url.indexOf(url) == 0)
                        {
                            return true;
                        }
                    }
                    else
                    {
                        if (loader.url == url)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        public function findLibraryLoaderByURL(url:String, removeParameter:Boolean=true):LibraryLoader
        {
            if (!disposed)
            {
                if (((removeParameter) && (url.indexOf("?") > -1)))
                {
                    url = url.slice(0, url.indexOf("?"));
                }
                for each (var loader:LibraryLoader in this._loaders)
                {
                    if (removeParameter)
                    {
                        if (loader.url.indexOf(url) == 0)
                        {
                            return loader;
                        }
                    }
                    else
                    {
                        if (loader.url == url)
                        {
                            return loader;
                        }
                    }
                }
            }
            return null;
        }
    }
}
