//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogPageMessageProductData {

        public static const PRODUCT_TYPE_ITEM:String;
        public static const PRODUCT_TYPE_STUFF:String;
        public static const PRODUCT_TYPE_EFFECT:String;
        public static const PRODUCT_TYPE_BADGE:String;

        private var _productType:String;
        private var _furniClassId:int;
        private var _extraParam:String;
        private var _productCount:int;
        private var _uniqueLimitedItem:Boolean;
        private var _uniqueLimitedItemSeriesSize:int;
        private var _uniqueLimitedItemsLeft:int;

        public function CatalogPageMessageProductData(k:IMessageDataWrapper);

        public function get productType():String;

        public function get furniClassId():int;

        public function get extraParam():String;

        public function get productCount():int;

        public function get uniqueLimitedItem():Boolean;

        public function get uniqueLimitedItemSeriesSize():int;

        public function get uniqueLimitedItemsLeft():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

