package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoViewManager;
    import flash.utils.Timer;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;

    public class BundlePurchaseExtraInfoCatalogWidget extends CatalogWidget
    {
        private static const _Str_17825:uint = 4000;

        private var _habboCatalog:HabboCatalog;
        private var _Str_4613:ExtraInfoViewManager;
        private var _Str_11260:int = 1;
        private var _Str_6654:int;
        private var _Str_5642:int;
        private var _Str_10800:int;
        private var _Str_25522:String;
        private var _Str_6878:int = -1;
        private var _Str_6832:int = -1;
        private var _Str_9708:int = -1;
        private var _Str_16462:Boolean = false;
        private var _Str_8255:Timer;

        public function BundlePurchaseExtraInfoCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._habboCatalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._Str_4613.dispose();
                this._Str_4613 = null;
                this._habboCatalog = null;
                this._Str_8255.stop();
                this._Str_8255.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._Str_8255 = null;
                events.removeEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_RESET, this._Str_21011);
                events.removeEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_HIDE, this._Str_10890);
                events.removeEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_10389);
                events.removeEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_ITEM_CLICKED, this._Str_20926);
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!((this._habboCatalog._Str_7593) && (this._habboCatalog.discountEnabled)))
            {
                return true;
            }
            this._Str_4613 = new ExtraInfoViewManager(this, this._habboCatalog);
            events.addEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_RESET, this._Str_21011);
            events.addEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_HIDE, this._Str_10890);
            events.addEventListener(CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED, this._Str_10389);
            events.addEventListener(CatalogWidgetBundleDisplayExtraInfoEvent.CWPPEIE_ITEM_CLICKED, this._Str_20926);
            this._Str_8255 = new Timer(_Str_17825, 1);
            this._Str_8255.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            return true;
        }

        private function _Str_20610():void
        {
            var k:ExtraInfoItemData = new ExtraInfoItemData(ExtraInfoItemData._Str_13400);
            k.quantity = this._Str_11260;
            this._Str_6878 = this._Str_4613._Str_2822(k);
        }

        private function _Str_23161(k:int):void
        {
            var _local_2:UpdateableExtraInfoListItem;
            var _local_3:ExtraInfoItemData;
            if (this._Str_6878 != -1)
            {
                _local_2 = UpdateableExtraInfoListItem(this._Str_4613._Str_2990(this._Str_6878));
                _local_3 = _local_2.data;
                _local_3.quantity = k;
                _local_2.update(_local_3);
            }
        }

        private function _Str_23704():void
        {
            if (this._Str_6878 != -1)
            {
                this._Str_4613.removeItem(this._Str_6878);
                this._Str_6878 = -1;
            }
        }

        private function _Str_22355():void
        {
            var k:ExtraInfoItemData = new ExtraInfoItemData(ExtraInfoItemData._Str_14097);
            k.quantity = this._Str_11260;
            k.priceActivityPoints = this._Str_5642;
            k.activityPointType = this._Str_10800;
            k.priceCredits = this._Str_6654;
            this._Str_6832 = this._Str_4613._Str_2822(k);
            this._habboCatalog.utils._Str_25517();
        }

        private function _Str_23762(k:int):void
        {
            var _local_2:UpdateableExtraInfoListItem;
            var _local_3:ExtraInfoItemData;
            if (this._Str_6832 != -1)
            {
                _local_2 = UpdateableExtraInfoListItem(this._Str_4613._Str_2990(this._Str_6832));
                _local_3 = _local_2.data;
                _local_3.quantity = k;
                _local_3.discountPriceCredits = this._habboCatalog.utils._Str_4488(true, this._Str_6654, k);
                _local_3.discountPriceActivityPoints = this._habboCatalog.utils._Str_4488(true, this._Str_5642, k);
                _local_2.update(_local_3);
            }
        }

        private function _Str_24383():void
        {
            if (this._Str_6832 != -1)
            {
                this._Str_4613.removeItem(this._Str_6832);
                this._Str_6832 = -1;
            }
        }

        private function _Str_22330():void
        {
            var k:ExtraInfoItemData = new ExtraInfoItemData(ExtraInfoItemData._Str_14719);
            this._Str_9708 = this._Str_4613._Str_2822(k);
            this._habboCatalog.utils._Str_22409();
        }

        private function _Str_20722():void
        {
            if (this._Str_9708 != -1)
            {
                this._Str_4613.removeItem(this._Str_9708);
                this._Str_9708 = -1;
            }
        }

        private function _Str_21011(k:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            if (disposed)
            {
                return;
            }
            window.visible = true;
            this._Str_6654 = k.data.priceCredits;
            this._Str_5642 = k.data.priceActivityPoints;
            this._Str_10800 = k.data.activityPointType;
            this._Str_25522 = k.data.badgeCode;
            this._Str_4613.clear();
            this._Str_6832 = -1;
            this._Str_6878 = -1;
            this._Str_8255.start();
        }

        private function _Str_10389(k:CatalogWidgetSpinnerEvent):void
        {
            if (disposed)
            {
                return;
            }
            if (!this._habboCatalog._Str_5195)
            {
                return;
            }
            if (k.type == CatalogWidgetSpinnerEvent.CWSE_VALUE_CHANGED)
            {
                if (k.value != this._Str_11260)
                {
                    if (((k.value >= this._habboCatalog._Str_5195._Str_9227) && (this._Str_6832 == -1)))
                    {
                        this._Str_22355();
                    }
                    else
                    {
                        if (k.value < this._habboCatalog._Str_5195._Str_9227)
                        {
                            this._Str_24383();
                        }
                    }
                    this._Str_23161(k.value);
                    this._Str_23762(k.value);
                    this._Str_11260 = k.value;
                    this._Str_20722();
                    if (this._Str_11260 >= this._habboCatalog.utils._Str_23617)
                    {
                        this._Str_23704();
                        this._Str_16462 = true;
                    }
                    else
                    {
                        if (this._Str_16462)
                        {
                            this._Str_20610();
                            this._Str_16462 = false;
                        }
                    }
                    this._habboCatalog.utils._Str_25512();
                }
            }
        }

        private function _Str_10890(k:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            window.visible = false;
        }

        private function _Str_20926(k:CatalogWidgetBundleDisplayExtraInfoEvent):void
        {
            switch (k.id)
            {
                case this._Str_6878:
                    if (this._Str_9708 == -1)
                    {
                        this._Str_22330();
                    }
                    return;
                case this._Str_9708:
                    this._Str_20722();
                    return;
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            this._Str_20610();
        }
    }
}
