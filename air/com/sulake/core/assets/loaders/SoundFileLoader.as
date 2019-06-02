//com.sulake.core.assets.loaders.SoundFileLoader

package com.sulake.core.assets.loaders{
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;

    public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader {

        protected var _url:String;
        protected var _type:String;
        protected var _soundLoader:Sound;
        private var _cacheKey:String;
        private var _cacheRevision:int;
        private var _fromCache:Boolean;
        private var _id:int;

        public function SoundFileLoader(k:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:int=-1, _arg_5:ByteArray=null, _arg_6:int=-1);

        public function get url():String;

        public function get content():Object;

        public function get bytes():ByteArray;

        public function get mimeType():String;

        public function get bytesLoaded():uint;

        public function get bytesTotal():uint;

        public function get cacheKey():String;

        public function get cacheRevision():int;

        public function get fromCache():Boolean;

        public function get id():int;

        override public function dispose():void;

        public function load(k:URLRequest):void;


    }
}//package com.sulake.core.assets.loaders

