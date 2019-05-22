package com.sulake.habbo.catalog.club
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class ClubOffer implements IDisposable 
    {
        private var _Str_2324:ClubBuyOfferData;
        private var _window:IWindowContainer;
        private var _habboCatalog:HabboCatalog;
        private var _disposed:Boolean = false;
        private var _Str_25725:String;

        public function ClubOffer(k:ClubBuyOfferData, _arg_2:HabboCatalog, _arg_3:String)
        {
            var _local_5:ILocalization;
            super();
            this._Str_2324 = k;
            this._habboCatalog = _arg_2;
            this._Str_25725 = _arg_3;
            this._window = (this._habboCatalog.utils.createWindow("vip_buy_item") as IWindowContainer);
            var _local_4:IHabboLocalizationManager = this._habboCatalog.localization;
            if (k.months > 0)
            {
                _local_4.registerParameter("catalog.vip.item.header.months", "num_months", String(k.months));
                _local_5 = _local_4.getLocalizationRaw("catalog.vip.item.header.months");
            }
            else
            {
                _local_4.registerParameter("catalog.vip.item.header.days", "num_days", String(k._Str_15178));
                _local_5 = _local_4.getLocalizationRaw("catalog.vip.item.header.days");
            }
            this._window.findChildByName("item_header").caption = ((_local_5 != null) ? _local_5.value : "-");
            this._habboCatalog.utils._Str_6455((this._window.findChildByName("item_price") as IWindowContainer), this._Str_2324);
            this._window.findChildByName("item_buy").addEventListener(WindowMouseEvent.CLICK, this._Str_12134);
            if (k.giftable)
            {
                this._window.findChildByName("item_gift").addEventListener(WindowMouseEvent.CLICK, this._Str_18825);
            }
            else
            {
                this._window.findChildByName("item_gift").visible = false;
            }
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._window.dispose();
                this._window = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_12134(k:WindowMouseEvent):void
        {
            this._habboCatalog._Str_8986(false);
            this._habboCatalog._Str_5649(this._Str_2324, ((this._Str_2324.page == null) ? -1 : this._Str_2324.page.pageId));
        }

        private function _Str_18825(k:WindowMouseEvent):void
        {
            this._habboCatalog._Str_8986(true);
            this._habboCatalog._Str_5649(this._Str_2324, ((this._Str_2324.page == null) ? -1 : this._Str_2324.page.pageId));
        }

        public function get window():IWindow
        {
            return this._window;
        }
    }
}
