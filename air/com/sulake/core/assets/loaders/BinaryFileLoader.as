//com.sulake.core.assets.loaders.BinaryFileLoader

package com.sulake.core.assets.loaders{
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.SecurityErrorEvent;
    import flash.events.TimerEvent;

    public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader {

        public static const CROSS_DOMAIN_XML:String;

        protected var _url:String;
        protected var _type:String;
        protected var _data:Object;
        protected var _loader:URLLoader;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _fromCache:Boolean;
        private var _id:int;

        public function BinaryFileLoader(k:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:ByteArray=null, _arg_6:int=-1);

        public function get url():String;

        public function get content():Object;

        public function get bytes():ByteArray;

        public function get mimeType():String;

        public function get bytesLoaded():uint;

        public function get bytesTotal():uint;

        public function get fromCache():Boolean;

        public function get cacheKey():String;

        public function get cacheRevision():int;

        public function get id():int;

        public function load(k:URLRequest):void;

        override protected function retry():Boolean;

        override public function dispose():void;

        private function securityErrorEventHandler(k:SecurityErrorEvent):void;

        private function timerEventHandler(k:TimerEvent):void;


    }
}//package com.sulake.core.assets.loaders

