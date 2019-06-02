package com.sulake.habbo.catalog.purchase
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.IPurchasableOffer;

    public class PlacedObjectPurchaseData implements IDisposable 
    {
        private var _isDisposed:Boolean = false;
        private var _objectId:int;
        private var _category:int;
        private var _roomId:int;
        private var _wallLocation:String = "";
        private var _x:int = 0;
        private var _y:int = 0;
        private var _direction:int = 0;
        private var _offerId:int;
        private var _productClassId:int;
        private var _productData:IProductData;
        private var _furniData:IFurnitureData;
        private var _extraParameter:String;

        public function PlacedObjectPurchaseData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:IPurchasableOffer)
        {
            this._roomId = k;
            this._objectId = _arg_2;
            this._category = _arg_3;
            this._wallLocation = _arg_4;
            this._x = _arg_5;
            this._y = _arg_6;
            this._direction = _arg_7;
            this._Str_25851(_arg_8);
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._productData = null;
            this._furniData = null;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        private function _Str_25851(k:IPurchasableOffer):void
        {
            this._offerId = k.offerId;
            this._productClassId = k.product.productClassId;
            this._productData = k.product.productData;
            this._furniData = k.product.furnitureData;
            this._extraParameter = k.product.extraParam;
        }

        public function toString():String
        {
            return [this._roomId, this._objectId, this._category, this._wallLocation, this._x, this._y, this._direction, this._offerId, this._productClassId].toString();
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_7031():String
        {
            return this._wallLocation;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get direction():int
        {
            return this._direction;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get productClassId():int
        {
            return this._productClassId;
        }

        public function get extraParameter():String
        {
            return this._extraParameter;
        }

        public function get furniData():IFurnitureData
        {
            return this._furniData;
        }
    }
}
