//com.sulake.core.assets.loaders.BitmapFileLoader

package com.sulake.core.assets.loaders{
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.TimerEvent;

    public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader {

        protected var _url:String;
        protected var _type:String;
        protected var _loader:Loader;
        protected var _loaderContext:LoaderContext;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _fromCache:Boolean;
        private var _id:int;
        private var _securityPollTimer:Timer;
        private var _storedCompleteEvent:Event;

        public function BitmapFileLoader(k:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:ByteArray=null, _arg_6:int=-1);

        public function get url():String;

        public function get content():Object;

        public function get bytes():ByteArray;

        public function get mimeType():String;

        public function get bytesLoaded():uint;

        public function get bytesTotal():uint;

        public function get loaderContext():LoaderContext;

        public function get cacheKey():String;

        public function get cacheRevision():int;

        public function get fromCache():Boolean;

        public function get id():int;

        public function load(k:URLRequest):void;

        override protected function retry():Boolean;

        override public function dispose():void;

        private function completeEventHandler(k:Event):void;

        private function securityPollTimerEvent(k:TimerEvent):void;

        private function startSecurityPolling():void;


    }
}//package com.sulake.core.assets.loaders

