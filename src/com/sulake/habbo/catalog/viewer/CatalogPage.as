package com.sulake.habbo.catalog.viewer
{
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
    import com.sulake.habbo.catalog.viewer.widgets.CatalogWidget;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SongDiskProductViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpacesNewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RoomPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.AddOnBadgeViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.NewPetsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RoomAdsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.VipBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.LoyaltyVipBuyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.ActivityPointDisplayCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.MadMoneyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuyGuildCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildBadgeViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.GuildForumSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.PetPreviewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SpinnerCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.TotalPriceCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.LimitedItemCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SoldLtdItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.UserBadgeSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.SimplePriceCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderSubscriptionCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderAddonsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.BuilderLoyaltyCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.WarningCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.FirstProductSelectorCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.FeaturedItemsCatalogWidget;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.events.ProductOfferUpdatedEvent;
    import __AS3__.vec.*;

    public class CatalogPage implements ICatalogPage 
    {
        protected static const LAYOUT_:String = "layout_";
        public static const _Str_2906:int = 0;
        public static const _Str_7035:int = 1;

        protected var _Str_2897:XML;
        private var _window:IWindowContainer;
        private var _viewer:ICatalogViewer;
        private var _Str_2709:int;
        private var _layoutCode:String;
        private var _offers:Vector.<IPurchasableOffer>;
        private var _localization:IPageLocalization;
        private var _Str_2413:Array;
        private var _Str_5564:EventDispatcherWrapper;
        private var _habboCatalog:HabboCatalog;
        private var _Str_23068:int;
        private var _Str_11744:ItemGridCatalogWidget;
        private var _acceptSeasonCurrencyAsCredits:Boolean;
        private var _mode:int;

        public function CatalogPage(k:ICatalogViewer, _arg_2:int, _arg_3:String, _arg_4:IPageLocalization, _arg_5:Vector.<IPurchasableOffer>, _arg_6:HabboCatalog, _arg_7:Boolean, _arg_8:int=-1)
        {
            var _local_9:IPurchasableOffer;
            this._Str_2413 = [];
            super();
            this._viewer = k;
            this._Str_2709 = _arg_2;
            this._layoutCode = _arg_3;
            this._localization = _arg_4;
            this._offers = _arg_5;
            this._habboCatalog = _arg_6;
            for each (_local_9 in _arg_5)
            {
                _local_9.page = this;
            }
            this._Str_5564 = new EventDispatcherWrapper();
            this._Str_2413 = new Array();
            this._acceptSeasonCurrencyAsCredits = _arg_7;
            if (_arg_8 == -1)
            {
                this._mode = _Str_2906;
            }
            else
            {
                this._mode = _arg_8;
            }
            this.init();
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get viewer():ICatalogViewer
        {
            return this._viewer;
        }

        public function get pageId():int
        {
            return (this._mode == _Str_7035) ? CatalogNavigator._Str_5778 : this._Str_2709;
        }

        public function get layoutCode():String
        {
            return this._layoutCode;
        }

        public function get offers():Vector.<IPurchasableOffer>
        {
            return this._offers;
        }

        public function get localization():IPageLocalization
        {
            return this._localization;
        }

        public function get links():Array
        {
            return this._localization._Str_20312(this._layoutCode);
        }

        public function get hasLinks():Boolean
        {
            return this._localization.hasLinks(this._layoutCode);
        }

        public function get acceptSeasonCurrencyAsCredits():Boolean
        {
            return this._acceptSeasonCurrencyAsCredits;
        }

        public function get _Str_21031():Boolean
        {
            return !(this._layoutCode == "sold_ltd_items");
        }

        public function set _Str_22520(k:int):void
        {
            this._Str_23068 = k;
        }

        public function get mode():int
        {
            return this._mode;
        }

        public function get _Str_21286():Boolean
        {
            return this._habboCatalog.catalogType == CatalogType.BUILDER;
        }

        public function selectOffer(k:int):void
        {
            var _local_2:IPurchasableOffer;
            var _local_3:IGridItem;
            var _local_4:ITextFieldWindow;
            if (((!(this._Str_11744 == null)) && (k > -1)))
            {
                Logger.log(("selecting offer " + k));
                for each (_local_2 in this._offers)
                {
                    if (_local_2.offerId == k)
                    {
                        _local_3 = _local_2.gridItem;
                        this._Str_11744.select(_local_3, true);
                    }
                }
            }
            if (((this._window) && (!(this._window.findChildByName(CatalogWidgetEnum.TROPHY) == null))))
            {
                _local_4 = (this._window.findChildByName("input_text") as ITextFieldWindow);
                _local_4.focus();
                _local_4.activate();
            }
        }

        public function dispose():void
        {
            var k:CatalogWidget;
            var _local_2:IPurchasableOffer;
            for each (k in this._Str_2413)
            {
                k.dispose();
            }
            this._Str_2413 = null;
            this._localization.dispose();
            for each (_local_2 in this._offers)
            {
                _local_2.dispose();
            }
            this._offers = new Vector.<IPurchasableOffer>(0);
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_5564 != null)
            {
                this._Str_5564.dispose();
                this._Str_5564 = null;
            }
            this._viewer = null;
            this._Str_2897 = null;
            this._Str_2709 = 0;
            this._layoutCode = "";
            this._acceptSeasonCurrencyAsCredits = false;
        }

        public function init():void
        {
            if (this.createWindow(this.layoutCode))
            {
                this._Str_22448();
            }
        }

        public function closed():void
        {
            var k:CatalogWidget;
            if (this._Str_2413 != null)
            {
                for each (k in this._Str_2413)
                {
                    k.closed();
                }
            }
        }

        protected function createWindow(k:String):Boolean
        {
            if (k == "frontpage4")
            {
                k = "frontpage_featured";
            }
            var _local_2:String = (LAYOUT_ + k);
            if (this._viewer._Str_20991.indexOf("UBUNTU") > -1)
            {
                if (!this.viewer.catalog.assets.hasAsset(_local_2))
                {
                    _local_2 = ("old_" + _local_2);
                }
            }
            else
            {
                _local_2 = ("old_" + _local_2);
            }
            var _local_3:XmlAsset = (this.viewer.catalog.assets.getAssetByName(_local_2) as XmlAsset);
            if (_local_3 == null)
            {
                Logger.log(("Could not find asset for layout " + _local_2));
                return false;
            }
            this._Str_2897 = (_local_3.content as XML);
            this._window = (this.viewer.catalog.windowManager.buildFromXML(this._Str_2897) as IWindowContainer);
            if (this._window == null)
            {
                Logger.log(("Could not create layout " + k));
                return false;
            }
            return true;
        }

        private function _Str_19940():void
        {
        }

        private function _Str_22448():void
        {
            this._Str_20303(this._window);
            this._Str_25518();
        }

        private function _Str_20303(k:IWindowContainer):void
        {
            var _local_2:int;
            var _local_3:IWindowContainer;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.numChildren)
                {
                    _local_3 = (k.getChildAt(_local_2) as IWindowContainer);
                    if (_local_3 != null)
                    {
                        this._Str_2548(_local_3);
                        this._Str_20303(_local_3);
                    }
                    _local_2++;
                }
            }
        }

        private function _Str_2548(k:IWindowContainer):void
        {
            if (k == null)
            {
                return;
            }
            switch (k.name)
            {
                case CatalogWidgetEnum.ITEM_GRID:
                    if (this._Str_11744 == null)
                    {
                        this._Str_11744 = new ItemGridCatalogWidget(k, this._habboCatalog.sessionDataManager, this._habboCatalog.catalogType);
                        this._Str_2413.push(this._Str_11744);
                    }
                    return;
                case CatalogWidgetEnum.PRODUCT_VIEW:
                    this._Str_2413.push(new ProductViewCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.SONG_DISK_PRODUCT_VIEW:
                    this._Str_2413.push(new SongDiskProductViewCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.SINGLE_VIEW:
                    this._Str_2413.push(new SingleViewCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.PURCHASE:
                    this._Str_2413.push(new PurchaseCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.COLOUR_GRID:
                    this._Str_2413.push(new ColourGridCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.TRAX_PREVIEW:
                    this._Str_2413.push(new TraxPreviewCatalogWidget(k, this._habboCatalog.soundManager));
                    return;
                case CatalogWidgetEnum.REDEEM_ITEM_CODE:
                    this._Str_2413.push(new RedeemItemCodeCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.SPACES_NEW:
                    this._Str_2413.push(new SpacesNewCatalogWidget(k, this._habboCatalog.sessionDataManager, this._habboCatalog.catalogType));
                    return;
                case CatalogWidgetEnum.ROOM_PREVIEW:
                    this._Str_2413.push(new RoomPreviewCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.TROPHY:
                    this._Str_2413.push(new TrophyCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.ADD_ON_BADGE_VIEW:
                    this._Str_2413.push(new AddOnBadgeViewCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.PETS:
                    this._Str_2413.push(new PetsCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.NEW_PETS:
                    this._Str_2413.push(new NewPetsCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.ROOM_ADS:
                    this._Str_2413.push(new RoomAdsCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.TEXT_INPUT:
                    this._Str_2413.push(new TextInputCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.SPECIAL_INFO:
                    this._Str_2413.push(new SpecialInfoCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.RECYCLER:
                    this._Str_2413.push(new RecyclerCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.RECYCLER_PRIZES:
                    this._Str_2413.push(new RecyclerPrizesCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.MARKET_PLACE:
                    this._Str_2413.push(new MarketPlaceCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.MARKET_PLACE_OWN_ITEMS:
                    this._Str_2413.push(new MarketPlaceOwnItemsCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.CLUB_GIFT:
                    this._Str_2413.push(new ClubGiftWidget(k, this._habboCatalog._Str_24953(), this._habboCatalog));
                    return;
                case CatalogWidgetEnum.CLUB_BUY:
                    this._Str_2413.push(new ClubBuyCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.VIP_BUY:
                    this._Str_2413.push(new VipBuyCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.LOYALTY_VIP_BUY:
                    this._Str_2413.push(new LoyaltyVipBuyCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.VIP_GIFT:
                    this._Str_2413.push(new VipBuyCatalogWidget(k, this._habboCatalog, true));
                    return;
                case CatalogWidgetEnum.ACTIVITY_POINT_DISPLAY:
                    this._Str_2413.push(new ActivityPointDisplayCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.MAD_MONEY:
                    this._Str_2413.push(new MadMoneyCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.BUY_GUILD:
                    this._Str_2413.push(new BuyGuildCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.GUILD_BADGE_VIEW:
                    this._Str_2413.push(new GuildBadgeViewCatalogWidget(k, this._habboCatalog._Str_16509()));
                    return;
                case CatalogWidgetEnum.GUILD_SELECTOR:
                    this._Str_2413.push(new GuildSelectorCatalogWidget(k, this._habboCatalog._Str_16509()));
                    return;
                case CatalogWidgetEnum.GUILD_FORUM_SELECTOR:
                    this._Str_2413.push(new GuildForumSelectorCatalogWidget(k, this._habboCatalog._Str_16509()));
                    return;
                case CatalogWidgetEnum.PET_PREVIEW:
                    this._Str_2413.push(new PetPreviewCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.SPINNER:
                    this._Str_2413.push(new SpinnerCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUNDLE_PURCHASE_EXTRA_INFO:
                    this._Str_2413.push(new BundlePurchaseExtraInfoCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.TOTAL_PRICE:
                    this._Str_2413.push(new TotalPriceCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.LIMITED_ITEM:
                    this._Str_2413.push(new LimitedItemCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.SOLD_LTD_ITEMS:
                    this._Str_2413.push(new SoldLtdItemsCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.USER_BADGE_SELECTOR:
                    this._Str_2413.push(new UserBadgeSelectorCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUILDER_GRID_SCROLL:
                    this._Str_2413.push(new BundleGridViewCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.SIMPLE_PRICE:
                    this._Str_2413.push(new SimplePriceCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUILDER:
                    this._Str_2413.push(new BuilderCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUILDER_SUBSCRIPTION:
                    this._Str_2413.push(new BuilderSubscriptionCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUILDER_ADDONS:
                    this._Str_2413.push(new BuilderAddonsCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.BUILDER_LOYALTY:
                    this._Str_2413.push(new BuilderLoyaltyCatalogWidget(k, this._habboCatalog));
                    return;
                case CatalogWidgetEnum.WARNING:
                    this._Str_2413.push(new WarningCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.FIRST_PRODUCT_AUTO_SELECTOR:
                    this._Str_2413.push(new FirstProductSelectorCatalogWidget(k));
                    return;
                case CatalogWidgetEnum.FEATURED_ITEMS:
                    this._Str_2413.push(new FeaturedItemsCatalogWidget(k, this._habboCatalog));
                    return;
            }
        }

        private function _Str_25518():void
        {
            var k:CatalogWidget;
            var _local_3:ColourGridCatalogWidget;
            var _local_4:ItemGridCatalogWidget;
            var _local_5:IWindowContainer;
            var _local_6:int;
            var _local_7:IWindowContainer;
            var _local_2:Array = [];
            if (this._layoutCode == "default_3x3_color_grouping")
            {
                _local_5 = (this._window.findChildByName("itemGridWidget") as IWindowContainer);
                _local_6 = 3;
                _local_5.height = (104 - _local_6);
                _local_7 = (this._window.findChildByName("colourGridWidget") as IWindowContainer);
                _local_7.visible = true;
                _local_7.width = 360;
                _local_7.x = _local_5.x;
                _local_7.y = ((_local_5.y + _local_5.height) + _local_6);
                _local_7.height = 51;
                _local_3 = new ColourGridCatalogWidget(_local_7);
                this._Str_2413.push(_local_3);
            }
            for each (k in this._Str_2413)
            {
                k.page = this;
                if ((k is ItemGridCatalogWidget))
                {
                    _local_4 = (k as ItemGridCatalogWidget);
                }
                k.events = this._Str_5564;
                if (!k.init())
                {
                    _local_2.push(k);
                }
            }
            this._Str_24047(_local_2);
            this._Str_16817();
            this._Str_5564.dispatchEvent(new _Str_3308(CatalogWidgetEvent.WIDGETS_INITIALIZED));
        }

        private function _Str_16817():void
        {
            var k:CatalogWidget = new LocalizationCatalogWidget(this._window, this._habboCatalog);
            this._Str_2413.push(k);
            k.page = this;
            k.events = this._Str_5564;
            k.init();
        }

        private function _Str_24047(k:Array):void
        {
            var _local_2:CatalogWidget;
            var _local_3:CatalogWidget;
            var _local_4:int;
            if (((k == null) || (k.length == 0)))
            {
                return;
            }
            for each (_local_2 in this._Str_2413)
            {
                if (_local_2.window != null)
                {
                    for each (_local_3 in k)
                    {
                        if (_local_3.window != null)
                        {
                            if (_local_3.window.getChildIndex(_local_2.window) >= 0)
                            {
                                if (k.indexOf(_local_2) < 0)
                                {
                                    k.push(_local_2);
                                }
                                break;
                            }
                        }
                    }
                }
            }
            for each (_local_3 in k)
            {
                if (_local_3.window != null)
                {
                    this._window.removeChild(_local_3.window);
                    _local_3.window.dispose();
                }
                _local_4 = this._Str_2413.indexOf(_local_3);
                if (_local_4 >= 0)
                {
                    this._Str_2413.splice(_local_4, 1);
                }
                _local_3.dispose();
            }
        }

        public function dispatchWidgetEvent(k:Event):Boolean
        {
            if (this._Str_5564 != null)
            {
                return this._Str_5564.dispatchEvent(k);
            }
            return false;
        }

        public function replaceOffers(k:Vector.<IPurchasableOffer>, _arg_2:Boolean=false):void
        {
            var _local_3:IPurchasableOffer;
            if (_arg_2)
            {
                for each (_local_3 in this._offers)
                {
                    _local_3.dispose();
                }
            }
            this._offers = k;
        }

        public function _Str_19621(k:int, _arg_2:int):void
        {
            var _local_3:IPurchasableOffer;
            for each (_local_3 in this._offers)
            {
                if (_local_3.offerId == k)
                {
                    _local_3.product.uniqueLimitedItemsLeft = _arg_2;
                    this._Str_5564.dispatchEvent(new ProductOfferUpdatedEvent(_local_3));
                    return;
                }
            }
        }
    }
}
