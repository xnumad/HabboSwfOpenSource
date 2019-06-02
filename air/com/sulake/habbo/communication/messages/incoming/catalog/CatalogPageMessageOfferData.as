//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogPageMessageOfferData {

        private var _offerId:int;
        private var _localizationId:String;
        private var _rent:Boolean;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;
        private var _clubLevel:int;
        private var _giftable:Boolean;
        private var _bundlePurchaseAllowed:Boolean;
        private var _products:Vector.<CatalogPageMessageProductData>;

        public function CatalogPageMessageOfferData(k:IMessageDataWrapper);

        public function get offerId():int;

        public function get localizationId():String;

        public function get isRent():Boolean;

        public function get priceInCredits():int;

        public function get priceInActivityPoints():int;

        public function get products():Vector.<CatalogPageMessageProductData>;

        public function get activityPointType():int;

        public function get clubLevel():int;

        public function get giftable():Boolean;

        public function get bundlePurchaseAllowed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

