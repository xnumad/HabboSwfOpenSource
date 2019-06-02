package com.sulake.habbo.avatar.structure
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.Core;
    import flash.events.Event;
    import com.sulake.habbo.utils.HabboWebTools;

    public class AvatarStructureDownload extends EventDispatcherWrapper 
    {
        public static const AVATAR_STRUCTURE_DONE:String = "AVATAR_STRUCTURE_DONE";

        private var _dataReceiver:IFigureSetData;

        public function AvatarStructureDownload(k:IAssetLibrary, _arg_2:String, _arg_3:IFigureSetData)
        {
            this._dataReceiver = _arg_3;
            if (k.hasAsset(_arg_2))
            {
                Logger.log(("[AvatarStructureDownload] reload data for url: " + _arg_2));
            }
            var _local_4:URLRequest = new URLRequest(_arg_2);
            var _local_5:AssetLoaderStruct = k.loadAssetFromFile(_arg_2, _local_4, "text/plain");
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_1943);
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onDataComplete);
        }

        private function _Str_1943(event:Event):void
        {
            var data:String;
            var dataSet:XML;
            var loaderStruct:AssetLoaderStruct = (event.target as AssetLoaderStruct);
            if (((loaderStruct == null) || (loaderStruct.assetLoader == null)))
            {
                return;
            }
            try
            {
                data = (loaderStruct.assetLoader.content as String);
                if (((data == null) || (data.length == 0)))
                {
                    Core.error((((("Could not load avatar structure, got empty data from URL " + loaderStruct.assetLoader.url) + " data length = ") + data.length) + "."), false, Core.ERROR_CATEGORY_DOWNLOAD_CONFIGURATION);
                }
                dataSet = new XML(data);
            }
            catch(e:Error)
            {
                Logger.log(("[AvatarStructureDownload] Error: " + e.message));
                return;
            }
            if (dataSet == null)
            {
                Logger.log((("[AvatarStructureDownload] XML error: " + loaderStruct) + " not valid XML"));
                return;
            }
            this._dataReceiver._Str_1017(dataSet);
            dispatchEvent(new Event(AvatarStructureDownload.AVATAR_STRUCTURE_DONE));
        }

        private function onDataComplete(k:Event):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            var _local_3:String = "";
            if (((!(_local_2 == null)) && (!(_local_2.assetLoader == null))))
            {
                _local_3 = _local_2.assetLoader.url;
            }
            HabboWebTools.logEventLog(("figurepartlist download error " + _local_3));
            Core.error(("Could not load avatar structure. Failed to get data from URL " + _local_3), true, Core.ERROR_CATEGORY_DOWNLOAD_CONFIGURATION);
        }
    }
}
