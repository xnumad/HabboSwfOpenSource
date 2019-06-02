package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.components.IItemListWindow;

    public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem, IAvatarImageListener 
    {
        private static const TOTALPRICE_CONTAINER:String = "totalprice_container";
        private static const AMOUNT_TEXT_LEFT:String = "amount_text_left";
        private static const AMOUNT_TEXT_RIGHT:String = "amount_text_right";
        private static const CURRENCY_INDICATOR_RIGHT:String = "currency_indicator_bitmap_right";

        protected var _Str_2324:IPurchasableOffer;
        protected var _products:Vector.<IProduct>;

        public function ProductContainer(k:IPurchasableOffer, _arg_2:Vector.<IProduct>, _arg_3:HabboCatalog)
        {
            var _local_4:String;
            var _local_5:Product;
            super(_arg_3);
            for each (_local_5 in _arg_2)
            {
                if (_local_5.productType != ProductTypeEnum.BADGE)
                {
                    _local_4 = _local_5.extraParam;
                    break;
                }
            }
            this._Str_2324 = k;
            this._products = _arg_2;
        }

        public function get products():Vector.<IProduct>
        {
            return this._products;
        }

        public function get _Str_6851():IProduct
        {
            if (((!(this._products)) || (this._products.length == 0)))
            {
                return null;
            }
            if (this._products.length == 1)
            {
                return this._products[0];
            }
            var k:Vector.<IProduct> = Product._Str_21036(this._products);
            return (k.length > 0) ? k[0] : null;
        }

        public function get offer():IPurchasableOffer
        {
            return this._Str_2324;
        }

        override public function dispose():void
        {
            var k:Product;
            if (disposed)
            {
                return;
            }
            for each (k in this._products)
            {
                k.dispose();
            }
            this._products = null;
            super.dispose();
        }

        public function get isLazy():Boolean
        {
            return false;
        }

        public function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void
        {
        }

        override public function set view(k:IWindowContainer):void
        {
            var _local_2:int;
            var _local_3:IProduct;
            super.view = k;
            if (_Str_2271 == null)
            {
                return;
            }
            if (((((catalog) && (this._Str_2324.badgeCode)) && (!(this._Str_2324.badgeCode == ""))) && (this._Str_2324.productContainer.products.length > 1)))
            {
                this._Str_20490("catalog_icon_badge_included");
            }
            else
            {
                if (((catalog) && (this._Str_2324.productContainer.products.length == 2)))
                {
                    _local_2 = 0;
                    while (_local_2 < 2)
                    {
                        _local_3 = this._Str_2324.productContainer.products[_local_2];
                        if (((_local_3.productType == ProductTypeEnum.EFFECT) && (_local_3.productClassId == Product._Str_10915)))
                        {
                            this._Str_20490("catalog_icon_ninja_effect_included");
                        }
                        _local_2++;
                    }
                }
            }
            this._Str_15497(this.offer.clubLevel);
            if (catalog.isDraggable(this.offer))
            {
                _Str_16497(true);
            }
        }

        private function _Str_20490(k:String):void
        {
            var _local_2:IBitmapWrapperWindow = (_Str_2271.findChildByName("badge_add_on") as IBitmapWrapperWindow);
            var _local_3:IAsset = catalog.assets.getAssetByName(k);
            _local_2.bitmap = (_local_3.content as BitmapData);
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            _local_2.width = _local_4.width;
            _local_2.height = _local_4.height;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            setIconImage(_arg_2, true);
        }

        public function imageFailed(k:int):void
        {
        }

        public function _Str_15497(k:int):void
        {
            if (view == null)
            {
                return;
            }
            var _local_2:IWindow = view.findChildByName("clubLevelIcon");
            if (_local_2 == null)
            {
                return;
            }
            switch (this.offer.clubLevel)
            {
                case HabboClubLevelEnum._Str_3159:
                    _local_2.visible = false;
                    return;
                case HabboClubLevelEnum._Str_2964:
                    _local_2.visible = true;
                    _local_2.style = 11;
                    _local_2.x = (_local_2.x + 3);
                    return;
                case HabboClubLevelEnum._Str_2575:
                    _local_2.visible = true;
                    _local_2.style = 12;
                    return;
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IProduct;
            if (!disposed)
            {
                for each (_local_2 in this.products)
                {
                    if (((_local_2.productType == ProductTypeEnum.ROBOT) && (_local_2.extraParam == k)))
                    {
                        setIconImage(_Str_12672(_local_2.extraParam, this), true);
                        return;
                    }
                }
            }
        }

        public function _Str_18628(k:HabboCatalog):void
        {
            var _local_3:ITextWindow;
            var _local_4:ITextWindow;
            var _local_5:IWindow;
            if (this._Str_2324.priceInCredits > 0)
            {
                if (this._Str_2324.priceInActivityPoints > 0)
                {
                    _local_3 = ITextWindow(_Str_2271.findChildByName(AMOUNT_TEXT_LEFT));
                }
                else
                {
                    _local_3 = ITextWindow(_Str_2271.findChildByName(AMOUNT_TEXT_RIGHT));
                }
                if (_local_3)
                {
                    _local_3.text = (this._Str_2324.priceInCredits + "");
                }
            }
            if (this._Str_2324.priceInActivityPoints > 0)
            {
                _local_4 = ITextWindow(_Str_2271.findChildByName(AMOUNT_TEXT_RIGHT));
                if (_local_4)
                {
                    _local_5 = _Str_2271.findChildByName(CURRENCY_INDICATOR_RIGHT);
                    if (_local_5)
                    {
                        _local_5.style = ActivityPointTypeEnum._Str_5251(this._Str_2324.activityPointType, k, false);
                    }
                    _local_4.text = (this._Str_2324.priceInActivityPoints + "");
                }
            }
            var _local_2:IItemListWindow = IItemListWindow(_Str_2271.findChildByName(TOTALPRICE_CONTAINER));
            if (_local_2)
            {
                _local_2.arrangeListItems();
            }
        }
    }
}
