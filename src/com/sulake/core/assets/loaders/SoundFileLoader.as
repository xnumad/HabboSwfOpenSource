package com.sulake.core.assets.loaders
{
    import flash.media.Sound;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;

    public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader 
    {
        protected var _url:String;
        protected var _type:String;
        protected var _soundLoader:Sound;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _fromCache:Boolean = false;
        private var _id:int;

        public function SoundFileLoader(type:String, urlRequest:URLRequest=null, cacheKey:String=null, cacheRevision:int=-1, buffer:ByteArray=null, id:int=-1)
        {
            this._url = ((urlRequest == null) ? "" : urlRequest.url);
            this._type = type;
            this._soundLoader = new Sound(null, null);
            this._soundLoader.addEventListener(Event.ID3, loadEventHandler);
            this._soundLoader.addEventListener(Event.OPEN, loadEventHandler);
            this._soundLoader.addEventListener(Event.COMPLETE, loadEventHandler);
            this._soundLoader.addEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
            this._soundLoader.addEventListener(ProgressEvent.PROGRESS, loadEventHandler);
            this._cacheKey = cacheKey;
            this._cacheRevision = cacheRevision;
            this._id = id;
            if (((!(buffer == null)) && (buffer.length > 0)))
            {
                this._fromCache = true;
                this._soundLoader.loadPCMFromByteArray(buffer, buffer.length);
            }
            else
            {
                if (urlRequest != null)
                {
                    this.load(urlRequest);
                }
            }
        }

        public function get url():String
        {
            return this._url;
        }

        public function get content():Object
        {
            return this._soundLoader;
        }

        public function get bytes():ByteArray
        {
            var k:ByteArray = new ByteArray();
            this._soundLoader.extract(k, this._soundLoader.length);
            return k;
        }

        public function get mimeType():String
        {
            return this._type;
        }

        public function get bytesLoaded():uint
        {
            return (this._soundLoader) ? this._soundLoader.bytesLoaded : 0;
        }

        public function get bytesTotal():uint
        {
            return (this._soundLoader) ? this._soundLoader.bytesTotal : 0;
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

        override public function dispose():void
        {
            if (!disposed)
            {
                this._soundLoader.removeEventListener(Event.ID3, loadEventHandler);
                this._soundLoader.removeEventListener(Event.OPEN, loadEventHandler);
                this._soundLoader.removeEventListener(Event.COMPLETE, loadEventHandler);
                this._soundLoader.removeEventListener(IOErrorEvent.IO_ERROR, loadEventHandler);
                this._soundLoader.removeEventListener(ProgressEvent.PROGRESS, loadEventHandler);
                this._soundLoader = null;
                this._type = null;
                this._url = null;
                super.dispose();
            }
        }

        public function load(urlRequest:URLRequest):void
        {
            this._url = urlRequest.url;
            this._soundLoader.load(urlRequest, null);
        }
    }
}
