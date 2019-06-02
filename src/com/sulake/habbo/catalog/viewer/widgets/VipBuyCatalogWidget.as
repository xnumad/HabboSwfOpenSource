package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubOfferHandler;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.enum.ClubOfferRequestSource;
    import com.sulake.habbo.catalog.club.ClubOffer;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.purse.IPurse;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.components.ITextWindow;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.text.StyleSheet;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;

    public class VipBuyCatalogWidget extends CatalogWidget implements IVipBuyCatalogWidget 
    {
        private var _controller:ClubOfferHandler;
        private var _offers:Array;
        private var _catalog:HabboCatalog;
        private var _isGift:Boolean;

        public function VipBuyCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog, _arg_3:Boolean=false)
        {
            super(k);
            this._catalog = _arg_2;
            this._isGift = _arg_3;
        }

        public function get isGift():Boolean
        {
            return this._isGift;
        }

        override public function dispose():void
        {
            if (this._controller != null)
            {
                this._controller._Str_18073(this);
                this._controller = null;
            }
            this.reset();
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._offers = [];
            this._controller = this._catalog._Str_18172();
            this._controller.registerVisualization(this);
            this._controller.requestOffers(((this._isGift) ? ClubOfferRequestSource._Str_15001 : ClubOfferRequestSource._Str_12589));
            return true;
        }

        public function reset():void
        {
            var k:ClubOffer;
            for each (k in this._offers)
            {
                k.dispose();
            }
            this._offers = [];
        }

        public function _Str_15013(k:int):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (disposed)
            {
                return;
            }
            var _local_2:IHabboLocalizationManager = this._catalog.localization;
            var _local_3:IPurse = this._catalog.getPurse();
            if (((!(_local_3 == null)) && (!(_local_2 == null))))
            {
                _local_4 = _local_3.clubDays;
                _local_5 = _local_3.clubPeriods;
                _local_6 = ((_local_5 * 31) + _local_4);
                _local_2.registerParameter("catalog.vip.extend.info", "days", String(_local_6));
            }
            if ((((!(_window == null)) && (k == HabboClubLevelEnum._Str_2575)) && (!(this._isGift))))
            {
                _window.findChildByName("vip_title").caption = "${catalog.vip.extend.title}";
                _window.findChildByName("vip_info").caption = "${catalog.vip.extend.info}";
            }
            if (_window != null)
            {
                this._Str_11983((_window.findChildByName("vip_title") as ITextWindow));
                this._Str_11983((_window.findChildByName("vip_info") as ITextWindow), 3);
            }
            this._Str_7955();
        }

        private function _Str_11983(k:ITextWindow, _arg_2:Number=0):void
        {
            var _local_3:TextFormat = k.getTextFormat();
            _local_3.align = TextFormatAlign.CENTER;
            _local_3.leading = _arg_2;
            k.setTextFormat(_local_3);
        }

        private function _Str_7955():void
        {
            var k:IWindow;
            var _local_2:ITextWindow;
            if (_window)
            {
                k = _window.findChildByName("vip_link");
                if (k)
                {
                    k.addEventListener(WindowMouseEvent.CLICK, this._Str_17250);
                    k.mouseThreshold = 0;
                }
                _local_2 = (_window.findChildByName("hccenter_link") as ITextWindow);
                if (((_local_2) && (this._controller)))
                {
                    _local_2.text = this._controller.localization.getLocalization("catalog.vip.buy.hccenter", "catalog.vip.buy.hccenter");
                    this._Str_10740(_local_2);
                }
            }
        }

        private function _Str_10740(k:ITextWindow):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:StyleSheet = new StyleSheet();
            var _local_3:Object = new Object();
            _local_3.textDecoration = "underline";
            _local_2.setStyle("a:link", _local_3);
            k.styleSheet = _local_2;
        }

        public function _Str_17250(k:WindowMouseEvent):void
        {
            this._catalog.utils.showVipBenefits();
        }

        public function _Str_6059(offer:ClubBuyOfferData):void
        {
            var item:ClubOffer;
            if (((disposed) || (!(offer.vip))))
            {
                return;
            }
            Logger.log(("Offer: " + [offer.offerId, offer.productCode, offer.priceCredits, offer.vip, offer.months, offer._Str_11224, offer.year, offer.month, offer.day, offer._Str_10047]));
            offer.page = page;
            try
            {
                item = new ClubOffer(offer, this._catalog, ((this._isGift) ? "HabboCatalogGift" : "HabboCatalogBuy"));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("ClubBuyCatalogWidget", (((("showOffer - new ClubBuyItem(" + String(offer)) + ", ") + String((page as CatalogPage))) + ") crashed!"));
                return;
            }
            var target:IItemListWindow = (_window.findChildByName("item_list_vip") as IItemListWindow);
            if (target != null)
            {
                target.addListItem(item.window);
            }
            this._offers.push(item);
        }
    }
}
