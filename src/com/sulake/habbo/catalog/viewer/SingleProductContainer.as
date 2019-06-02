package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_3353;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.IWindowContainer;

    public class SingleProductContainer extends ProductContainer 
    {
        public function SingleProductContainer(k:IPurchasableOffer, _arg_2:Vector.<IProduct>, _arg_3:HabboCatalog)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void
        {
            var _local_3:IProduct = _Str_6851;
            var _local_4:BitmapData = _local_3.initIcon(this, this, this, (offer as IPurchasableOffer), _icon, _arg_2, this._Str_6676);
            this.setIconImage(_local_4, true);
        }

        public function _Str_23923():void
        {
            _Str_2271.findChildByName("unique_item_background_bitmap").visible = true;
            var k:IWidgetWindow = IWidgetWindow(_Str_2271.findChildByName("unique_item_overlay_container"));
            var _local_2:_Str_3353 = _Str_3353(k.widget);
            k.visible = true;
            _local_2._Str_3442 = _Str_6851.uniqueLimitedItemSeriesSize;
            _local_2.animated = true;
            if (_Str_6851.uniqueLimitedItemsLeft == 0)
            {
                _Str_2271.findChildByName("unique_item_sold_out_bitmap").visible = true;
            }
            else
            {
                _Str_2271.findChildByName("unique_item_sold_out_bitmap").visible = false;
            }
        }

        private function _Str_6676(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct;
            if (((!(disposed)) && (!(offer.page.viewer.catalog == null))))
            {
                _local_2 = (k.target as AssetLoaderStruct);
                if (_local_2 != null)
                {
                    catalog.setImageFromAsset(_icon, _local_2.assetName, null);
                }
            }
        }

        override public function set view(k:IWindowContainer):void
        {
            super.view = k;
            if (offer.product.isUniqueLimitedItem)
            {
                (offer.productContainer as SingleProductContainer)._Str_23923();
            }
        }
    }
}
