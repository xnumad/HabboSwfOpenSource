package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.core.utils.Map;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.marketplace.MarketplaceChart;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.marketplace.MarketplaceItemStats;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.room.ImageResult;
    import flash.geom.Point;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_3353;
    import com.sulake.habbo.window.widgets._Str_3083;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.widgets._Str_3338;
    import flash.geom.Matrix;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class MarketPlaceCatalogWidget extends CatalogWidget implements IGetImageListener, IMarketPlaceVisualization 
    {
        private const _Str_11360:int = 1;
        private const _Str_10266:int = 2;
        private const _Str_25315:int = 40;
        private const _Str_22318:int = 10;

        private var _sortTypes:Array;
        private var _selectedOffer:MarketPlaceOfferData;
        private var _itemList:IItemListWindow;
        private var _listItemBase:IWindowContainer;
        private var _populationTimer:Timer;
        private var _offers:Map;
        private var _populationIndex:int;

        public function MarketPlaceCatalogWidget(k:IWindowContainer)
        {
            this._sortTypes = [];
            super(k);
        }

        override public function dispose():void
        {
            super.dispose();
            this._selectedOffer = null;
            this._offers = null;
            this._itemList = null;
            if (this._listItemBase)
            {
                this._listItemBase.dispose();
                this._listItemBase = null;
            }
            if (this._populationTimer)
            {
                this._populationTimer.removeEventListener(TimerEvent.TIMER, this._Str_21007);
                this._populationTimer = null;
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            if (this._Str_2552 == null)
            {
                return false;
            }
            this._Str_2552.registerVisualization(this);
            this.displayMainView();
            var k:IItemListWindow = (_window.findChildByName("offer_list") as IItemListWindow);
            this._listItemBase = (k.removeListItem(k.getListItemByName("offer_item")) as IWindowContainer);
            return true;
        }

        public function listUpdatedNotify():void
        {
            this._Str_22046();
            this._Str_11855();
        }

        public function updateStats():void
        {
            var _local_6:MarketplaceChart;
            var _local_9:BitmapData;
            var _local_10:String;
            if ((((!(this._Str_2552)) || (!(this._Str_2552.localization))) || (!(_window))))
            {
                return;
            }
            var k:MarketplaceItemStats = this._Str_2552._Str_10038;
            if (!k)
            {
                return;
            }
            var _local_2:IWindowContainer = (_window.findChildByName("details_container") as IWindowContainer);
            if (((!(_local_2)) || (!(_local_2.visible))))
            {
                return;
            }
            var _local_3:IWindow = _local_2.findChildByName("offer_count");
            if (_local_3)
            {
                this._Str_2552.localization.registerParameter("catalog.marketplace.offer_details.offer_count", "count", k._Str_4121.toString());
                _local_3.visible = true;
            }
            var _local_4:ISelectorWindow = (_local_2.findChildByName("chart_selector") as ISelectorWindow);
            if (!_local_4)
            {
                return;
            }
            var _local_5:ISelectableWindow = _local_4.getSelected();
            if (!_local_5)
            {
                return;
            }
            switch (_local_5.name)
            {
                case "price_development":
                    _local_6 = new MarketplaceChart(k._Str_9174, k._Str_11365);
                    break;
                case "trade_volume":
                    _local_6 = new MarketplaceChart(k._Str_9174, k._Str_11956);
                    break;
                default:
                    return;
            }
            if (!_local_6)
            {
                return;
            }
            var _local_7:IBitmapWrapperWindow = (_local_2.findChildByName("chart_bitmap") as IBitmapWrapperWindow);
            if (_local_7)
            {
                _local_7.bitmap = null;
                _local_7.bitmap = new BitmapData(_local_7.width, _local_7.height);
                _local_9 = _local_6.draw(_local_7.width, _local_7.height);
                _local_7.bitmap.draw(_local_9);
                _local_9.dispose();
            }
            var _local_8:IWindow = _local_2.findChildByName("chart_title");
            if (_local_8)
            {
                if (_local_6.available)
                {
                    _local_10 = ("catalog.marketplace.offer_details.chart_title." + _local_5.name);
                    this._Str_2552.localization.registerParameter(_local_10, "days", k._Str_10461.toString());
                }
                else
                {
                    _local_10 = "catalog.marketplace.offer_details.chart_title.not_available";
                }
                _local_8.caption = this._Str_2552.localization.getLocalization(_local_10);
            }
        }

        private function get _Str_2552():IMarketPlace
        {
            if ((((page) && (page.viewer)) && (page.viewer.catalog)))
            {
                return page.viewer.catalog.getMarketPlace();
            }
            return null;
        }

        public function displayMainView():void
        {
            _Str_2819(CatalogWidgetEnum.MARKET_PLACE);
            window.procedure = this._Str_17366;
            this._itemList = (window.findChildByName("offer_list") as IItemListWindow);
            this._Str_19529("search_by_activity");
        }

        private function _Str_19529(k:String):void
        {
            var _local_5:String;
            var _local_2:ISelectorWindow = (_window.findChildByName("search_selector") as ISelectorWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:ISelectableWindow = _local_2.getSelectableByName(k);
            if (_local_3 == null)
            {
                return;
            }
            _local_2.setSelected(_local_3);
            var _local_4:IWindowContainer = (_window.findChildByName("search_container") as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            while (_local_4.numChildren > 0)
            {
                _local_4.removeChildAt(0);
            }
            switch (k)
            {
                case "search_by_value":
                    _local_5 = "marketplace_search_simple";
                    this._sortTypes = [1, 2];
                    break;
                case "search_by_activity":
                    _local_5 = "marketplace_search_simple";
                    this._sortTypes = [3, 4, 5, 6];
                    break;
                case "search_advanced":
                    _local_5 = "marketplace_search_advanced";
                    this._sortTypes = [1, 2, 3, 4, 5, 6];
                    break;
                default:
                    return;
            }
            var _local_6:IWindowContainer = (this.createWindow(_local_5) as IWindowContainer);
            _local_4.addChild(_local_6);
            var _local_7:IDropMenuWindow = (_window.findChildByName("sort_dropmenu") as IDropMenuWindow);
            if (_local_7 != null)
            {
                _local_7.populate(this._Str_24972(this._sortTypes));
                _local_7.selection = 0;
            }
        }

        private function _Str_24972(k:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = [];
            for each (_local_3 in k)
            {
                _local_2.push(((("$" + "{catalog.marketplace.sort.") + _local_3) + "}"));
            }
            return _local_2;
        }

        private function createWindow(k:String):IWindow
        {
            if ((((((!(page)) || (!(page.viewer))) || (!(page.viewer.catalog))) || (!(page.viewer.catalog.assets))) || (!(page.viewer.catalog.windowManager))))
            {
                return null;
            }
            var _local_2:XmlAsset = (page.viewer.catalog.assets.getAssetByName(k) as XmlAsset);
            if (((!(_local_2)) || (!(_local_2.content))))
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (!_local_3)
            {
                return null;
            }
            return page.viewer.catalog.windowManager.buildFromXML(_local_3);
        }

        private function _Str_10239(k:int, _arg_2:int=-1, _arg_3:int=-1):void
        {
            var _local_6:String;
            var _local_4:IHabboLocalizationManager = this._Str_2552.localization;
            if (!_local_4)
            {
                return;
            }
            if (((((!(window)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))))
            {
                return;
            }
            var _local_5:IWindow = window.findChildByName("status_text");
            if (_local_5 == null)
            {
                return;
            }
            if (k == this._Str_11360)
            {
                _local_6 = _local_4.getLocalization("catalog.marketplace.searching");
            }
            else
            {
                if (this._Str_10266)
                {
                    if (_arg_3 > 0)
                    {
                        _local_6 = _local_4.getLocalization("catalog.marketplace.items_found");
                        _local_6 = _local_6.replace("%count%", _arg_3);
                        if (((_arg_2 > 0) && (_arg_2 < _arg_3)))
                        {
                            _local_6 = (_local_6 + ((". " + _local_4.getLocalization("catalog.marketplace.items_shown")) + "."));
                            _local_6 = _local_6.replace("%count%", _arg_2);
                        }
                    }
                    else
                    {
                        _local_6 = _local_4.getLocalization("catalog.marketplace.no_items");
                    }
                }
            }
            _local_5.caption = _local_6;
        }

        private function _Str_11855():void
        {
            if (((!(this._Str_2552)) || (!(window))))
            {
                return;
            }
            var k:Map = this._Str_2552.latestOffers();
            if (!k)
            {
                return;
            }
            var _local_2:int = this._Str_2552.totalItemsFound();
            this._offers = k;
            if (!this._itemList)
            {
                return;
            }
            this._itemList.destroyListItems();
            if (!this._listItemBase)
            {
                return;
            }
            var _local_3:Array = k.getKeys();
            if (_local_3 == null)
            {
                return;
            }
            this._Str_10239(this._Str_10266, _local_3.length, _local_2);
            if (!this._populationTimer)
            {
                this._populationTimer = new Timer(25);
                this._populationTimer.addEventListener(TimerEvent.TIMER, this._Str_21007);
            }
            this._populationIndex = 0;
            this._Str_21752();
            this._populationTimer.start();
        }

        private function _Str_21007(k:TimerEvent):void
        {
            if (!this._populationTimer)
            {
                return;
            }
            if (this._Str_21752())
            {
                this._populationTimer.stop();
            }
        }

        private function _Str_21752():Boolean
        {
            if (!this._offers)
            {
                return true;
            }
            var k:int;
            while (k < 5)
            {
                if (this._populationIndex >= this._offers.length)
                {
                    return true;
                }
                this.addListItem(this._offers.getWithIndex(this._populationIndex));
                this._populationIndex++;
                k++;
            }
            return false;
        }

        private function addListItem(k:MarketPlaceOfferData):void
        {
            var _local_7:String;
            var _local_8:String;
            var _local_9:ImageResult;
            var _local_10:IBitmapWrapperWindow;
            var _local_11:Point;
            var _local_12:IWindow;
            var _local_13:IWidgetWindow;
            var _local_14:_Str_3353;
            var _local_15:IWidgetWindow;
            var _local_16:_Str_3083;
            var _local_17:IWindow;
            if (((((!(k)) || (!(this._itemList))) || (!(this._listItemBase))) || (!(this._Str_2552.localization))))
            {
                return;
            }
            var _local_2:IWindowContainer = (this._listItemBase.clone() as IWindowContainer);
            if (((!(_local_2)) || (_local_2.disposed)))
            {
                return;
            }
            var _local_3:IWindow = _local_2.findChildByName("item_name");
            if (_local_3 != null)
            {
                _local_3.caption = ((("$" + "{") + this._Str_2552.getNameLocalizationKey(k)) + "}");
            }
            var _local_4:IWindow = _local_2.findChildByName("item_desc");
            if (_local_4 != null)
            {
                _local_4.caption = ((("$" + "{") + this._Str_2552.getDescriptionLocalizationKey(k)) + "}");
            }
            var _local_5:IWindow = _local_2.findChildByName("item_price");
            if (_local_5 != null)
            {
                _local_7 = this._Str_2552.localization.getLocalization("catalog.marketplace.offer.price_public_item");
                _local_7 = _local_7.replace("%price%", k.price);
                _local_7 = _local_7.replace("%average%", ((k._Str_3925 != 0) ? k._Str_3925.toString() : " - "));
                _local_5.caption = _local_7;
            }
            var _local_6:IWindow = _local_2.findChildByName("offer_count");
            if (_local_6)
            {
                _local_8 = this._Str_2552.localization.getLocalization("catalog.marketplace.offer_count");
                _local_8 = _local_8.replace("%count%", k._Str_4121);
                _local_6.caption = _local_8;
            }
            if (k.image == null)
            {
                _local_9 = this._Str_6819(k.furniId, k.furniType, k.extraData);
                if (((!(_local_9 == null)) && (!(_local_9.data == null))))
                {
                    k.image = (_local_9.data as BitmapData);
                    k._Str_4774 = _local_9.id;
                }
                _local_2.id = _local_9.id;
            }
            if (k.image != null)
            {
                _local_10 = (_local_2.findChildByName("item_image") as IBitmapWrapperWindow);
                if (_local_10 != null)
                {
                    _local_11 = new Point(((_local_10.width - k.image.width) / 2), ((_local_10.height - k.image.height) / 2));
                    if (_local_10.bitmap == null)
                    {
                        _local_10.bitmap = new BitmapData(_local_10.width, _local_10.height, true, 0);
                    }
                    _local_10.bitmap.copyPixels(k.image, k.image.rect, _local_11);
                }
            }
            if (k.isUniqueLimitedItem)
            {
                _local_12 = _local_2.findChildByName("unique_item_background_bitmap");
                _local_13 = IWidgetWindow(_local_2.findChildByName("unique_item_overlay_widget"));
                _local_14 = _Str_3353(_local_13.widget);
                _local_14._Str_3442 = k.stuffData.uniqueSerialNumber;
                _local_14.animated = true;
                _local_12.visible = true;
                _local_13.visible = true;
            }
            if (((k.stuffData) && (k.stuffData.rarityLevel >= 0)))
            {
                _local_15 = IWidgetWindow(_local_2.findChildByName("rarity_item_overlay_widget"));
                _local_16 = _Str_3083(_local_15.widget);
                _local_15.visible = true;
                _local_16.rarityLevel = k.stuffData.rarityLevel;
            }
            if (this._Str_2552.isAccountSafetyLocked())
            {
                _local_17 = _local_2.findChildByName("buy_button");
                if (_local_17 != null)
                {
                    _local_17.disable();
                }
            }
            this._itemList.addListItem(_local_2);
            _local_2.procedure = this._Str_23334;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_4:IWindowContainer;
            var _local_5:MarketPlaceOfferData;
            var _local_6:IBitmapWrapperWindow;
            var _local_7:Point;
            if ((((((disposed) || (!(this._Str_2552))) || (!(_arg_2))) || (!(this._itemList))) || (!(this._offers))))
            {
                return;
            }
            var _local_3:Array = [];
            if (this._itemList.groupListItemsWithID(k, _local_3))
            {
                for each (_local_4 in _local_3)
                {
                    if (_local_4)
                    {
                        _local_6 = (_local_4.findChildByName("item_image") as IBitmapWrapperWindow);
                        if (_local_6 != null)
                        {
                            _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height, true, 0xFFFFFF);
                            _local_7 = new Point(((_local_6.width - _arg_2.width) / 2), ((_local_6.height - _arg_2.height) / 2));
                            _local_6.bitmap.copyPixels(_arg_2, _arg_2.rect, _local_7, null, null, true);
                        }
                        _local_4.id = 0;
                    }
                }
            }
            for each (_local_5 in this._offers)
            {
                if (_local_5._Str_4774 == k)
                {
                    _local_5._Str_4774 = 0;
                    _local_5.image = _arg_2;
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_6819(k:int, _arg_2:int, _arg_3:String=null):ImageResult
        {
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.roomEngine))))
            {
                return null;
            }
            if (_arg_2 == 1)
            {
                return page.viewer.roomEngine.getFurnitureIcon(k, this);
            }
            if (_arg_2 == 2)
            {
                return page.viewer.roomEngine.getWallItemIcon(k, this, _arg_3);
            }
            return null;
        }

        private function _Str_23334(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:int;
            var _local_4:Map;
            var _local_5:MarketPlaceOfferData;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if ((((!(window)) || (!(this._Str_2552))) || (!(_arg_2))))
                {
                    return;
                }
                if (this._itemList == null)
                {
                    return;
                }
                _local_3 = this._itemList.getListItemIndex(k.window.parent);
                _local_4 = this._Str_2552.latestOffers();
                _local_5 = (_local_4.getWithIndex(_local_3) as MarketPlaceOfferData);
                if (!_local_5)
                {
                    return;
                }
                switch (_arg_2.name)
                {
                    case "buy_button":
                        this._Str_2552.buyOffer(_local_5.offerId);
                        return;
                    case "more_button":
                        this._Str_5386(_local_5);
                        return;
                }
            }
        }

        private function _Str_5386(k:MarketPlaceOfferData):void
        {
            var _local_10:ImageResult;
            var _local_11:IBitmapWrapperWindow;
            var _local_12:_Str_3338;
            var _local_13:_Str_3083;
            var _local_14:IWindow;
            if ((((!(k)) || (!(_window))) || (!(this._Str_2552))))
            {
                return;
            }
            this._selectedOffer = k;
            var _local_2:IHabboLocalizationManager = this._Str_2552.localization;
            if (!_local_2)
            {
                return;
            }
            _window.getChildAt(0).visible = false;
            var _local_3:IWindowContainer = (_window.findChildByName("details_container") as IWindowContainer);
            if (_local_3)
            {
                _local_3.visible = true;
            }
            else
            {
                _local_3 = (this.createWindow("marketplace_offer_details") as IWindowContainer);
                _window.addChild(_local_3);
                _local_3.procedure = this._Str_25254;
            }
            var _local_4:IWindow = _local_3.findChildByName("item_name");
            if (_local_4)
            {
                _local_4.caption = ((("$" + "{") + this._Str_2552.getNameLocalizationKey(k)) + "}");
            }
            _local_4 = _local_3.findChildByName("item_description");
            if (_local_4)
            {
                _local_4.caption = ((("$" + "{") + this._Str_2552.getDescriptionLocalizationKey(k)) + "}");
            }
            _local_4 = _local_3.findChildByName("item_count");
            if (_local_4)
            {
                _local_4.visible = false;
            }
            _local_2.registerParameter("catalog.marketplace.offer_details.price", "price", k.price.toString());
            _local_2.registerParameter("catalog.marketplace.offer_details.average_price", "days", this._Str_2552._Str_5014.toString());
            var _local_5:String = ((k._Str_3925 == 0) ? " - " : k._Str_3925.toString());
            _local_2.registerParameter("catalog.marketplace.offer_details.average_price", "average", _local_5);
            if (k.image == null)
            {
                _local_10 = this._Str_6819(k.furniId, k.furniType, k.extraData);
                if (((!(_local_10 == null)) && (!(_local_10.data == null))))
                {
                    k.image = (_local_10.data as BitmapData);
                    k._Str_4774 = _local_10.id;
                }
            }
            if (k.image != null)
            {
                _local_11 = (_local_3.findChildByName("item_image") as IBitmapWrapperWindow);
                if (_local_11 != null)
                {
                    _local_11.bitmap = null;
                    _local_11.bitmap = new BitmapData(_local_11.width, _local_11.height, true, 0);
                    _local_11.bitmap.draw(k.image, new Matrix(1, 0, 0, 1, ((_local_11.width - k.image.width) / 2), ((_local_11.height - k.image.height) / 2)));
                }
            }
            var _local_6:ISelectorWindow = (_local_3.findChildByName("chart_selector") as ISelectorWindow);
            if (_local_6)
            {
                _local_6.setSelected(_local_6.getSelectableAt(0));
            }
            var _local_7:IBitmapWrapperWindow = (_local_3.findChildByName("chart_bitmap") as IBitmapWrapperWindow);
            if (_local_7)
            {
                _local_7.bitmap = null;
            }
            var _local_8:IWidgetWindow = IWidgetWindow(_local_3.findChildByName("unique_item_overlay_widget"));
            if (k.isUniqueLimitedItem)
            {
                _local_12 = _Str_3338(_local_8.widget);
                _local_12._Str_3442 = k.stuffData.uniqueSerialNumber;
                _local_12._Str_4345 = k.stuffData._Str_5330;
                _local_8.visible = true;
            }
            else
            {
                _local_8.visible = false;
            }
            var _local_9:IWidgetWindow = IWidgetWindow(_local_3.findChildByName("rarity_item_overlay_widget"));
            if (((k.stuffData) && (k.stuffData.rarityLevel >= 0)))
            {
                _local_13 = _Str_3083(_local_9.widget);
                _local_9.visible = true;
                _local_13.rarityLevel = k.stuffData.rarityLevel;
            }
            else
            {
                _local_9.visible = false;
            }
            if (this._Str_2552.isAccountSafetyLocked())
            {
                _local_14 = _local_3.findChildByName("buy_button");
                if (_local_14 != null)
                {
                    _local_14.disable();
                }
            }
            this._Str_2552.requestItemStats(k.furniType, k.furniId);
        }

        private function _Str_22046():void
        {
            if (!_window)
            {
                return;
            }
            this._selectedOffer = null;
            var k:IWindow = _window.findChildByName("details_container");
            if (k)
            {
                k.visible = false;
            }
            _window.getChildAt(0).visible = true;
        }

        private function _Str_5312():void
        {
            var _local_5:IWindow;
            this._Str_10239(this._Str_11360);
            var k:int = -1;
            var _local_2:int = -1;
            var _local_3:String = "";
            var _local_4:int = 1;
            _local_5 = _window.findChildByName("min_price_input");
            if (_local_5)
            {
                if (_local_5.caption == "")
                {
                    k = -1;
                }
                else
                {
                    k = parseInt(_local_5.caption);
                }
            }
            _local_5 = _window.findChildByName("max_price_input");
            if (_local_5)
            {
                if (_local_5.caption == "")
                {
                    _local_2 = -1;
                }
                else
                {
                    _local_2 = parseInt(_local_5.caption);
                }
            }
            _local_5 = _window.findChildByName("search_input");
            if (_local_5)
            {
                _local_3 = _local_5.caption;
            }
            var _local_6:IDropMenuWindow = (_window.findChildByName("sort_dropmenu") as IDropMenuWindow);
            if ((((_local_6) && (_local_6.selection >= 0)) && (_local_6.selection < this._sortTypes.length)))
            {
                _local_4 = this._sortTypes[_local_6.selection];
            }
            this._Str_2552.requestOffers(k, _local_2, _local_3, _local_4);
        }

        private function _Str_17366(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_5:ISelectorWindow;
            var _local_6:ISelectableWindow;
            var _local_7:ITextFieldWindow;
            var _local_8:int;
            if ((((!(k)) || (!(_arg_2))) || (!(this._Str_2552))))
            {
                return;
            }
            var _local_3:IHabboLocalizationManager = this._Str_2552.localization;
            var _local_4:IWindow = window.findChildByName("search_input");
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                switch (_arg_2.name)
                {
                    case "sort_dropmenu":
                        _local_5 = (_window.findChildByName("search_selector") as ISelectorWindow);
                        if (!_local_5)
                        {
                            return;
                        }
                        _local_6 = _local_5.getSelected();
                        if (!_local_6)
                        {
                            return;
                        }
                        if (((_local_6.name == "search_by_value") || (_local_6.name == "search_by_activity")))
                        {
                            this._Str_5312();
                        }
                        break;
                    case "search_by_value":
                    case "search_by_activity":
                    case "search_advanced":
                        this._Str_19529(_arg_2.name);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.CLICK)
                {
                    switch (_arg_2.name)
                    {
                        case "search_input":
                            if ((((_local_3) && (_local_4)) && (_local_4.caption == _local_3.getLocalization("catalog.marketplace.search_name"))))
                            {
                                _local_4.caption = "";
                            }
                            break;
                        case "search_button":
                            if ((((_local_3) && (_local_4)) && (_local_4.caption == _local_3.getLocalization("catalog.marketplace.search_name"))))
                            {
                                return;
                            }
                            this._Str_5312();
                            break;
                    }
                }
                else
                {
                    if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
                    {
                        _local_7 = (_arg_2 as ITextFieldWindow);
                        if (!_local_7)
                        {
                            return;
                        }
                        switch (_local_7.name)
                        {
                            case "min_price_input":
                            case "max_price_input":
                                _local_8 = this._Str_22318;
                                break;
                            case "search_input":
                                _local_8 = this._Str_25315;
                                break;
                            default:
                                return;
                        }
                        if (_local_7.text.length > _local_8)
                        {
                            _local_7.text = _local_7.text.substr(0, _local_8);
                        }
                        _local_7.scrollH = 0;
                    }
                }
            }
        }

        private function _Str_25254(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k)) || (!(_arg_2))))
            {
                return;
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "back_button":
                        this._Str_22046();
                        return;
                    case "buy_button":
                        this._Str_2552.buyOffer(this._selectedOffer.offerId);
                        return;
                }
                return;
            }
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                switch (_arg_2.name)
                {
                    case "price_development":
                    case "trade_volume":
                        this.updateStats();
                        return;
                }
            }
        }
    }
}
