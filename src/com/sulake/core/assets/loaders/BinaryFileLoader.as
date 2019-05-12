package com.sulake.core.assets.loaders
{
    import flash.net.URLLoader;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.HTTPStatusEvent;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.net.URLLoaderDataFormat;

    public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader 
    {
        public static const CROSS_DOMAIN_XML:String = "/crossdomain.xml";

        protected var _url:String;
        protected var _type:String;
        protected var _data:Object;
        protected var _loader:URLLoader;
        private var _cacheKey:String = null;
        private var _cacheRevision:int = -1;
        private var _fromCache:Boolean = false;
        private var _id:int;

        public function BinaryFileLoader(k:String, urlRequest:URLRequest=null, cacheKey:String=null, cacheRevision:int=-1, data:ByteArray=null, id:int=-1)
        {
            super();
            this._url = ((urlRequest == null) ? "" : urlRequest.url);
            this._type = k;
            this._loader = new URLLoader();
            this._loader.addEventListener(Event.COMPLETE, loadEventHandler);
            this._loader.addEventListener(Event.UNLOAD, loadEventHandler);
            this._loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
            this._loader.addEventListener(ProgressEvent.PROGRESS, loadEventHandler);
            this._loader.addEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
            this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorEventHandler);
            this._cacheKey = cacheKey;
            this._cacheRevision = cacheRevision;
            this._id = id;
            if (((!(data == null)) && (data.length > 0)))
            {
                this._fromCache = true;
                this._data = data;
                var timer:Timer = new Timer(10, 1);
                timer.addEventListener(TimerEvent.TIMER, this.timerEventHandler);
                timer.start();
                return;
            }
            if (urlRequest != null)
            {
                this.load(urlRequest);
            }
        }

        public function get url():String
        {
            return this._url;
        }

        public function get content():Object
        {
            return (this._data) ? this._data : ((this._loader) ? this._loader.data : null);
        }

        public function get bytes():ByteArray
        {
            return (this._loader) ? this._loader.data : null;
        }

        public function get mimeType():String
        {
            return this._type;
        }

        public function get bytesLoaded():uint
        {
            return (this._loader) ? this._loader.bytesLoaded : 0;
        }

        public function get bytesTotal():uint
        {
            return (this._loader) ? this._loader.bytesTotal : 0;
        }

        public function get fromCache():Boolean
        {
            return this._fromCache;
        }

        public function get cacheKey():String
        {
            return this._cacheKey;
        }

        public function get cacheRevision():int
        {
            return this._cacheRevision;
        }

        public function get id():int
        {
            return this._id;
        }

        public function load(urlRequest:URLRequest):void
        {
            this._url = urlRequest.url;
            this._data = null;
            _retries = 0;
            this._loader.dataFormat = URLLoaderDataFormat.BINARY;
            this._loader.load(urlRequest);
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
                    }
                    catch(e:Error)
                    {
                    }
                    this._loader.load(new URLRequest((((this._url + ((this._url.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _retries)));
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
                this._loader.removeEventListener(Event.COMPLETE, loadEventHandler);
                this._loader.removeEventListener(Event.UNLOAD, loadEventHandler);
                this._loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
                this._loader.removeEventListener(ProgressEvent.PROGRESS, loadEventHandler);
                this._loader.removeEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
                this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorEventHandler);
                try
                {
                    this._loader.close();
                }
                catch(e:Error)
                {
                }
                this._loader = null;
                this._type = null;
                this._data = null;
                this._url = null;
            }
        }

        private function securityErrorEventHandler(event:SecurityErrorEvent):void
        {
            if (!_disposed)
            {
                loadEventHandler(event);
            }
        }

        private function timerEventHandler(event:TimerEvent):void
        {
            var timer:Timer = (event.target as Timer);
            if (timer)
            {
                timer.stop();
                timer.removeEventListener(TimerEvent.TIMER, this.timerEventHandler);
            }
            if (!_disposed)
            {
                loadEventHandler(new Event(Event.COMPLETE));
            }
        }
    }
}
