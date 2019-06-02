package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.product.IProductData;
    import __AS3__.vec.*;

    public class Offer implements IPurchasableOffer 
    {
        public static const PRICING_MODEL_UNKNOWN:String = "pricing_model_unknown";
        public static const PRICING_MODEL_SINGLE:String = "pricing_model_single";
        public static const PRICING_MODEL_MULTI:String = "pricing_model_multi";
        public static const PRICING_MODEL_BUNDLE:String = "pricing_model_bundle";
        public static const PRICING_MODEL_FURNITURE:String = "pricing_model_furniture";
        public static const PRICE_TYPE_NONE:String = "price_type_none";
        public static const PRICE_TYPE_CREDITS:String = "price_type_credits";
        public static const PRICE_TYPE_ACTIVITYPOINTS:String = "price_type_activitypoints";
        public static const PRICE_TYPE_CREDITS_ACTIVITYPOINTS:String = "price_type_credits_and_activitypoints";

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
        private var _disposed:Boolean = false;
        private var _clubLevel:int = 0;
        private var _badgeCode:String;
        private var _bundlePurchaseAllowed:Boolean = false;
        private var _catalog:HabboCatalog;
        private var _previewCallbackId:int;

        public function Offer(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean, _arg_8:int, _arg_9:Vector.<IProduct>, _arg_10:Boolean, _arg_11:HabboCatalog)
        {
            var _local_12:Product;
            super();
            this._offerId = k;
            this._localizationId = _arg_2;
            this._isRentOffer = _arg_3;
            this._priceInCredits = _arg_4;
            this._priceInActivityPoints = _arg_5;
            this._activityPointType = _arg_6;
            this._giftable = _arg_7;
            this._clubLevel = _arg_8;
            this._bundlePurchaseAllowed = _arg_10;
            this._catalog = _arg_11;
            this._Str_22470(_arg_9);
            this._Str_25477();
            this._Str_23871(_arg_9);
            for each (_local_12 in _arg_9)
            {
                if (_local_12.productType == ProductTypeEnum.BADGE)
                {
                    this._badgeCode = _local_12.extraParam;
                    break;
                }
            }
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get page():ICatalogPage
        {
            return this._page;
        }

        public function set page(k:ICatalogPage):void
        {
            this._page = k;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get localizationId():String
        {
            return this._localizationId;
        }

        public function get priceInCredits():int
        {
            return this._priceInCredits;
        }

        public function get priceInActivityPoints():int
        {
            return this._priceInActivityPoints;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }

        public function get giftable():Boolean
        {
            return this._giftable;
        }

        public function get productContainer():IProductContainer
        {
            return this._productContainer;
        }

        public function get product():IProduct
        {
            return (this._productContainer) ? this._productContainer._Str_6851 : null;
        }

        public function get gridItem():IGridItem
        {
            return this._productContainer as IGridItem;
        }

        public function get pricingModel():String
        {
            return this._pricingModel;
        }

        public function get priceType():String
        {
            return this._priceType;
        }

        public function get previewCallbackId():int
        {
            return this._previewCallbackId;
        }

        public function set previewCallbackId(k:int):void
        {
            this._previewCallbackId = k;
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return this._bundlePurchaseAllowed;
        }

        public function get isRentOffer():Boolean
        {
            return this._isRentOffer;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            this._offerId = 0;
            this._localizationId = "";
            this._priceInCredits = 0;
            this._priceInActivityPoints = 0;
            this._activityPointType = 0;
            this._page = null;
            this._catalog = null;
            if (this._productContainer != null)
            {
                this._productContainer.dispose();
                this._productContainer = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_23871(k:Vector.<IProduct>):void
        {
            switch (this._pricingModel)
            {
                case PRICING_MODEL_SINGLE:
                    this._productContainer = new SingleProductContainer(this, k, this._catalog);
                    return;
                case PRICING_MODEL_MULTI:
                    this._productContainer = new MultiProductContainer(this, k, this._catalog);
                    return;
                case PRICING_MODEL_BUNDLE:
                    this._productContainer = new BundleProductContainer(this, k, this._catalog);
                    return;
                default:
                    this._productContainer = new ProductContainer(this, k, this._catalog);
                    Logger.log(("[Offer] Unknown pricing model" + this._pricingModel));
            }
        }

        private function _Str_22470(k:Vector.<IProduct>):void
        {
            var _local_2:Vector.<IProduct> = Product._Str_21036(k);
            if (_local_2.length == 1)
            {
                if (_local_2[0].productCount == 1)
                {
                    this._pricingModel = PRICING_MODEL_SINGLE;
                }
                else
                {
                    this._pricingModel = PRICING_MODEL_MULTI;
                }
            }
            else
            {
                if (_local_2.length > 1)
                {
                    this._pricingModel = PRICING_MODEL_BUNDLE;
                }
                else
                {
                    this._pricingModel = PRICING_MODEL_UNKNOWN;
                }
            }
        }

        private function _Str_25477():void
        {
            if (((this._priceInCredits > 0) && (this._priceInActivityPoints > 0)))
            {
                this._priceType = PRICE_TYPE_CREDITS_ACTIVITYPOINTS;
            }
            else
            {
                if (this._priceInCredits > 0)
                {
                    this._priceType = PRICE_TYPE_CREDITS;
                }
                else
                {
                    if (this._priceInActivityPoints > 0)
                    {
                        this._priceType = PRICE_TYPE_ACTIVITYPOINTS;
                    }
                    else
                    {
                        this._priceType = PRICE_TYPE_NONE;
                    }
                }
            }
        }

        public function clone():Offer
        {
            var _local_3:IProduct;
            var _local_4:Offer;
            var _local_5:IFurnitureData;
            var _local_6:Product;
            var k:Vector.<IProduct> = new Vector.<IProduct>(0);
            var _local_2:IProductData = this._catalog.getProductData(this.localizationId);
            for each (_local_3 in this._productContainer.products)
            {
                _local_5 = this._catalog.getFurnitureData(_local_3.productClassId, _local_3.productType);
                _local_6 = new Product(_local_3.productType, _local_3.productClassId, _local_3.extraParam, _local_3.productCount, _local_2, _local_5, this._catalog);
                k.push(_local_6);
            }
            _local_4 = new Offer(this.offerId, this.localizationId, this.isRentOffer, this.priceInCredits, this.priceInActivityPoints, this.activityPointType, this.giftable, this.clubLevel, k, this.bundlePurchaseAllowed, this._catalog);
            _local_4.page = this.page;
            return _local_4;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get localizationName():String
        {
            var k:IProductData = this._catalog.getProductData(this._localizationId);
            return (k) ? k.name : (("${" + this._localizationId) + "}");
        }

        public function get localizationDescription():String
        {
            var k:IProductData = this._catalog.getProductData(this._localizationId);
            return (k) ? k.description : (("${" + this._localizationId) + "}");
        }
    }
}
