package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.IGridItem;

    public class ClubBuyOfferData implements IPurchasableOffer 
    {
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
        private var _upgradeHcPeriodToVip:Boolean = false;
        private var _disposed:Boolean = false;
        private var _extraDays:int;
        private var _giftable:Boolean;

        public function ClubBuyOfferData(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int, _arg_12:int, _arg_13:Boolean=false)
        {
            this._offerId = k;
            this._productCode = _arg_2;
            this._priceCredits = _arg_3;
            this._priceActivityPoints = _arg_4;
            this._priceActivityPointType = _arg_5;
            this._vip = _arg_6;
            this._months = _arg_7;
            this._extraDays = _arg_8;
            this._daysLeftAfterPurchase = _arg_9;
            this._year = _arg_10;
            this._month = _arg_11;
            this._day = _arg_12;
            this._giftable = _arg_13;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            this._page = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get extraParameter():String
        {
            return this._extraParameter;
        }

        public function set extraParameter(k:String):void
        {
            this._extraParameter = k;
        }

        public function get _Str_2451():int
        {
            return this._offerId;
        }

        public function get _Str_2716():String
        {
            return this._productCode;
        }

        public function get priceCredits():int
        {
            return this._priceCredits;
        }

        public function get vip():Boolean
        {
            return this._vip;
        }

        public function get months():int
        {
            return this._months;
        }

        public function get _Str_11224():int
        {
            return this._daysLeftAfterPurchase;
        }

        public function get year():int
        {
            return this._year;
        }

        public function get month():int
        {
            return this._month;
        }

        public function get day():int
        {
            return this._day;
        }

        public function get _Str_18028():Boolean
        {
            return this._giftable;
        }

        public function get priceInActivityPoints():int
        {
            return this._priceActivityPoints;
        }

        public function get activityPointType():int
        {
            return this._priceActivityPointType;
        }

        public function get priceInCredits():int
        {
            return this._priceCredits;
        }

        public function get page():ICatalogPage
        {
            return this._page;
        }

        public function get _Str_13933():String
        {
            return Offer.PRICE_TYPE_CREDITS;
        }

        public function get productContainer():IProductContainer
        {
            return null;
        }

        public function get product():IProduct
        {
            return (this.productContainer) ? this.productContainer._Str_6851 : null;
        }

        public function get gridItem():IGridItem
        {
            return null;
        }

        public function get _Str_2696():String
        {
            return this._productCode;
        }

        public function set page(k:ICatalogPage):void
        {
            this._page = k;
        }

        public function get _Str_10047():Boolean
        {
            return this._upgradeHcPeriodToVip;
        }

        public function set _Str_10047(k:Boolean):void
        {
            this._upgradeHcPeriodToVip = k;
        }

        public function get _Str_15178():int
        {
            return this._extraDays;
        }

        public function get _Str_3809():Boolean
        {
            return false;
        }

        public function get _Str_6539():Boolean
        {
            return false;
        }

        public function get _Str_4236():Boolean
        {
            return this._giftable;
        }

        public function get _Str_3837():String
        {
            return "";
        }

        public function set _Str_3413(k:int):void
        {
        }

        public function get _Str_3413():int
        {
            return 0;
        }

        public function get clubLevel():int
        {
            return 0;
        }

        public function get _Str_2494():String
        {
            return "";
        }

        public function get _Str_8112():String
        {
            return ("${" + this._Str_2696) + "}";
        }

        public function get _Str_7274():String
        {
            return ("${" + this._Str_2696) + "}";
        }
    }
}
