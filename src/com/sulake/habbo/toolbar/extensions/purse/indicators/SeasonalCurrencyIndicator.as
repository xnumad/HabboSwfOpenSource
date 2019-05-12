package com.sulake.habbo.toolbar.extensions.purse.indicators
{
    import com.sulake.habbo.toolbar.extensions.purse.CurrencyIndicatorBase;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class SeasonalCurrencyIndicator extends CurrencyIndicatorBase 
    {
        private static const _Str_3591:uint = 4286084205;
        private static const _Str_3385:uint = 4283781966;
        private static const _Str_8605:Array = ["toolbar_credit_icon_0", "toolbar_credit_icon_1", "toolbar_credit_icon_2", "toolbar_credit_icon_1", "toolbar_credit_icon_0"];

        private var _catalog:IHabboCatalog;
        private var _Str_4692:int = -1;
        private var _habboToolbar:HabboToolbar;
		private var currencyId:int = -1;

        public function SeasonalCurrencyIndicator(k:HabboToolbar, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboCatalog, _arg_5:ICoreLocalizationManager, currencyId:int = -1)
        {
            super(_arg_2, _arg_3);
			this.currencyId = currencyId;
            this._habboToolbar = k;
			if (this.currencyId == -1)
			{
				this._habboToolbar.getInteger("seasonalcurrencyindicator.currency", 1)
			}
            this._catalog = _arg_4;
            this._Str_19567 = _Str_3591;
            this._Str_21715 = _Str_3385;
            this._Str_15051 = "amount";
            this._Str_8446 = _arg_5.getLocalization("purse.snowflakes.zero.amount.text", "Info");
            createWindow("purse_indicator_seasonal_xml", null);
            window.findChildByName("seasonal_icon").style = ActivityPointTypeEnum._Str_5251(this._Str_20938(), k, true);
            this.setAmount(0);
            k.extensionView.attachExtension(ToolbarDisplayExtensionIds.PURSE_SEASONAL_CURRENCY, window, ExtensionFixedSlotsEnum._Str_18616);
            this.registerUpdateEvents(_arg_4.events);
        }

        private function _Str_20938():int
        {
            return this.currencyId;
        }

        private function _Str_25094():String
        {
            return this._habboToolbar.getProperty("seasonalcurrencyindicator.page");
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (!k)
            {
                return;
            }
            k.addEventListener(PurseEvent.CATALOG_PURSE_ACTIVITY_POINT_BALANCE, this._Str_21326);
        }

        override protected function onContainerClick(k:WindowMouseEvent):void
        {
            this._catalog.openCatalogPage(this._Str_25094());
        }

        public function _Str_21326(k:PurseEvent):void
        {
            if (k.activityPointType == this._Str_20938())
            {
                this.setAmount(k.balance);
                if (this._Str_4692 != -1)
                {
                    _Str_19581(this._Str_4692, k.balance);
                }
                this._Str_4692 = k.balance;
            }
        }

        override protected function setAmount(k:int, _arg_2:int=-1):void
        {
            var _local_3:String = k.toString();
            if (k == 0)
            {
                _local_3 = this._Str_8446;
                _Str_13549(true);
            }
            else
            {
                _Str_13549(false);
            }
            _Str_2497(_local_3);
        }
    }
}
