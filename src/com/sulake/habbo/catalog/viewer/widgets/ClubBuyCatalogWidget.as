package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubOfferHandler;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.enum.ClubOfferRequestSource;
    import com.sulake.habbo.catalog.club.ClubBuyDialog;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.catalog.viewer.ICatalogViewer;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class ClubBuyCatalogWidget extends CatalogWidget implements IVipBuyCatalogWidget 
    {
        private var _controller:ClubOfferHandler;
        private var _offers:Array;

        public function ClubBuyCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            if (this._controller != null)
            {
                this._controller._Str_18073(this);
            }
            this._controller = null;
            this.reset();
            super.dispose();
        }

        public function get isGift():Boolean
        {
            return false;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._offers = [];
            _Str_2819(CatalogWidgetEnum.CLUB_BUY);
            this._controller = (page.viewer.catalog as HabboCatalog)._Str_18172();
            this._controller.registerVisualization(this);
            this._controller.requestOffers(ClubOfferRequestSource._Str_15734);
            return true;
        }

        public function reset():void
        {
            var k:ClubBuyDialog;
            for each (k in this._offers)
            {
                k.dispose();
            }
            this._offers = [];
        }

        public function _Str_15013(clubType:int):void
        {
            var catalog:HabboCatalog;
            var localization:IHabboLocalizationManager;
            var purse:IPurse;
            var clubDays:int;
            var clubPeriods:int;
            var clubDaysTotal:int;
            if (disposed)
            {
                return;
            }
            var viewer:ICatalogViewer = page.viewer;
            if (viewer)
            {
                catalog = (viewer.catalog as HabboCatalog);
                if (catalog)
                {
                    localization = catalog.localization;
                    purse = catalog.getPurse();
                    if (((purse) && (localization)))
                    {
                        clubDays = purse.clubDays;
                        clubPeriods = purse.clubPeriods;
                        clubDaysTotal = ((clubPeriods * 31) + clubDays);
                        localization.registerParameter("catalog.club.buy.remaining.hc", "days", String(clubDaysTotal));
                        localization.registerParameter("catalog.club.buy.remaining.vip", "days", String(clubDaysTotal));
                    }
                }
            }
            try
            {
                if (_window)
                {
                    switch (clubType)
                    {
                        case HabboClubLevelEnum._Str_3159:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.none}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.none}";
                            _window.findChildByName("club_remaining").visible = false;
                            _window.findChildByName("club_remaining_bg").visible = false;
                            break;
                        case HabboClubLevelEnum._Str_2964:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.hc}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.hc}";
                            _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.hc}";
                            break;
                        case HabboClubLevelEnum._Str_2575:
                            _window.findChildByName("club_header").caption = "${catalog.club.buy.header.vip}";
                            _window.findChildByName("club_info").caption = "${catalog.club.buy.info.vip}";
                            _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.vip}";
                            this._Str_22558();
                            break;
                    }
                }
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", "initClubType - Window not properly constructed!");
            }
            this._Str_7955();
        }

        private function _Str_7955():void
        {
            var k:IWindow;
            if (_window)
            {
                k = _window.findChildByName("club_link");
                if (k)
                {
                    k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
                    k.mouseThreshold = 0;
                    k.addEventListener(WindowMouseEvent.CLICK, this._Str_18285);
                }
            }
        }

        public function _Str_6059(offer:ClubBuyOfferData):void
        {
            var target:IItemListWindow;
            var item:ClubBuyDialog;
            if (disposed)
            {
                return;
            }
            Logger.log(("Offer: " + [offer.offerId, offer.productCode, offer.priceCredits, offer.vip, offer.months, offer._Str_11224, offer.year, offer.month, offer.day, offer._Str_10047]));
            offer.page = page;
            try
            {
                item = new ClubBuyDialog(offer, (page as CatalogPage));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", (((("showOffer - new ClubBuyItem(" + String(offer)) + ", ") + String((page as CatalogPage))) + ") crashed!"));
                return;
            }
            if (offer.vip)
            {
                target = (_window.findChildByName("item_list_vip") as IItemListWindow);
            }
            else
            {
                target = (_window.findChildByName("item_list_hc") as IItemListWindow);
            }
            if (target != null)
            {
                target.addListItem(item.window);
            }
            this._offers.push(item);
        }

        private function _Str_18285(k:WindowMouseEvent):void
        {
            var _local_3:IHabboConfigurationManager;
            var _local_4:String;
            var _local_2:String = IWindow(k.target).name;
            _local_3 = (page.viewer.catalog as HabboCatalog);
            switch (_local_2)
            {
                case "club_link":
                    _local_4 = _local_3.getProperty("link.format.club");
                    this.openExternalLink(_local_4);
                    return;
            }
        }

        private function openExternalLink(k:String):void
        {
            if (k != "")
            {
                page.viewer.catalog.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, this._Str_7790);
                HabboWebTools.navigateToURL(k, "habboMain");
            }
        }

        private function _Str_7790(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_22558():void
        {
            var _local_2:XML;
            var _local_3:IWindow;
            var k:IItemListWindow = (_window.findChildByName("item_list_hc") as IItemListWindow);
            if (k != null)
            {
                _local_2 = getAssetXML("club_buy_info_item");
                _local_3 = page.viewer.catalog.windowManager.buildFromXML(_local_2);
                k.addListItem(_local_3);
            }
        }
    }
}
