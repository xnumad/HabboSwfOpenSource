package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.HabboCatalog;
    import __AS3__.vec.*;

    public class FurnitureOffer implements IPurchasableOffer 
    {
        private var _furniData:IFurnitureData;
        private var _previewCallbackId:int;
        private var _page:ICatalogPage;
        private var _productContainer:FurniProductContainer;
        private var _product:Product;

        public function FurnitureOffer(k:IFurnitureData, _arg_2:HabboCatalog)
        {
            this._furniData = k;
            this._productContainer = new FurniProductContainer(this, new Vector.<IProduct>(0), _arg_2, this._furniData);
            this._product = new Product(this._furniData.type, this._furniData.id, this._furniData.customParams, 1, _arg_2.getProductData(this._furniData.className), this._furniData, _arg_2);
        }

        public function dispose():void
        {
            this._furniData = null;
            this._page = null;
            this._previewCallbackId = -1;
        }

        public function get disposed():Boolean
        {
            return this._furniData == null;
        }

        public function get offerId():int
        {
            return (this.isRentOffer) ? this._furniData.rentOfferId : this._furniData.purchaseOfferId;
        }

        public function get priceInActivityPoints():int
        {
            return 0;
        }

        public function get activityPointType():int
        {
            return 0;
        }

        public function get priceInCredits():int
        {
            return 0;
        }

        public function get page():ICatalogPage
        {
            return this._page;
        }

        public function get priceType():String
        {
            return "";
        }

        public function get productContainer():IProductContainer
        {
            return this._productContainer;
        }

        public function get product():IProduct
        {
            return this._product;
        }

        public function get gridItem():IGridItem
        {
            return this._productContainer as IGridItem;
        }

        public function get localizationId():String
        {
            return "roomItem.name." + this._furniData.id;
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return false;
        }

        public function get isRentOffer():Boolean
        {
            return (this._furniData.rentOfferId > -1) && (!((!(this._page == null)) && (this._page._Str_21286)));
        }

        public function get giftable():Boolean
        {
            return false;
        }

        public function get pricingModel():String
        {
            return Offer.PRICING_MODEL_FURNITURE;
        }

        public function set previewCallbackId(k:int):void
        {
            this._previewCallbackId = k;
        }

        public function get previewCallbackId():int
        {
            return this._previewCallbackId;
        }

        public function get clubLevel():int
        {
            return 0;
        }

        public function get badgeCode():String
        {
            return "";
        }

        public function set page(k:ICatalogPage):void
        {
            this._page = k;
        }

        public function get localizationName():String
        {
            return this._furniData.localizedName;
        }

        public function get localizationDescription():String
        {
            return this._furniData.description;
        }
    }
}
