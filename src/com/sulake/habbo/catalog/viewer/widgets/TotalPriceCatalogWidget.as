package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemListWindow;

    public class TotalPriceCatalogWidget extends CatalogWidget
    {
        private static const TOTALPRICE_CONTAINER:String = "totalprice_container";
        private static const PLUS:String = "plus";
        private static const AMOUNT_TEXT_LEFT:String = "amount_text_left";
        private static const AMOUNT_TEXT_RIGHT:String = "amount_text_right";
        private static const TOTAL_LEFT:String = "total_left";
        private static const TOTAL_RIGHT:String = "total_right";
        private static const CURRENCY_INDICATOR_BITMAP_LEFT:String = "currency_indicator_bitmap_left";
        private static const CURRENCY_INDICATOR_BITMAP_RIGHT:String = "currency_indicator_bitmap_right";

        private var _habboCatalog:HabboCatalog;
        private var _Str_6654:int;
        private var _Str_5642:int;
        private var _Str_10800:int;
        private var _Str_8846:IWindow;
        private var _Str_13390:IWindow;
        private var _Str_4850:IWindowContainer;
        private var _Str_6091:IWindowContainer;
        private var _Str_2769:int = 1;

        public function TotalPriceCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._habboCatalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._habboCatalog = null;
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_20196);
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_19239);
                this.clear();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.TOTAL_PRICE);
            window.visible = false;
            if (!this._habboCatalog._Str_7593)
            {
                return true;
            }
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_20196);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_19239);
            events.dispatchEvent(new Event(CatalogWidgetEvent.TOTAL_PRICE_WIDGET_INITIALIZED));
            return true;
        }

        private function _Str_20196(k:CatalogWidgetSpinnerEvent):void
        {
            this._Str_2769 = k.value;
            this._Str_20864();
        }

        private function _Str_19239(k:SelectProductEvent):void
        {
            window.visible = k.offer.bundlePurchaseAllowed;
            this._Str_6654 = k.offer.priceInCredits;
            this._Str_5642 = k.offer.priceInActivityPoints;
            this._Str_10800 = k.offer.activityPointType;
            this._Str_2769 = 1;
            this.clear();
            this._Str_18628();
            this._Str_20864();
        }

        private function clear():void
        {
            this._Str_8846 = null;
            this._Str_13390 = null;
            this._Str_4850 = null;
            this._Str_6091 = null;
            _window.findChildByName(PLUS).visible = false;
            _window.findChildByName(AMOUNT_TEXT_LEFT).visible = false;
            if (_window.findChildByName(TOTAL_LEFT))
            {
                _window.findChildByName(TOTAL_LEFT).visible = false;
            }
            if (_window.findChildByName(TOTAL_RIGHT))
            {
                _window.findChildByName(TOTAL_RIGHT).visible = false;
            }
            _window.findChildByName(CURRENCY_INDICATOR_BITMAP_LEFT).visible = false;
        }

        private function _Str_20864():void
        {
            var _local_5:IWindow;
            var _local_6:IWindow;
            var k:int = (this._Str_2769 * this._Str_6654);
            var _local_2:int = (this._Str_2769 * this._Str_5642);
            var _local_3:int = k;
            var _local_4:int = _local_2;
            if (this._habboCatalog.discountEnabled)
            {
                _local_3 = this._habboCatalog.utils._Str_4488(true, this._Str_6654, this._Str_2769);
                _local_4 = this._habboCatalog.utils._Str_4488(true, this._Str_5642, this._Str_2769);
            }
            if (this._Str_8846 != null)
            {
                this._Str_8846.caption = ((this._habboCatalog.discountEnabled) ? _local_3.toString() : k.toString());
            }
            if (this._Str_13390 != null)
            {
                this._Str_13390.caption = ((this._habboCatalog.discountEnabled) ? _local_4.toString() : _local_2.toString());
            }
            if (this._Str_4850)
            {
                this._Str_4850.visible = (!(k == _local_3));
                _local_5 = this._Str_4850.findChildByName("text");
                _local_5.caption = ((this._Str_4850.visible) ? k.toString() : "0");
                this._Str_4850.findChildByName("strike").width = _local_5.width;
            }
            if (this._Str_6091)
            {
                this._Str_6091.visible = (!(_local_2 == _local_4));
                _local_6 = this._Str_6091.findChildByName("text");
                _local_6.caption = ((this._Str_6091.visible) ? _local_2.toString() : "0");
                this._Str_6091.findChildByName("strike").width = _local_6.width;
            }
        }

        private function _Str_18628():void
        {
            var k:IWindow;
            var _local_2:IWindow;
            if (this._Str_6654 > 0)
            {
                if (this._Str_5642 > 0)
                {
                    this._Str_8846 = _window.findChildByName(AMOUNT_TEXT_LEFT);
                    this._Str_8846.visible = true;
                    this._Str_4850 = (_window.findChildByName(TOTAL_LEFT) as IWindowContainer);
                    if (this._Str_4850)
                    {
                        this._Str_4850.visible = false;
                    }
                    k = _window.findChildByName(CURRENCY_INDICATOR_BITMAP_LEFT);
                    k.visible = true;
                    _window.findChildByName("plus").visible = true;
                }
                else
                {
                    this._Str_8846 = _window.findChildByName(AMOUNT_TEXT_RIGHT);
                    this._Str_4850 = (_window.findChildByName(TOTAL_RIGHT) as IWindowContainer);
                    if (this._Str_4850)
                    {
                        this._Str_4850.visible = false;
                    }
                    k = _window.findChildByName(CURRENCY_INDICATOR_BITMAP_RIGHT);
                }
                if (page.acceptSeasonCurrencyAsCredits)
                {
                    k.style = ActivityPointTypeEnum._Str_5251(this._habboCatalog._Str_19095(), this._habboCatalog, true, true);
                    k.width = 53;
                }
                else
                {
                    k.style = ActivityPointTypeEnum._Str_5251(-1, this._habboCatalog, true);
                    k.width = 22;
                }
            }
            if (this._Str_5642 > 0)
            {
                this._Str_13390 = ITextWindow(_window.findChildByName(AMOUNT_TEXT_RIGHT));
                this._Str_6091 = (_window.findChildByName(TOTAL_LEFT) as IWindowContainer);
                if (this._Str_6091)
                {
                    this._Str_6091.visible = false;
                }
                _local_2 = _window.findChildByName(CURRENCY_INDICATOR_BITMAP_RIGHT);
                _local_2.style = ActivityPointTypeEnum._Str_5251(this._Str_10800, this._habboCatalog, true);
            }
            IItemListWindow(_window.findChildByName(TOTALPRICE_CONTAINER)).arrangeListItems();
        }
    }
}
