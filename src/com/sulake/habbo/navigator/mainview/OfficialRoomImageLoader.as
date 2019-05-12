package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.display.BitmapData;

    public class OfficialRoomImageLoader implements IDisposable 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _picRef:String;
        private var _url:String;
        private var _bitmapWrapper:IBitmapWrapperWindow;
        private var _disposed:Boolean;

        public function OfficialRoomImageLoader(k:IHabboTransitionalNavigator, _arg_2:String, _arg_3:IBitmapWrapperWindow)
        {
            this._navigator = k;
            this._picRef = _arg_2;
            this._bitmapWrapper = _arg_3;
            var _local_4:String = this._navigator.getProperty("image.library.url");
            this._url = (_local_4 + this._picRef);
            Logger.log(("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + this._url));
        }

        public function _Str_24517():void
        {
            var _local_1:URLRequest;
            var _local_2:AssetLoaderStruct;
            if (this._navigator.assets.hasAsset(this._picRef))
            {
                this._Str_3523();
            }
            else
            {
                _local_1 = new URLRequest(this._url);
                _local_2 = this._navigator.assets.loadAssetFromFile(this._picRef, _local_1, "image/gif");
                _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_25041);
                _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._Str_24273);
            }
        }

        private function _Str_25041(k:AssetLoaderEvent):void
        {
            if (this._disposed)
            {
                return;
            }
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                Logger.log((("Loading pic from url: " + this._url) + " failed. loaderStruct == null"));
                return;
            }
            this._Str_3523();
        }

        private function _Str_3523():void
        {
            var k:BitmapData;
            if (((((this._navigator) && (!(this._navigator.disposed))) && (this._bitmapWrapper)) && (!(this._bitmapWrapper.disposed))))
            {
                k = this._navigator._Str_3122(this._picRef, "");
                if (k)
                {
                    this._bitmapWrapper.disposesBitmap = false;
                    this._bitmapWrapper.bitmap = k;
                    this._bitmapWrapper.width = k.width;
                    this._bitmapWrapper.height = k.height;
                    this._bitmapWrapper.visible = true;
                }
                else
                {
                    Logger.log(("OfficialRoomImageLoader - Image not found: " + this._picRef));
                }
            }
            this.dispose();
        }

        private function _Str_24273(k:AssetLoaderEvent):void
        {
            Logger.log(((("Error loading image: " + this._url) + ", ") + k));
            this.dispose();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._bitmapWrapper = null;
            this._navigator = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
