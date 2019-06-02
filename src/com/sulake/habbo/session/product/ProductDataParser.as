package com.sulake.habbo.session.product
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibrary;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.Event;
    import com.sulake.core.Core;
    import com.sulake.habbo.utils.HabboWebTools;

    public class ProductDataParser extends EventDispatcherWrapper 
    {
        public static const PDP_PRODUCT_DATA_READY:String = "PDP_product_data_ready";

        private var _products:Dictionary;
        private var _assetLib:AssetLibrary;

        public function ProductDataParser(url:String, products:Dictionary)
        {
            this._products = products;
            this._assetLib = new AssetLibrary("ProductDataParserAssetLib");
            var _local_3:AssetLoaderStruct = this._assetLib.loadAssetFromFile(url, new URLRequest(url), "text/plain");
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.parseProductsData);
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.productsDataError);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._assetLib)
            {
                this._assetLib.dispose();
                this._assetLib = null;
            }
            this._products = null;
        }

        private function parseProductsData(k:Event):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                return;
            }
            if (((_local_2.assetLoader == null) || (_local_2.assetLoader.content == null)))
            {
                return;
            }
            var _local_3:String = (_local_2.assetLoader.content as String);
            if (_local_3.charAt(0) == "<")
            {
                this._Str_17161(_local_3);
            }
            else
            {
                this._Str_18569(_local_3);
            }
        }

        private function _Str_17161(data:String):void
        {
            var itemXml:XML;
            var xmlData:XML;
            var code:String;
            try
            {
                xmlData = new XML(data);
            }
            catch(e:Error)
            {
                Core.error(("XML Product data was malformed: " + data), true, Core.ERROR_CATEGORY_PRODUCT_DATA);
            }
            if (xmlData == null)
            {
                return;
            }
            var products:XMLList = xmlData.product;
            for each (itemXml in products)
            {
                code = itemXml.@code;
                this._products[code] = new ProductData(code, itemXml.name, itemXml.description);
            }
            dispatchEvent(new Event(PDP_PRODUCT_DATA_READY));
        }

        private function _Str_18569(k:String):void
        {
            var _local_8:String;
            var _local_9:Array;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:String;
            var _local_13:String;
            var _local_14:String;
            var _local_15:ProductData;
            var _local_2:Array = new Array();
            var _local_3:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
            var _local_4:RegExp = /^\s+|\s+$/g;
            var _local_5:RegExp = /\[+?((.)*?)\]/g;
            k = k.replace(/"{1,}/mg, "");
            var _local_6:Array = k.split(_local_3);
            var _local_7:int;
            for each (_local_8 in _local_6)
            {
                _local_9 = _local_8.match(_local_5);
                for each (_local_10 in _local_9)
                {
                    _local_10 = _local_10.replace(/\[{1,}/mg, "");
                    _local_10 = _local_10.replace(/\]{1,}/mg, "");
                    _local_11 = _local_10.split(",");
                    _local_12 = _local_11.shift();
                    _local_13 = _local_11.shift();
                    _local_14 = _local_11.join(",");
                    _local_15 = new ProductData(_local_12, _local_13, _local_14);
                    this._products[_local_12] = _local_15;
                }
                _local_7++;
            }
            dispatchEvent(new Event(PDP_PRODUCT_DATA_READY));
        }

        private function productsDataError(k:AssetLoaderEvent):void
        {
            HabboWebTools.logEventLog(("productdata download error " + k.status));
            Core.error("Could not download productdata", true, Core.ERROR_CATEGORY_PRODUCT_DATA);
        }
    }
}
