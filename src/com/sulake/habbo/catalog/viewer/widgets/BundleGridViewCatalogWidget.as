package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.viewer._Str_4311;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;

    public class BundleGridViewCatalogWidget extends CatalogWidget implements _Str_4311, IProductContainer 
    {
        private var _offer:IPurchasableOffer;
        private var _gridItemLayout:XML;
        private var _itemGrid:IItemGridWindow;

        public function BundleGridViewCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            var k:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            this._gridItemLayout = (k.content as XML);
            this._itemGrid = IItemGridWindow(_window.findChildByName("bundleGrid"));
            return true;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
                events.removeEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
                super.dispose();
            }
        }

        private function _Str_3393(k:_Str_3308):void
        {
            var _local_2:IPurchasableOffer;
            if (page.offers.length == 1)
            {
                _local_2 = page.offers[0];
                if (_local_2 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_2));
                }
            }
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            this._offer = k.offer;
            this._itemGrid.destroyGridItems();
            this._Str_6159();
        }

        protected function _Str_6159():void
        {
            var _local_2:IProduct;
            var _local_3:IWindowContainer;
            var _local_4:IWindow;
            var _local_5:BitmapData;
            var k:IWindowContainer = (this._offer.page.viewer.catalog.windowManager.buildFromXML(this._gridItemLayout) as IWindowContainer);
            for each (_local_2 in this._offer.productContainer.products)
            {
                if (_local_2.productType == ProductTypeEnum.BADGE)
                {
                }
                else
                {
                    _local_3 = (k.clone() as IWindowContainer);
                    _local_4 = _local_3.findChildByName("clubLevelIcon");
                    if (_local_4 != null)
                    {
                        _local_4.visible = false;
                    }
                    this._itemGrid._Str_2816(_local_3);
                    _local_2.view = _local_3;
                    _local_5 = _local_2.initIcon(this);
                    if (_local_5 != null)
                    {
                        _local_5.dispose();
                    }
                    _local_2.grid = this;
                }
            }
        }

        public function get offer():IPurchasableOffer
        {
            return this._offer;
        }

        public function select(k:IGridItem, _arg_2:Boolean):void
        {
        }

        public function _Str_9974(k:IGridItem):Boolean
        {
            return false;
        }

        public function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void
        {
        }

        public function activate():void
        {
        }

        public function get products():Vector.<IProduct>
        {
            return null;
        }

        public function get _Str_6851():IProduct
        {
            return null;
        }

        public function set view(k:IWindowContainer):void
        {
        }

        public function get view():IWindowContainer
        {
            return null;
        }

        public function set grid(k:_Str_4311):void
        {
        }

        public function _Str_15497(k:int):void
        {
        }
    }
}
