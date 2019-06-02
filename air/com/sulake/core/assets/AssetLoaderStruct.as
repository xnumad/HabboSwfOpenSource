//com.sulake.core.assets.AssetLoaderStruct

package com.sulake.core.assets{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.loaders.IAssetLoader;

    public class AssetLoaderStruct extends EventDispatcherWrapper implements IDisposable {

        private var _assetLoader:IAssetLoader;
        private var _assetName:String;

        public function AssetLoaderStruct(k:String, _arg_2:IAssetLoader);

        public function get assetName():String;

        public function get assetLoader():IAssetLoader;

        override public function dispose():void;


    }
}//package com.sulake.core.assets

