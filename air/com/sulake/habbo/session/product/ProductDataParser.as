//com.sulake.habbo.session.product.ProductDataParser

package com.sulake.habbo.session.product{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibrary;
    import flash.events.Event;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class ProductDataParser extends EventDispatcherWrapper {

        public static const READY:String;

        private var _products:Dictionary;
        private var _assetLib:AssetLibrary;

        public function ProductDataParser(k:String, _arg_2:Dictionary);

        override public function dispose():void;

        private function parseProductsData(k:Event):void;

        private function parseXmlFormat(k:String):void;

        private function parseLingoFormat(k:String):void;

        private function productsDataError(k:AssetLoaderEvent):void;


    }
}//package com.sulake.habbo.session.product

