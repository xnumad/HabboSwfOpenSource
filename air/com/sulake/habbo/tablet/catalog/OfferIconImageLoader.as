//com.sulake.habbo.tablet.catalog.OfferIconImageLoader

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;
    import com.sulake.core.utils.IFileProxy;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.display.BitmapData;

    public class OfferIconImageLoader extends ImageLoader implements IGetImageListener, IDisposable {

        private var _cacheUrlData:IRoomContentLoaderUrl;
        private var _isDisposed:Boolean;

        public function OfferIconImageLoader();

        private function get fileProxy():IFileProxy;

        private function getCacheFilePath(k:String, _arg_2:int, _arg_3:String):String;

        override public function dispose():void;

        public function set iconSource(k:IRoomContentLoaderUrl):void;

        override protected function rawDataLoader_completeHandler(k:Event):void;

        override protected function loader_completeHandler(k:Event):void;

        private function addToCache(k:ByteArray):void;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        public function setImage(k:BitmapData):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.tablet.catalog

