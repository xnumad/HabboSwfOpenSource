package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;

    public class ClubBuyDialog 
    {
        private var _Str_2324:ClubBuyOfferData;
        private var _window:IWindowContainer;
        private var _Str_2619:ICatalogPage;

        public function ClubBuyDialog(k:ClubBuyOfferData, _arg_2:ICatalogPage)
        {
            var _local_3:XML;
            var _local_5:ILocalization;
            super();
            this._Str_2324 = k;
            this._Str_2619 = _arg_2;
            if (k.vip)
            {
                _local_3 = this.getAssetXML("club_buy_vip_item");
            }
            else
            {
                _local_3 = this.getAssetXML("club_buy_hc_item");
            }
            this._window = (this._Str_2619.viewer.catalog.windowManager.buildFromXML(_local_3) as IWindowContainer);
            var _local_4:IHabboLocalizationManager = (_arg_2.viewer.catalog as HabboCatalog).localization;
            _local_4.registerParameter("catalog.club.item.header", "months", String(k.months));
            _local_5 = _local_4.getLocalizationRaw("catalog.club.item.header");
            this._window.findChildByName("item_header").caption = _local_5.value;
            _local_4.registerParameter("catalog.club.price", "price", String(k.priceCredits));
            _local_5 = _local_4.getLocalizationRaw("catalog.club.price");
            this._window.findChildByName("item_price").caption = _local_5.value;
            var _local_6:IButtonWindow = (this._window.findChildByName("item_buy") as IButtonWindow);
            if (_local_6 != null)
            {
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_12134);
            }
        }

        public function dispose():void
        {
            this._window.dispose();
        }

        private function _Str_12134(k:WindowMouseEvent):void
        {
            HabboCatalog(this._Str_2619.viewer.catalog)._Str_5649(this._Str_2324, this._Str_2619.pageId);
        }

        private function getAssetXML(k:String):XML
        {
            if (((((!(this._Str_2619)) || (!(this._Str_2619.viewer))) || (!(this._Str_2619.viewer.catalog))) || (!(this._Str_2619.viewer.catalog.assets))))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._Str_2619.viewer.catalog.assets.getAssetByName(k) as XmlAsset);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.content as XML;
        }

        public function get window():IWindow
        {
            return this._window;
        }
    }
}
