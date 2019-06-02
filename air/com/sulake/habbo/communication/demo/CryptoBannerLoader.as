//com.sulake.habbo.communication.demo.CryptoBannerLoader

package com.sulake.habbo.communication.demo{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import flash.display.BitmapData;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class CryptoBannerLoader implements IDisposable {

        private var _disposed:Boolean;
        private var _bannerImageCallback:Function;
        private var _assetLibrary:IAssetLibrary;
        private var _bannerCounter:uint;
        private var _events:IEventDispatcher;
        private var _lastUrl:String;
        private var _lastBanner:BitmapData;

        public function CryptoBannerLoader(k:IAssetLibrary, _arg_2:IEventDispatcher);

        public function get disposed():Boolean;

        public function dispose():void;

        public function loadBannerImage(k:String, _arg_2:Function):void;

        private function bannerLoadedHandler(k:AssetLoaderEvent):void;

        private function bannerLoadedCallbackHandler(k:AssetLoaderEvent):void;

        public function getLastUrl():String;

        public function getLastBanner():BitmapData;


    }
}//package com.sulake.habbo.communication.demo

