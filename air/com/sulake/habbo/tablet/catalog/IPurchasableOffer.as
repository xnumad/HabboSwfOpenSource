//com.sulake.habbo.tablet.catalog.IPurchasableOffer

package com.sulake.habbo.tablet.catalog{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.tablet.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.tablet.catalog.viewer.IProduct;
    import com.sulake.habbo.tablet.catalog.viewer.IProductContainer;
    import com.sulake.habbo.tablet.catalog.viewer.IGridItem;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface IPurchasableOffer extends IDisposable {

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
        function set previewCallbackId(k:int):void;
        function get previewCallbackId():int;
        function get clubLevel():int;
        function get badgeCode():String;
        function get thumbUrl():IRoomContentLoaderUrl;
        function set page(k:ICatalogPage):void;
        function get localizationName():String;
        function get localizationDescription():String;
        function get products():Vector.<IProduct>;

    }
}//package com.sulake.habbo.tablet.catalog

