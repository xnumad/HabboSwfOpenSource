//com.sulake.habbo.tablet.catalog.viewer.IProduct

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IProduct extends IGetImageListener, IDisposable {

        function get productType():String;
        function get productClassId():int;
        function set extraParam(k:String):void;
        function get extraParam():String;
        function get productCount():int;
        function get productData():IProductData;
        function get furnitureData():IFurnitureData;
        function get isUniqueLimitedItem():Boolean;
        function get isColorable():Boolean;
        function get uniqueLimitedItemSeriesSize():int;
        function get uniqueLimitedItemsLeft():int;
        function set uniqueLimitedItemsLeft(k:int):void;
        function initIcon(k:IProductContainer, _arg_2:IGetImageListener=null, _arg_3:IAvatarImageListener=null, _arg_4:IPurchasableOffer=null, _arg_5:IStuffData=null, _arg_6:Function=null):BitmapData;
        function set grid(k:IItemGrid):void;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

