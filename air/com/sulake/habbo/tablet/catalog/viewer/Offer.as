//com.sulake.habbo.tablet.catalog.viewer.Offer

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;

    public class Offer implements IPurchasableOffer {

        public static const PRICING_MODEL_UNKNOWN:String;
        public static const PRICING_MODEL_SINGLE:String;
        public static const PRICING_MODEL_MULTI:String;
        public static const PRICING_MODEL_BUNDLE:String;
        public static const PRICING_MODEL_FURNI:String;
        public static const PRICE_TYPE_NONE:String;
        public static const PRICE_TYPE_CREDITS:String;
        public static const PRICE_TYPE_ACTIVITYPOINTS:String;
        public static const PRICE_TYPE_CREDITS_AND_ACTIVITYPOINTS:String;

        private var _pricingModel:String;
        private var _priceType:String;
        private var _offerId:int;
        private var _localizationId:String;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;
        private var _giftable:Boolean;
        private var _isRentOffer:Boolean;
        private var _page:ICatalogPage;
        private var _productContainer:IProductContainer;
        private var _products:Vector.<IProduct>;
        private var _disposed:Boolean;
        private var _clubLevel:int;
        private var _badgeCode:String;
        private var _bundlePurchaseAllowed:Boolean;
        private var _catalog:HabboTabletCatalog;
        private var _previewCallbackId:int;

        public function Offer(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean, _arg_8:int, _arg_9:Vector.<IProduct>, k0:Boolean, k1:HabboTabletCatalog);

        public function get clubLevel():int;

        public function get page():ICatalogPage;

        public function set page(k:ICatalogPage):void;

        public function get offerId():int;

        public function get localizationId():String;

        public function get priceInCredits():int;

        public function get priceInActivityPoints():int;

        public function get activityPointType():int;

        public function get giftable():Boolean;

        public function get productContainer():IProductContainer;

        public function get product():IProduct;

        public function get gridItem():IGridItem;

        public function get pricingModel():String;

        public function get priceType():String;

        public function get previewCallbackId():int;

        public function set previewCallbackId(k:int):void;

        public function get bundlePurchaseAllowed():Boolean;

        public function get isRentOffer():Boolean;

        public function dispose():void;

        public function get disposed():Boolean;

        private function createProductContainer(k:Vector.<IProduct>):void;

        public function get products():Vector.<IProduct>;

        private function analyzePricingModel(k:Vector.<IProduct>):void;

        private function analyzePriceType():void;

        public function clone():Offer;

        public function get badgeCode():String;

        public function get localizationName():String;

        public function get localizationDescription():String;

        public function get thumbUrl():IRoomContentLoaderUrl;


    }
}//package com.sulake.habbo.tablet.catalog.viewer

