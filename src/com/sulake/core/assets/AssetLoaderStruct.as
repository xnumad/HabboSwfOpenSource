package com.sulake.core.assets
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.loaders.IAssetLoader;

    public class AssetLoaderStruct extends EventDispatcherWrapper implements IDisposable 
    {
        private var _assetLoader:IAssetLoader;
        private var _assetName:String;

        public function AssetLoaderStruct(assetName:String, assetLoader:IAssetLoader)
        {
            this._assetName = assetName;
            this._assetLoader = assetLoader;
        }

        public function get assetName():String
        {
            return this._assetName;
        }

        public function get assetLoader():IAssetLoader
        {
            return this._assetLoader;
        }

        override public function dispose():void
        {
			try
			{
            if (!disposed)
            {
                if (this._assetLoader != null)
                {
                    if (!this._assetLoader.disposed)
                    {
                        this._assetLoader.dispose();
                        this._assetLoader = null;
                    }
                }
                super.dispose();
            }
			}
			catch (error:Error)
			{
				Habbo.trackLoginStep("Failed to dispose " + this._assetName);
			}
        }
    }
}
