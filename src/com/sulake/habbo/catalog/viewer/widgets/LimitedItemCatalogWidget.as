package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window.utils._Str_14136;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import flash.utils.Timer;
    import com.sulake.habbo.window.widgets._Str_9620;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.ProductOfferUpdatedEvent;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.Offer;

    public class LimitedItemCatalogWidget extends CatalogWidget
    {
        private static const _Str_18612:int = 20000;

        private var _habboCatalog:HabboCatalog;
        private var _Str_8367:_Str_14136;
        private var _Str_12055:IPurchasableOffer;
        private var _Str_6632:Timer;
        private var _Str_17834:_Str_9620;

        public function LimitedItemCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._habboCatalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._Str_6632 != null)
                {
                    this._Str_6632.stop();
                    this._Str_6632.removeEventListener(TimerEvent.TIMER, this._Str_19874);
                    this._Str_6632 = null;
                }
                window.visible = false;
                this._habboCatalog = null;
                this._Str_12055 = null;
                if (this._Str_8367)
                {
                    this._Str_8367.dispose();
                    this._Str_8367 = null;
                }
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
                events.removeEventListener(CatalogWidgetEvent.PRODUCT_OFFER_UPDATED, this._Str_20503);
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            var k:IWidgetWindow = IWidgetWindow(_window.findChildByName("unique_item_overlay_container"));
            this._Str_17834 = _Str_9620(k.widget);
            window.visible = false;
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.PRODUCT_OFFER_UPDATED, this._Str_20503);
            this._Str_6632 = new Timer(_Str_18612);
            this._Str_6632.addEventListener(TimerEvent.TIMER, this._Str_19874);
            return true;
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_12055 = k.offer;
            this.update(k.offer, true);
        }

        private function _Str_20503(k:ProductOfferUpdatedEvent):void
        {
            this._Str_12055 = k.offer;
            this.update(k.offer);
        }

        private function update(k:IPurchasableOffer, _arg_2:Boolean=false):void
        {
            var _local_3:IProduct;
            if (((k.pricingModel == Offer.PRICING_MODEL_SINGLE) && (k.product.isUniqueLimitedItem)))
            {
                _local_3 = k.product;
                this._Str_17834._Str_13963 = _local_3.uniqueLimitedItemsLeft;
                this._Str_17834._Str_4345 = _local_3.uniqueLimitedItemSeriesSize;
                window.visible = true;
                if (_arg_2)
                {
                    this._habboCatalog.sendGetProductOffer(k.offerId);
                }
                this._Str_6632.start();
            }
            else
            {
                window.visible = false;
                this._Str_6632.stop();
            }
        }

        private function _Str_19874(k:TimerEvent):void
        {
            if (((_window.visible) && (!(this._Str_12055 == null))))
            {
                this.update(this._Str_12055, true);
            }
        }
    }
}
