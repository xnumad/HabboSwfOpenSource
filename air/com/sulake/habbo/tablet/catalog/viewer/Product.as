//com.sulake.habbo.tablet.catalog.viewer.Product

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import com.sulake.habbo.room.IStuffData;

    public class Product implements IProduct, IGetImageListener {

        public static const EFFECT_CLASSID_NINJA_DISAPPEAR:int;

        private var _catalog:HabboTabletCatalog;
        private var _productType:String;
        private var _productClassId:int;
        private var _extraParam:String;
        private var _productCount:int;
        private var _productData:IProductData;
        private var _furnitureData:IFurnitureData;
        private var _isUniqueLimitedItem:Boolean;
        private var _uniqueLimitedItemSeriesSize:int;
        private var _uniqueLimitedItemsLeft:int;
        private var _productContainer:IProductContainer;

        public function Product(k:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:IProductData, _arg_6:IFurnitureData, _arg_7:HabboTabletCatalog, _arg_8:Boolean=false, _arg_9:int=0, k0:int=0);

        public static function stripAddonProducts(k:Vector.<IProduct>):Vector.<IProduct>;


        public function get productType():String;

        public function get productClassId():int;

        public function set extraParam(k:String):void;

        public function get extraParam():String;

        public function get productCount():int;

        public function get productData():IProductData;

        public function get furnitureData():IFurnitureData;

        public function get isUniqueLimitedItem():Boolean;

        public function get uniqueLimitedItemSeriesSize():int;

        public function get uniqueLimitedItemsLeft():int;

        public function set uniqueLimitedItemsLeft(k:int):void;

        public function dispose():void;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        private function onBadgeImageReady(k:BadgeImageReadyEvent):void;

        public function get isColorable():Boolean;

        public function set grid(k:IItemGrid):void;

        public function get disposed():Boolean;

        public function initIcon(k:IProductContainer, _arg_2:IGetImageListener=null, _arg_3:IAvatarImageListener=null, _arg_4:IPurchasableOffer=null, _arg_5:IStuffData=null, _arg_6:Function=null):BitmapData;


    }
}//package com.sulake.habbo.tablet.catalog.viewer

