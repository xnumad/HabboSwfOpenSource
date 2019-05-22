package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.catalog.viewer.IGridItem;

    public interface IPurchasableOffer extends IDisposable 
    {
        function get offerId():int;
        function get priceInActivityPoints():int;
        function get activityPointType():int;
        function get priceInCredits():int;
        function get page():ICatalogPage;
        function get priceType():String;
        function get product():IProduct;
        function get productContainer():IProductContainer;
        function get gridItem():IGridItem;
        function get localizationId():String;
        function get bundlePurchaseAllowed():Boolean;
        function get isRentOffer():Boolean;
        function get giftable():Boolean;
        function get pricingModel():String;
        function set previewCallbackId(_arg_1:int):void;
        function get previewCallbackId():int;
        function get clubLevel():int;
        function get badgeCode():String;
        function set page(_arg_1:ICatalogPage):void;
        function get localizationName():String;
        function get localizationDescription():String;
    }
}
