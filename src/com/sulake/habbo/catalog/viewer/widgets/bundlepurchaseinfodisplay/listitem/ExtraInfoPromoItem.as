package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoCatalogWidget;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class ExtraInfoPromoItem extends UpdateableExtraInfoListItem 
    {
        private static const CATALOG_BUNDLEWIDGET_DISCOUNT_PROMO:String = "catalog.bundlewidget.discount.promo";

        private var _window:IWindowContainer = null;
        private var _dirty:Boolean = true;
        private var _catalog:HabboCatalog;
        private var _nextDiscountMap:Map;
        private var _nextDiscountLevel:int = 0;
        private var _widget:BundlePurchaseExtraInfoCatalogWidget;
        private var _effectLayerBlend:Number = 0;
        private var _effectTimer:Timer;

        public function ExtraInfoPromoItem(k:BundlePurchaseExtraInfoCatalogWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:HabboCatalog)
        {
            super(null, _arg_2, _arg_3, ExtraInfoListItem.ALIGN_TOP);
            this._widget = k;
            this._catalog = _arg_4;
            this._Str_22791();
            this._Str_19616();
            this._effectTimer = new Timer(50);
            this._effectTimer.addEventListener(TimerEvent.TIMER, this._Str_20806);
            this._effectTimer.start();
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._effectTimer.stop();
                this._effectTimer.removeEventListener(TimerEvent.TIMER, this._Str_20806);
                this._effectTimer = null;
                this._nextDiscountMap = null;
                this._catalog = null;
                super.dispose();
            }
        }

        override public function update(k:ExtraInfoItemData):void
        {
            super.update(k);
            var _local_2:int = this._nextDiscountLevel;
            this._Str_19616();
            if (this._nextDiscountLevel != _local_2)
            {
                this._effectLayerBlend = 1;
            }
            this._dirty = true;
            this.render();
        }

        override public function getRenderedWindow():IWindowContainer
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            if (this._dirty)
            {
                this.render();
            }
            return this._window;
        }

        private function createWindow():void
        {
            this._window = IWindowContainer(this._catalog.utils.createWindow("discountPromoItem"));
            this._window.procedure = this._Str_2533;
            var k:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("icon_bitmap"));
            HabboCatalogUtils._Str_14396(k, BitmapData(this._catalog.assets.getAssetByName("thumb_up").content).clone());
        }

        private function render():void
        {
            this._catalog.localization.registerParameter(CATALOG_BUNDLEWIDGET_DISCOUNT_PROMO, "quantity", this._nextDiscountLevel.toString());
            this._catalog.localization.registerParameter(CATALOG_BUNDLEWIDGET_DISCOUNT_PROMO, "discount", this._nextDiscountMap.getValue(this._nextDiscountLevel));
            var k:String = this._catalog.localization.getLocalizationRaw(CATALOG_BUNDLEWIDGET_DISCOUNT_PROMO).value;
            this._window.findChildByName("promo_text").caption = k;
            this._window.findChildByName("promo_text_effect").caption = k;
            this._dirty = false;
        }

        private function _Str_19616():void
        {
            var k:Array = this._nextDiscountMap.getKeys();
            var _local_2:int;
            while (_local_2 < k.length)
            {
                if (int(k[_local_2]) > data.quantity)
                {
                    this._nextDiscountLevel = int(k[_local_2]);
                    return;
                }
                _local_2++;
            }
        }

        private function _Str_22791():void
        {
            var _local_3:int;
            var _local_4:int;
            this._nextDiscountMap = new Map();
            var k:int = 1;
            var _local_2:int;
            while (k <= 100)
            {
                _local_3 = this._catalog.utils._Str_4488(true, 1, k);
                _local_4 = (k - _local_3);
                if (((_local_4 > _local_2) && (this._catalog.utils._Str_20096.indexOf(k) == -1)))
                {
                    this._nextDiscountMap.add(k, _local_4);
                    _local_2 = _local_4;
                }
                k++;
            }
        }

        private function _Str_20806(k:TimerEvent):void
        {
            if (this._effectLayerBlend > 0)
            {
                this._effectLayerBlend = (this._effectLayerBlend - 0.1);
                if (this._effectLayerBlend < 0)
                {
                    this._effectLayerBlend = 0;
                }
                this._window.findChildByName("promo_text_effect").blend = this._effectLayerBlend;
            }
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2.name == "click_region")
            {
                switch (k.type)
                {
                    case WindowMouseEvent.CLICK:
                        this._widget.events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_ITEM_CLICKED, data, id));
                        return;
                    case WindowMouseEvent.OVER:
                        ITextWindow(this._window.findChildByName("promo_text")).textColor = 12582911;
                        return;
                    case WindowMouseEvent.OUT:
                        ITextWindow(this._window.findChildByName("promo_text")).textColor = 0xFFFFFF;
                        return;
                }
            }
        }
    }
}
