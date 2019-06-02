//com.sulake.habbo.tablet.catalog.viewer.GameTokensOffer

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;
    import __AS3__.vec.Vector;

    public class GameTokensOffer implements IPurchasableOffer, IDisposable {

        private var _offerId:int;
        private var _localizationId:String;
        private var _priceInCredits:int;

        public function GameTokensOffer(k:int, _arg_2:String, _arg_3:int);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get offerId():int;

        public function get priceInActivityPoints():int;

        public function get activityPointType():int;

        public function get priceInCredits():int;

        public function get page():ICatalogPage;

        public function get priceType():String;

        public function get productContainer():IProductContainer;

        public function get product():IProduct;

        public function get gridItem():IGridItem;

        public function get localizationId():String;

        public function get bundlePurchaseAllowed():Boolean;

        public function get isRentOffer():Boolean;

        public function get giftable():Boolean;

        public function get pricingModel():String;

        public function set previewCallbackId(k:int):void;

        public function get previewCallbackId():int;

        public function get clubLevel():int;

        public function get badgeCode():String;

        public function get thumbUrl():IRoomContentLoaderUrl;

        public function set page(k:ICatalogPage):void;

        public function get localizationName():String;

        public function get localizationDescription():String;

        public function get products():Vector.<IProduct>;


    }
}//package com.sulake.habbo.tablet.catalog.viewer

