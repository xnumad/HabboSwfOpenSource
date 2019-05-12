package com.sulake.core.utils
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.display.Loader;
    import deng.fzip.FZip;
    import flash.system.LoaderContext;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.utils.getTimer;
    import flash.display.DisplayObject;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.display.MovieClip;
    import flash.display.FrameLabel;
    import flash.utils.ByteArray;
    import deng.fzip.FZipFile;
    import com.sulake.core.Core;

    public class LibraryLoader extends EventDispatcherWrapper implements IDisposable 
    {
        protected static const STATE_EVENT_COMPLETE:uint = 1;
        protected static const STATE_EVENT_INIT:uint = 2;
        protected static const STATE_EVENT_FRAME:uint = 4;
        protected static const STATE_ANALYZE:uint = 3;
        protected static const STATE_READY:uint = 7;
        protected static const ZIP_STATE_READY:uint = 8;
        public static const DEFAULT_MAX_RETRIES:int = 5;
        public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
        public static const USE_DOWNLOAD_THROTTLING:Boolean = false;
        public static const MAX_SIMULTANEOUS_DOWNLOADS:int = 2;
        private static var _throttleQueue:Array = new Array();
        private static var _activeDownloads:Array = new Array();

        protected var _loader:Loader;
        private var _zipLoader:FZip;
        protected var _context:LoaderContext;
        protected var _status:int = 0;
        protected var _request:URLRequest;
        protected var _manifest:XML;
        protected var _resource:Class;
        protected var _process:uint = 0;
        protected var _name:String;
        protected var _ready:Boolean = false;
        protected var _debug:Boolean = false;
        protected var _paused:Boolean = false;
        protected var _errorMsg:String = "";
        protected var _debugMsg:String = "";
        protected var _downloadStartTime:int;
        protected var _downloadEndTime:int;
        protected var _downloadRetriesLeft:int;
        protected var _analyzeAttempts:uint = 0;

        public function LibraryLoader(k:LoaderContext=null, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            if (k == null)
            {
                this._context = new LoaderContext();
                this._context.applicationDomain = ApplicationDomain.currentDomain;
            }
            else
            {
                this._context = k;
            }
            this._paused = _arg_2;
            this._debug = _arg_3;
            this._status = 0;
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.INIT, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(Event.UNLOAD, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.loadEventHandler);
        }

        protected static function addRequestCounterToUrlRequest(request:URLRequest, counter:int):void
        {
            var index:int;
            if (((request.url == null) || (request.url == "")))
            {
                return;
            }
            var parameters:Array = request.url.split("?");
            var firstParameter:String = parameters[0];
            var remainingParameters:String = ((parameters.length > 1) ? parameters[1] : "");
            var newParameterName:String = "counterparameter";
            var params:Array = remainingParameters.split("&");
            var hasCounter:Boolean;
            index = 0;
            while (index < params.length)
            {
            	var p:String = params[index];
                if (p.indexOf((newParameterName + "=")) >= 0)
                {
                    p = ((newParameterName + "=") + counter.toString());
                    params[index] = p;
                    hasCounter = true;
                    break;
                }
                index++;
            }
            if (!hasCounter)
            {
                params.push(((newParameterName + "=") + counter));
            }
            index = 0;
            while (index < params.length)
            {
                firstParameter = (firstParameter + (((index == 0) ? "?" : "&") + params[index]));
                index++;
            }
            request.url = firstParameter;
        }

        protected static function parseNameFromUrl(url:String):String
        {
            var index:int;
            index = url.indexOf("?", 0);
            if (index > -1)
            {
                url = url.slice(0, index);
            }
            index = url.lastIndexOf(".");
            if (index > -1)
            {
                url = url.slice(0, index);
            }
            index = url.lastIndexOf("/");
            if (index > -1)
            {
                url = url.slice((index + 1), url.length);
            }
            return url;
        }

        protected static function queue(loader:LibraryLoader):void
        {
            if (USE_DOWNLOAD_THROTTLING)
            {
                if (_throttleQueue.indexOf(loader) == -1)
                {
                    _throttleQueue.push(loader);
                }
                throttle();
            }
            else
            {
                loader._loader.load(loader._request, loader._context);
            }
        }

        protected static function throttle():void
        {
            if (USE_DOWNLOAD_THROTTLING)
            {
                var activeDownloadsCounter:int = (_activeDownloads.length - 1);
                while (activeDownloadsCounter > -1)
                {
                    var loader:LibraryLoader = (_activeDownloads[activeDownloadsCounter] as LibraryLoader);
                    if (((loader) && ((loader.ready) || (loader.disposed))))
                    {
                        _activeDownloads.splice(activeDownloadsCounter, 1);
                    }
                    activeDownloadsCounter--;
                }
                while (((_activeDownloads.length < MAX_SIMULTANEOUS_DOWNLOADS) && (_throttleQueue.length > 0)))
                {
                    loader = (_throttleQueue.shift() as LibraryLoader);
                    if (((!(loader.ready)) && (!(loader.disposed))))
                    {
                        _activeDownloads.push(loader);
                        loader._loader.load(loader._request, loader._context);
                    }
                }
            }
        }


        public function get url():String
        {
            return (this._request) ? this._request.url : null;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get ready():Boolean
        {
            return this._ready;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get domain():ApplicationDomain
        {
            return this._loader.contentLoaderInfo.applicationDomain;
        }

        public function get request():URLRequest
        {
            return this._request;
        }

        public function get resource():Class
        {
            return this._resource;
        }

        public function get manifest():XML
        {
            return this._manifest;
        }

        public function get bytesTotal():uint
        {
            return this._loader.contentLoaderInfo.bytesTotal;
        }

        public function get bytesLoaded():uint
        {
            return this._loader.contentLoaderInfo.bytesLoaded;
        }

        public function get elapsedTime():uint
        {
            return (this._ready) ? (this._downloadEndTime - this._downloadStartTime) : (getTimer() - this._downloadStartTime);
        }

        public function get paused():Boolean
        {
            return this._paused;
        }

        public function get zipLoader():FZip
        {
            return this._zipLoader;
        }

        protected function get content():DisplayObject
        {
            return this._loader.content;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
                try
                {
                    this._loader.close();
                }
                catch(e:Error)
                {
                }
                try
                {
                    this._loader.unload();
                }
                catch(e:Error)
                {
                }
                this._loader = null;
                this._context = null;
                this._resource = null;
                this._manifest = null;
                super.dispose();
            }
        }

        public function load(k:URLRequest, _arg_2:int=5):void
        {
            this._request = k;
            this._name = parseNameFromUrl(this._request.url);
            this._ready = false;
            this._downloadRetriesLeft = _arg_2;
            ErrorReportStorage.addDebugData("Library url", ("Library url " + k.url));
            ErrorReportStorage.addDebugData("Library name", ("Library name " + this._name));
            if (!this._paused)
            {
                this._paused = true;
                this.resume();
            }
        }

        public function resume():void
        {
            if (((this._paused) && (!(_disposed))))
            {
                this._paused = false;
                if (((!(this._ready)) && (this._request)))
                {
                    this._downloadEndTime = -1;
                    this._downloadStartTime = getTimer();
                    if (this._zipLoader)
                    {
                        this._zipLoader.load(this._request);
                    }
                    else
                    {
                        queue(this);
                    }
                }
            }
        }

        protected function retry():Boolean
        {
            if ((((!(this._ready)) && (!(_disposed))) && (this._downloadRetriesLeft > 0)))
            {
                try
                {
                    this._loader.close();
                    this._loader.unload();
                }
                catch(e:Error)
                {
                }
                addRequestCounterToUrlRequest(this._request, (DEFAULT_MAX_RETRIES - this._downloadRetriesLeft));
                this._downloadRetriesLeft--;
                this._process = 0;
                this._loader.load(this._request, this._context);
                return true;
            }
            return false;
        }

        public function hasDefinition(k:String):Boolean
        {
            var definitionFound:Boolean;
            try
            {
                definitionFound = this._loader.contentLoaderInfo.applicationDomain.hasDefinition(k);
            }
            catch(e:Error)
            {
            }
            return definitionFound;
        }

        public function getDefinition(k:String):Object
        {
            var definition:Object;
            try
            {
                if (this._loader.contentLoaderInfo.applicationDomain.hasDefinition(k))
                {
                    definition = this._loader.contentLoaderInfo.applicationDomain.getDefinition(k);
                }
            }
            catch(e:Error)
            {
            }
            return definition;
        }

        protected function loadEventHandler(k:Event):void
        {
            switch (k.type)
            {
                case Event.INIT:
                    this.debug((('Load event INIT for file "' + this.url) + '"'));
                    this._process = (this._process | LibraryLoader.STATE_EVENT_INIT);
                    break;
                case Event.COMPLETE:
                    this.debug((('Load event COMPLETE for file "' + this.url) + '"'));
                    this._process = (this._process | LibraryLoader.STATE_EVENT_COMPLETE);
                    break;
                case Event.ENTER_FRAME:
                    break;
                case HTTPStatusEvent.HTTP_STATUS:
                    this._status = HTTPStatusEvent(k).status;
                    this.debug((((("Load event STATUS " + this._status) + ' for file "') + this.url) + '"'));
                    break;
                case Event.UNLOAD:
                    this.debug((('Load event UNLOAD for file "' + this.url) + '"'));
                    dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
                    break;
                case ProgressEvent.PROGRESS:
                    this.debug(((((('Load event PROGRESS for file "' + this.url) + '"  bytes: ') + this.bytesLoaded) + "/") + this.bytesTotal));
                    dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
                    break;
                case IOErrorEvent.IO_ERROR:
                    this.debug((('Load event IO ERROR for file "' + this.url) + '"'));
                    if (!this.handleHttpStatus(this._status))
                    {
                        this._downloadEndTime = getTimer();
                        this.failure((('IO Error, send or load operation failed for file "' + this.url) + '"'));
                        this.removeEventListeners();
                    }
                    break;
                case SecurityErrorEvent.SECURITY_ERROR:
                    this._downloadEndTime = getTimer();
                    this.failure((('Security Error, security violation with file "' + this.url) + '"'));
                    this.removeEventListeners();
                    break;
                case TimerEvent.TIMER:
            		var timer:Timer;
                    timer = (TimerEvent(k).target as Timer);
                    timer.removeEventListener(TimerEvent.TIMER, this.loadEventHandler);
                    timer.stop();
                    if (!_disposed)
                    {
                        this._process = LibraryLoader.STATE_READY;
                        this.loadEventHandler(new Event(Event.COMPLETE));
                    }
                    return;
            }
            if (this._process == LibraryLoader.STATE_ANALYZE)
            {
                if (this.analyzeLibrary())
                {
                    this._process = (this._process | LibraryLoader.STATE_EVENT_FRAME);
                }
            }
            if (this._process == LibraryLoader.STATE_READY)
            {
                if (this.prepareLibrary())
                {
                    this._ready = true;
                    this._downloadEndTime = getTimer();
                    this.removeEventListeners();
                    throttle();
                    dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
                    dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
                }
            }
        }

        private function onUnzipComplete(event:Event):void
        {
            var fzip:FZip = (event.target as FZip);
            fzip.removeEventListener(Event.COMPLETE, this.onUnzipComplete);
            this._process = LibraryLoader.ZIP_STATE_READY;
            if (this._process == LibraryLoader.ZIP_STATE_READY)
            {
                if (this.prepareZipLibrary())
                {
                    this._ready = true;
                    this._downloadEndTime = getTimer();
                    this.removeEventListeners();
                    throttle();
                    dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
                    dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
                }
            }
        }

        protected function analyzeLibrary():Boolean
        {
            this.debug((((('Analyzing library "' + this._name) + '", content ') + ((this.content is MovieClip) ? "is" : "is not")) + " a MovieClip"));
            this.debug(((("\tBytes loaded: " + this._loader.contentLoaderInfo.bytesLoaded) + "/") + this._loader.contentLoaderInfo.bytesTotal));
            if ((this.content is MovieClip))
            {
            	var content:MovieClip = (this.content as MovieClip);
                this.debug((((((('\tLibrary "' + this._name) + '" is in frame ') + content.currentFrame) + "(") + content.currentLabel) + ")"));
                if (content.currentLabels.length > 1)
                {
                    var index:uint = 0;
                    while (index < content.currentLabels.length)
                    {
                        var frameLabel:FrameLabel = (content.currentLabels[index] as FrameLabel);
                        if (frameLabel.name == this._name)
                        {
                            if (frameLabel.frame != content.currentFrame)
                            {
                                content.addEventListener(Event.ENTER_FRAME, this.loadEventHandler);
                                return false;
                            }
                        }
                        index++;
                    }
                }
            }
            return true;
        }

        protected function prepareLibrary():Boolean
        {
            var xmlClass:Class;
            this.debug((('Preparing library "' + this._name) + '"'));
            this._resource = (this.getDefinition(this._name) as Class);
            if (this._resource == null)
            {
                if (!this.retry())
                {
                    this.failure((((('Failed to find resource class "' + this._name) + '" from library ') + this._request.url) + "!"));
                }
                return false;
            }
            var result:Boolean = true;
            try
            {
                xmlClass = (this._resource.manifest as Class);
                if (xmlClass == null)
                {
                    return false;
                }
            }
            catch(e:Error)
            {
                if (!retry())
                {
                    failure((("Failed to find embedded manifest.xml from library " + _request.url) + "!"));
                }
                result = false;
            }
            if (!result)
            {
                return false;
            }
            var bytes:ByteArray = (new (xmlClass)() as ByteArray);
            try
            {
                this._manifest = new XML(bytes.readUTFBytes(bytes.length));
            }
            catch(e:Error)
            {
                if (!retry())
                {
                    failure(((("Failed to extract manifest.xml from library " + _name) + "!\n") + e.message));
                }
                result = false;
            }
            return result;
        }

        protected function prepareZipLibrary():Boolean
        {
            var xmlFile:FZipFile;
            this.debug((('Preparing ZIP library "' + this._name) + '"'));
            if (this._zipLoader == null)
            {
                this.failure((((('Failed to find resource class "' + this._name) + '" from ZIP library ') + this._request.url) + "!"));
                return false;
            }
            this._resource = FZip;
            var result:Boolean = true;
            try
            {
                xmlFile = this._zipLoader._Str_1843("manifest.xml");
                if (xmlFile == null)
                {
                    return false;
                }
            }
            catch(e:Error)
            {
                if (!retry())
                {
                    failure((("Failed to find embedded manifest.xml from ZIP library " + _request.url) + "!"));
                }
                result = false;
            }
            if (!result)
            {
                return false;
            }
            var bytes:ByteArray = xmlFile.content;
            try
            {
                this._manifest = new XML(bytes.readUTFBytes(bytes.length));
            }
            catch(e:Error)
            {
                if (!retry())
                {
                    failure(((("Failed to extract manifest.xml from library " + _name) + "!\n") + e.message));
                }
                result = false;
            }
            return result;
        }

        protected function handleHttpStatus(status:int):Boolean
        {
            if (((status == 0) || (status >= 400)))
            {
                if (this.retry())
                {
                    return true;
                }
                this.failure((((("HTTP Error " + status) + ' "') + this._loader.contentLoaderInfo.url) + '"'));
                this.removeEventListeners();
            }
            return false;
        }

        protected function removeEventListeners():void
        {
            if (this._loader)
            {
                if (this._loader.content != null)
                {
                    this._loader.content.removeEventListener(Event.ENTER_FRAME, this.loadEventHandler);
                }
                this._loader.contentLoaderInfo.removeEventListener(Event.INIT, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(Event.UNLOAD, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.loadEventHandler);
            }
        }

        protected function debug(debugMsg:String):void
        {
            Core.debug(debugMsg);
            this._debugMsg = debugMsg;
            if (this._debug)
            {
                dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
            }
        }

        protected function failure(failureMsg:String):void
        {
            Core.warning(failureMsg);
            this._errorMsg = failureMsg;
            throttle();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this._status, this.bytesTotal, this.bytesLoaded, this.elapsedTime));
            dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
        }

        public function getLastDebugMessage():String
        {
            return this._debugMsg;
        }

        public function getLastErrorMessage():String
        {
            return this._errorMsg;
        }
    }
}
