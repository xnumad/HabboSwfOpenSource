//com.sulake.habbo.tablet.catalog.purchase.PlacedObjectPurchaseData

package com.sulake.habbo.tablet.catalog.purchase{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;

    public class PlacedObjectPurchaseData implements IDisposable {

        private var _isDisposed:Boolean;
        private var _objectId:int;
        private var _category:int;
        private var _roomId:int;
        private var _wallLocation:String;
        private var _x:int;
        private var _y:int;
        private var _direction:int;
        private var _offerId:int;
        private var _productClassId:int;
        private var _productData:IProductData;
        private var _furniData:IFurnitureData;
        private var _extraParameter:String;

        public function PlacedObjectPurchaseData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:IPurchasableOffer);

        public function dispose():void;

        public function get disposed():Boolean;

        private function setOfferData(k:IPurchasableOffer):void;

        public function toString():String;

        public function get objectId():int;

        public function get category():int;

        public function get roomId():int;

        public function get wallLocation():String;

        public function get x():int;

        public function get y():int;

        public function get direction():int;

        public function get offerId():int;

        public function get productClassId():int;

        public function get extraParameter():String;

        public function get furniData():IFurnitureData;


    }
}//package com.sulake.habbo.tablet.catalog.purchase

