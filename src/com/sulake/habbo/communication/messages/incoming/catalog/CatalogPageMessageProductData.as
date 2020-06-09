package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogPageMessageProductData
    {
        public static const PRODUCT_TYPE_ITEM:String = "i";
        public static const PRODUCT_TYPE_STUFF:String = "s";
        public static const PRODUCT_TYPE_EFFECT:String = "e";
        public static const PRODUCT_TYPE_BADGE:String = "b";

        private var _productType:String;
        private var _furniClassId:int;
        private var _extraParam:String;
        private var _productCount:int;
        private var _uniqueLimitedItem:Boolean;
        private var _uniqueLimitedItemSeriesSize:int;
        private var _uniqueLimitedItemsLeft:int;

        public function CatalogPageMessageProductData(k:IMessageDataWrapper)
        {
            this._productType = k.readString();
            switch (this._productType)
            {
                case PRODUCT_TYPE_BADGE:
                    this._extraParam = k.readString();
                    this._productCount = 1;
                    return;
                default:
                    this._furniClassId = k.readInteger();
                    this._extraParam = k.readString();
                    this._productCount = k.readInteger();
                    this._uniqueLimitedItem = k.readBoolean();
                    if (this._uniqueLimitedItem)
                    {
                        this._uniqueLimitedItemSeriesSize = k.readInteger();
                        this._uniqueLimitedItemsLeft = k.readInteger();
                    }
            }
        }

        public function get productType():String
        {
            return this._productType;
        }

        public function get furniClassId():int
        {
            return this._furniClassId;
        }

        public function get extraParam():String
        {
            return this._extraParam;
        }

        public function get productCount():int
        {
            return this._productCount;
        }

        public function get uniqueLimitedItem():Boolean
        {
            return this._uniqueLimitedItem;
        }

        public function get uniqueLimitedItemSeriesSize():int
        {
            return this._uniqueLimitedItemSeriesSize;
        }

        public function get uniqueLimitedItemsLeft():int
        {
            return this._uniqueLimitedItemsLeft;
        }
    }
}
