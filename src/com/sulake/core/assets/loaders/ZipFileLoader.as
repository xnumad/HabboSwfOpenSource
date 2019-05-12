package com.sulake.core.assets.loaders
{
    import flash.net.URLStream;
    import flash.utils.ByteArray;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;

    public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader 
    {
        protected var _url:String;
        protected var _type:String;
        protected var _stream:URLStream;
        protected var _data:ByteArray;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _fromCache:Boolean = false;
        private var _id:int;

        public function ZipFileLoader(type:String, urlRequest:URLRequest=null, cacheKey:String=null, cacheRevision:int=-1, buffer:ByteArray=null, id:int=-1)
        {
            super();
            this._url = ((urlRequest == null) ? "" : urlRequest.url);
            this._type = type;
            this._stream = new URLStream();
            this._stream.addEventListener(Event.COMPLETE, loadEventHandler);
            this._stream.addEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
            this._stream.addEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
            this._stream.addEventListener(Event.OPEN, loadEventHandler);
            this._stream.addEventListener(ProgressEvent.PROGRESS, loadEventHandler);
            this._stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loadEventHandler);
            this._cacheKey = cacheKey;
            this._cacheRevision = cacheRevision;
            this._id = id;
            if (((!(buffer == null)) && (buffer.length > 0)))
            {
                this._fromCache = true;
                this._data = buffer;
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
            return (this._data) ? this._data : this._stream;
        }

        public function get bytes():ByteArray
        {
            if (this._data)
            {
                return this._data;
            }
            var k:ByteArray = new ByteArray();
            this._stream.readBytes(k);
            return k;
        }

        public function get mimeType():String
        {
            return this._type;
        }

        public function get bytesLoaded():uint
        {
            return this._stream.bytesAvailable;
        }

        public function get bytesTotal():uint
        {
            return this._stream.bytesAvailable;
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
            this._stream.load(urlRequest);
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                super.dispose();
                this._stream.removeEventListener(Event.COMPLETE, loadEventHandler);
                this._stream.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loadEventHandler);
                this._stream.removeEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
                this._stream.removeEventListener(Event.OPEN, loadEventHandler);
                this._stream.removeEventListener(ProgressEvent.PROGRESS, loadEventHandler);
                this._stream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loadEventHandler);
                this._stream.close();
                this._stream = null;
                this._type = null;
                this._url = null;
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
