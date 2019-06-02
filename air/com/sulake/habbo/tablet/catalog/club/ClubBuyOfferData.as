//com.sulake.habbo.tablet.catalog.club.ClubBuyOfferData

package com.sulake.habbo.tablet.catalog.club{
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import com.sulake.habbo.tablet.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.tablet.catalog.viewer.IProductContainer;
    import com.sulake.habbo.tablet.catalog.viewer.IProduct;
    import com.sulake.habbo.tablet.catalog.viewer.IGridItem;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;
    import __AS3__.vec.Vector;

    public class ClubBuyOfferData implements IPurchasableOffer {

        private var _offerId:int;
        private var _productCode:String;
        private var _priceCredits:int;
        private var _priceActivityPoints:int;
        private var _priceActivityPointType:int;
        private var _vip:Boolean;
        private var _months:int;
        private var _daysLeftAfterPurchase:int;
        private var _page:ICatalogPage;
        private var _year:int;
        private var _month:int;
        private var _day:int;
        private var _extraParameter:String;
        private var _upgradeHcPeriodToVip:Boolean;
        private var _disposed:Boolean;
        private var _extraDays:int;

        public function ClubBuyOfferData(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, k0:int, k1:int, k2:int);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get extraParameter():String;

        public function set extraParameter(k:String):void;

        public function get offerId():int;

        public function get productCode():String;

        public function get priceCredits():int;

        public function get vip():Boolean;

        public function get months():int;

        public function get daysLeftAfterPurchase():int;

        public function get year():int;

        public function get month():int;

        public function get day():int;

        public function get priceInActivityPoints():int;

        public function get activityPointType():int;

        public function get priceInCredits():int;

        public function get page():ICatalogPage;

        public function get priceType():String;

        public function get productContainer():IProductContainer;

        public function get product():IProduct;

        public function get gridItem():IGridItem;

        public function get localizationId():String;

        public function set page(k:ICatalogPage):void;

        public function get upgradeHcPeriodToVip():Boolean;

        public function set upgradeHcPeriodToVip(k:Boolean):void;

        public function get extraDays():int;

        public function get bundlePurchaseAllowed():Boolean;

        public function get isRentOffer():Boolean;

        public function get giftable():Boolean;

        public function get pricingModel():String;

        public function set previewCallbackId(k:int):void;

        public function get previewCallbackId():int;

        public function get clubLevel():int;

        public function get badgeCode():String;

        public function get thumbUrl():IRoomContentLoaderUrl;

        public function get localizationName():String;

        public function get localizationDescription():String;

        public function get products():Vector.<IProduct>;


    }
}//package com.sulake.habbo.tablet.catalog.club

