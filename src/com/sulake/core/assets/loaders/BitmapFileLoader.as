package com.sulake.core.assets.loaders
{
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.HTTPStatusEvent;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import com.sulake.core.utils.PlayerVersionCheck;
    import com.sulake.habbo.utils.images.PNGEncoder;
    import flash.events.TimerEvent;
    import flash.system.Security;

    public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader 
    {
        protected var _url:String;
        protected var _type:String;
        protected var _loader:Loader;
        protected var _loaderContext:LoaderContext;
        private var _cacheKey:String = null;
        private var _cacheRevision:int = -1;
        private var _fromCache:Boolean = false;
        private var _id:int = -1;
        private var _securityPollTimer:Timer;
        private var _storedCompleteEvent:Event;

        public function BitmapFileLoader(type:String, urlRequest:URLRequest=null, cacheKey:String=null, cacheRevision:int=-1, buffer:ByteArray=null, id:int=-1)
        {
            this._url = ((urlRequest == null) ? "" : urlRequest.url);
            this._type = type;
            this._loader = new Loader();
            this._loaderContext = new LoaderContext();
            this._loaderContext.checkPolicyFile = true;
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.completeEventHandler);
            this._loader.contentLoaderInfo.addEventListener(Event.UNLOAD, loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
            this._loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loadEventHandler);
            this._cacheKey = cacheKey;
            this._cacheRevision = cacheRevision;
            this._id = id;
            if (((!(buffer == null)) && (buffer.length > 0)))
            {
                this._fromCache = true;
                this._loader.loadBytes(buffer);
            }
            else
            {
                if (((!(urlRequest == null)) && (!(urlRequest.url == null))))
                {
                    this._loader.load(urlRequest, this._loaderContext);
                }
            }
        }

        public function get url():String
        {
            return this._url;
        }

        public function get content():Object
        {
            return (this._loader) ? this._loader.content : null;
        }

        public function get bytes():ByteArray
        {
            var bitmap:Bitmap = (this.content as Bitmap);
            if (bitmap == null)
            {
                return null;
            }
            if (PlayerVersionCheck.isVersionAtLeast(11, 3))
            {
            }
            return PNGEncoder.encode(bitmap.bitmapData);
        }

        public function get mimeType():String
        {
            return this._type;
        }

        public function get bytesLoaded():uint
        {
            return (this._loader) ? this._loader.contentLoaderInfo.bytesLoaded : 0;
        }

        public function get bytesTotal():uint
        {
            return (this._loader) ? this._loader.contentLoaderInfo.bytesTotal : 0;
        }

        public function get loaderContext():LoaderContext
        {
            return this._loaderContext;
        }

        public function get cacheKey():String
        {
            return this._cacheKey;
        }

        public function get cacheRevision():int
        {
            return this._cacheRevision;
        }

        public function get fromCache():Boolean
        {
            return this._fromCache;
        }

        public function get id():int
        {
            return this._id;
        }

        public function load(urlRequest:URLRequest):void
        {
            this._url = urlRequest.url;
            _retries = 0;
            this._loader.load(urlRequest, this._loaderContext);
        }

        override protected function retry():Boolean
        {
            if (!_disposed)
            {
                if (++_retries <= _attempts)
                {
                    try
                    {
                        this._loader.close();
                        this._loader.unload();
                    }
					catch(e : Error)
					{
						Habbo.trackLoginStep("Error Retry; " + e.message + " | " + e.getStackTrace());
					};
                    this._loader.load(new URLRequest((((this._url + ((this._url.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _retries)), this._loaderContext);
                    return true;
                }
            }
            return false;
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                super.dispose();
                this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.completeEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(Event.UNLOAD, loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
                this._loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loadEventHandler);
                if (this._securityPollTimer)
                {
                    this._securityPollTimer.stop();
                    this._securityPollTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.securityPollTimerEvent);
                    this._securityPollTimer = null;
                }
                try
                {
                    this._loader.close();
                }
                catch(e : Error)
                {
					Habbo.trackLoginStep("Error Dispose; " + e.message + " | " + e.getStackTrace());
                }
                this._loader.unload();
                this._loader = null;
                this._type = null;
                this._url = null;
            }
        }

        private function completeEventHandler(event:Event):void
        {
            if (this._url == this._loader.contentLoaderInfo.url)
            {
                loadEventHandler(event);
                return;
            }
            this._storedCompleteEvent = event;
            var pathIndex:int = this._loader.contentLoaderInfo.url.indexOf("//");
            var crossdomainXml:* = (this._loader.contentLoaderInfo.url.slice(0, (this._loader.contentLoaderInfo.url.indexOf("/", (pathIndex + 3)) + 1)) + "crossdomain.xml");
            Security.loadPolicyFile(crossdomainXml);
            this.startSecurityPolling();
        }

        private function securityPollTimerEvent(event:TimerEvent):void
        {
            if (this._loader.contentLoaderInfo.childAllowsParent)
            {
                loadEventHandler(this._storedCompleteEvent);
            }
            else
            {
                this.startSecurityPolling();
            }
        }

        private function startSecurityPolling():void
        {
            this._securityPollTimer = new Timer(250, 1);
            this._securityPollTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.securityPollTimerEvent);
            this._securityPollTimer.start();
        }
    }
}
