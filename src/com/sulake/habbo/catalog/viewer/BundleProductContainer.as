package com.sulake.habbo.catalog.viewer
{
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class BundleProductContainer extends ProductContainer implements _Str_4311 
    {
        private var _bundleIcon:BitmapData;

        public function BundleProductContainer(k:IPurchasableOffer, _arg_2:Vector.<IProduct>, _arg_3:HabboCatalog)
        {
            super(k, _arg_2, _arg_3);
            var _local_4:BitmapDataAsset = (_arg_3.assets.getAssetByName("ctlg_pic_deal_icon_narrow") as BitmapDataAsset);
            if (_local_4 != null)
            {
                this._bundleIcon = (_local_4.content as BitmapData);
            }
            else
            {
                this._bundleIcon = new BitmapData(1, 1, true, 0xFFFFFF);
            }
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this._bundleIcon = null;
            super.dispose();
        }

        override public function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void
        {
            setIconImage(this._bundleIcon.clone(), true);
        }

        public function _Str_6159(k:IItemGridWindow, _arg_2:XML):void
        {
            var _local_4:IProduct;
            var _local_5:IWindowContainer;
            var _local_6:IWindow;
            var _local_7:BitmapData;
            var _local_3:IWindowContainer = (catalog.windowManager.buildFromXML(_arg_2) as IWindowContainer);
            for each (_local_4 in offer.productContainer.products)
            {
                if (_local_4.productType == ProductTypeEnum.BADGE)
                {
                }
                else
                {
                    _local_5 = (_local_3.clone() as IWindowContainer);
                    _local_6 = _local_5.findChildByName("clubLevelIcon");
                    if (_local_6 != null)
                    {
                        _local_6.visible = false;
                    }
                    k._Str_2816(_local_5);
                    _local_4.view = _local_5;
                    _local_7 = _local_4.initIcon(this);
                    if (_local_7 != null)
                    {
                        _local_7.dispose();
                    }
                    _local_4.grid = this;
                }
            }
        }

        public function _Str_21877(k:int):void
        {
            var _local_2:IWindow = (_Str_2271.findChildByName("bundleCounter") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.caption = k.toString();
            }
        }

        public function select(k:IGridItem, _arg_2:Boolean):void
        {
            Logger.log(("Product Bundle, select item: " + k));
        }

        public function _Str_9974(k:IGridItem):Boolean
        {
            return false;
        }

        override public function set view(k:IWindowContainer):void
        {
            super.view = k;
            this._Str_21877(999);
        }
    }
}
