package com.sulake.habbo.window
{
    import com.sulake.core.assets.IResourceManager;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.IAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.assets.IAssetReceiver;

    public class ResourceManager implements IResourceManager 
    {
        private var _disposed:Boolean;
        private var _windowManager:HabboWindowManagerComponent;
        private var _assetReceivers:Dictionary;

        public function ResourceManager(k:HabboWindowManagerComponent)
        {
            this._assetReceivers = new Dictionary();
            super();
            this._windowManager = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function retrieveAsset(k:String, _arg_2:IAssetReceiver):void
        {
            var _local_5:AssetLoaderStruct;
            if (((k == null) || (k.length == 0)))
            {
                return;
            }
            var _local_3:String = this._Str_16848(k);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IAsset = this._windowManager.assets.getAssetByName(_local_3);
            if (_local_4 == null)
            {
                if (((_local_3.substr(0, 7) == "http://") || (_local_3.substr(0, 8) == "https://")))
                {
                    _local_5 = this._windowManager.assets.loadAssetFromFile(_local_3, new URLRequest(_local_3));
                    if (((!(_local_5 == null)) && (!(_local_5.disposed))))
                    {
                        if (this._assetReceivers[_local_3] == null)
                        {
                            this._assetReceivers[_local_3] = [];
                        }
                        if (_arg_2 != null)
                        {
                            this._assetReceivers[_local_3].push(_arg_2);
                        }
                        _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_23200);
                    }
                }
            }
            else
            {
                if (_arg_2 != null)
                {
                    _arg_2.receiveAsset(_local_4, _local_3);
                }
            }
        }

        private function _Str_23200(k:AssetLoaderEvent=null):void
        {
            var _local_4:IAssetReceiver;
            if (this._disposed)
            {
                return;
            }
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (((_local_2 == null) || (this._assetReceivers[_local_2.assetName] == null)))
            {
                return;
            }
            var _local_3:IAsset = this._windowManager.assets.getAssetByName(_local_2.assetName);
            for each (_local_4 in this._assetReceivers[_local_2.assetName])
            {
                if (((!(_local_4 == null)) && (!(_local_4.disposed))))
                {
                    _local_4.receiveAsset(_local_3, _local_3.url);
                }
            }
            delete this._assetReceivers[_local_2.assetName];
        }

        public function isSameAsset(k:String, _arg_2:String):Boolean
        {
            return _arg_2 == this._Str_16848(k);
        }

        private function _Str_16848(k:String):String
        {
            return this._windowManager.interpolate(k);
        }

        public function createAsset(k:String, _arg_2:Class, _arg_3:Object):IAsset
        {
            var _local_4:IAsset = new _arg_2(this._windowManager.assets.getAssetTypeDeclarationByClass(_arg_2));
            this._windowManager.assets.setAsset(k, _local_4);
            _local_4.setUnknownContent(_arg_3);
            return _local_4;
        }

        public function removeAsset(k:String):void
        {
            var _local_2:String = this._Str_16848(k);
            this._windowManager.assets.removeAsset(this._windowManager.assets.getAssetByName(_local_2));
        }
    }
}

