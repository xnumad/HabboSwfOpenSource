package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.HabboCatalog;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.*;

    public class Product extends ProductGridItem implements IProduct, IGetImageListener 
    {
        public static const _Str_10915:int = 108;

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

        public function Product(k:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:IProductData, _arg_6:IFurnitureData, _arg_7:HabboCatalog, _arg_8:Boolean=false, _arg_9:int=0, _arg_10:int=0)
        {
            super(_arg_7);
            this._productType = k;
            this._productClassId = _arg_2;
            this._extraParam = _arg_3;
            this._productCount = _arg_4;
            this._productData = _arg_5;
            this._furnitureData = _arg_6;
            this._isUniqueLimitedItem = _arg_8;
            this._uniqueLimitedItemSeriesSize = _arg_9;
            this._uniqueLimitedItemsLeft = _arg_10;
        }

        public static function _Str_21036(k:Vector.<IProduct>):Vector.<IProduct>
        {
            var _local_3:Product;
            if (k.length == 1)
            {
                return k;
            }
            var _local_2:Vector.<IProduct> = new Vector.<IProduct>(0);
            for each (_local_3 in k)
            {
                if (((!(_local_3.productType == ProductTypeEnum.BADGE)) && (!((_local_3.productType == ProductTypeEnum.EFFECT) && (_local_3.productClassId == _Str_10915)))))
                {
                    _local_2.push(_local_3);
                }
            }
            return _local_2;
        }


        public function get productType():String
        {
            return this._productType;
        }

        public function get productClassId():int
        {
            return this._productClassId;
        }

        public function set extraParam(k:String):void
        {
            this._extraParam = k;
        }

        public function get extraParam():String
        {
            return this._extraParam;
        }

        public function get productCount():int
        {
            return this._productCount;
        }

        public function get productData():IProductData
        {
            return this._productData;
        }

        public function get furnitureData():IFurnitureData
        {
            return this._furnitureData;
        }

        public function get isUniqueLimitedItem():Boolean
        {
            return this._isUniqueLimitedItem;
        }

        public function get uniqueLimitedItemSeriesSize():int
        {
            return this._uniqueLimitedItemSeriesSize;
        }

        public function get uniqueLimitedItemsLeft():int
        {
            return this._uniqueLimitedItemsLeft;
        }

        public function set uniqueLimitedItemsLeft(uniqueLimitedItemsLeft:int):void
        {
            this._uniqueLimitedItemsLeft = uniqueLimitedItemsLeft;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this._productType = "";
            this._productClassId = 0;
            this._extraParam = "";
            this._productCount = 0;
            this._productData = null;
            this._furnitureData = null;
            if (((catalog) && (catalog.sessionDataManager)))
            {
                catalog.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this.onBadgeImageReady);
            }
            super.dispose();
        }

        public function initIcon(k:IProductContainer, _arg_2:IGetImageListener=null, _arg_3:IAvatarImageListener=null, _arg_4:IPurchasableOffer=null, _arg_5:IBitmapWrapperWindow=null, _arg_6:IStuffData=null, _arg_7:Function=null):BitmapData
        {
            var _local_9:IRoomEngine;
            var _local_10:ImageResult;
            var _local_11:String;
            if (disposed)
            {
                return null;
            }
            var _local_8:BitmapData;
            if (_arg_2 == null)
            {
                _arg_2 = this;
            }
            if ((k is BundleGridViewCatalogWidget))
            {
                _local_9 = (k as BundleGridViewCatalogWidget).offer.page.viewer.roomEngine;
            }
            else
            {
                _local_9 = (k as ProductContainer).offer.page.viewer.roomEngine;
            }
            if (((!(_local_9)) || (!(catalog))))
            {
                return null;
            }
            switch (this._productType)
            {
                case ProductTypeEnum.FLOOR:
                    _local_10 = _local_9.getFurnitureIcon(this.productClassId, _arg_2, null, _arg_6);
                    break;
                case ProductTypeEnum.WALL:
                    if (((_arg_4) && (this._furnitureData)))
                    {
                        _local_11 = "";
                        switch (this._furnitureData.className)
                        {
                            case "floor":
                                _local_11 = ["th", this._furnitureData.className, _arg_4.product.extraParam].join("_");
                                break;
                            case "wallpaper":
                                _local_11 = ["th", "wall", _arg_4.product.extraParam].join("_");
                                break;
                            case "landscape":
                                _local_11 = ["th", this._furnitureData.className, _arg_4.product.extraParam.replace(".", "_"), "001"].join("_");
                                break;
                            default:
                                _local_10 = _local_9.getWallItemIcon(this.productClassId, _arg_2, this._extraParam);
                        }
                        catalog.setImageFromAsset(_arg_5, _local_11, _arg_7);
                    }
                    else
                    {
                        _local_10 = _local_9.getWallItemIcon(this.productClassId, _arg_2, this._extraParam);
                    }
                    break;
                case ProductTypeEnum.EFFECT:
                    _local_8 = catalog.getPixelEffectIcon(this.productClassId);
                    if (_arg_2 == this)
                    {
                        this.setIconImage(_local_8, true);
                    }
                    break;
                case ProductTypeEnum.HABBO_CLUB:
                    _local_8 = catalog.getSubscriptionProductIcon(this.productClassId);
                    break;
                case ProductTypeEnum.BADGE:
                    catalog.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this.onBadgeImageReady);
                    _local_8 = catalog.sessionDataManager.getBadgeImage(this._extraParam);
                    this._productContainer = k;
                    break;
                case ProductTypeEnum.ROBOT:
                    _local_8 = _Str_12672(this._extraParam, _arg_3);
                    setIconImage(_local_8, false);
                    break;
                default:
                    Logger.log(("[Product] Can not yet handle this type of product: " + this.productType));
            }
            if (_local_10 != null)
            {
                _local_8 = _local_10.data;
                if (_arg_2 == this)
                {
                    this.setIconImage(_local_8, true);
                }
            }
            return _local_8;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (!disposed)
            {
                setIconImage(_arg_2, true);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function onBadgeImageReady(k:BadgeImageReadyEvent):void
        {
            if (!disposed)
            {
                if (((this._productType == ProductTypeEnum.BADGE) && (k.badgeId == this._extraParam)))
                {
                    ProductGridItem(this._productContainer).setIconImage(k.badgeImage, false);
                    if (((catalog) && (catalog.sessionDataManager)))
                    {
                        catalog.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.BIRE_BADGE_IMAGE_READY, this.onBadgeImageReady);
                    }
                }
            }
        }

        public function get isColorable():Boolean
        {
            if (((this._furnitureData) && (this._furnitureData.fullName)))
            {
                return !(this._furnitureData.fullName.indexOf("*") == -1);
            }
            return false;
        }

        override public function set view(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            var _local_3:ITextWindow;
            if (!k)
            {
                return;
            }
            super.view = k;
            if (this._productCount > 1)
            {
                _local_2 = _Str_2271.findChildByName("multiContainer");
                if (_local_2)
                {
                    _local_2.visible = true;
                }
                _local_3 = (_Str_2271.findChildByName("multiCounter") as ITextWindow);
                if (_local_3)
                {
                    _local_3.text = ("x" + this.productCount);
                }
            }
        }
    }
}
