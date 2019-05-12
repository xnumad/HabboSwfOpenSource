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
            this._product = new Product(this._furniData.type, this._furniData.id, this._furniData._Str_4558, 1, _arg_2.getProductData(this._furniData._Str_3177), this._furniData, _arg_2);
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

        public function get _Str_2451():int
        {
            return (this._Str_6539) ? this._furniData._Str_3693 : this._furniData._Str_3473;
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

        public function get _Str_13933():String
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

        public function get _Str_2696():String
        {
            return "roomItem.name." + this._furniData.id;
        }

        public function get _Str_3809():Boolean
        {
            return false;
        }

        public function get _Str_6539():Boolean
        {
            return (this._furniData._Str_3693 > -1) && (!((!(this._page == null)) && (this._page._Str_21286)));
        }

        public function get _Str_4236():Boolean
        {
            return false;
        }

        public function get _Str_3837():String
        {
            return Offer.PRICING_MODEL_FURNITURE;
        }

        public function set _Str_3413(k:int):void
        {
            this._previewCallbackId = k;
        }

        public function get _Str_3413():int
        {
            return this._previewCallbackId;
        }

        public function get clubLevel():int
        {
            return 0;
        }

        public function get _Str_2494():String
        {
            return "";
        }

        public function set page(k:ICatalogPage):void
        {
            this._page = k;
        }

        public function get _Str_8112():String
        {
            return this._furniData._Str_2772;
        }

        public function get _Str_7274():String
        {
            return this._furniData.description;
        }
    }
}
