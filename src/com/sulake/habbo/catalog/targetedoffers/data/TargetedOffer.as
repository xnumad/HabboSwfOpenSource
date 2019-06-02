package com.sulake.habbo.catalog.targetedoffers.data
{
    import com.sulake.habbo.communication.messages.incoming.catalog.TargetedOfferData;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import flash.utils.getTimer;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.session.product.IProductData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import __AS3__.vec.*;

    public class TargetedOffer extends TargetedOfferData implements IPurchasableOffer 
    {
        public static const _Str_16647:int = 10;

        public function TargetedOffer(k:TargetedOfferData=null)
        {
            super(k);
        }

        public function get offerId():int
        {
            return 0;
        }

        public function get page():ICatalogPage
        {
            return null;
        }

        public function set page(k:ICatalogPage):void
        {
        }

        public function get priceType():String
        {
            return "";
        }

        public function get product():IProduct
        {
            return null;
        }

        public function get productContainer():IProductContainer
        {
            return null;
        }

        public function get gridItem():IGridItem
        {
            return null;
        }

        public function get localizationId():String
        {
            return "";
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return false;
        }

        public function get isRentOffer():Boolean
        {
            return false;
        }

        public function get giftable():Boolean
        {
            return false;
        }

        public function get pricingModel():String
        {
            return "";
        }

        public function get previewCallbackId():int
        {
            return 0;
        }

        public function set previewCallbackId(k:int):void
        {
        }

        public function get clubLevel():int
        {
            return 0;
        }

        public function get badgeCode():String
        {
            return "";
        }

        public function get localizationName():String
        {
            return "";
        }

        public function get localizationDescription():String
        {
            return "";
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function isExpired():Boolean
        {
            return (_Str_4678 > 0) && (this._Str_18165() <= 0);
        }

        public function _Str_18165():int
        {
            var k:uint = (((_Str_4678 - getTimer()) / 1000) - _Str_16647);
            return Math.max(0, k);
        }

        public function checkPurseBalance(k:IPurse, _arg_2:int):Boolean
        {
            if (((!(k)) || (k.credits < (_Str_3594 * _arg_2))))
            {
                return false;
            }
            if (k.getActivityPointsForType(_Str_2956) < (_Str_3539 * _arg_2))
            {
                return false;
            }
            return true;
        }

        public function _Str_26048(k:IHabboCatalog):Vector.<String>
        {
            var _local_3:String;
            var _local_4:IProductData;
            var _local_2:Vector.<String> = new Vector.<String>(0);
            for each (_local_3 in _Str_11962)
            {
                _local_4 = k.getProductData(_local_3);
                _local_2.push(((_local_4) ? _local_4.name : _local_3));
            }
            return _local_2;
        }

        public function dispose():void
        {
        }
    }
}
