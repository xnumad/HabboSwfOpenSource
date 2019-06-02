package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferState;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.marketplace.IMarketPlace;
    import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_3353;
    import com.sulake.habbo.window.widgets._Str_3083;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class MarketPlaceOwnItemsCatalogWidget extends CatalogWidget implements IGetImageListener, IMarketPlaceVisualization 
    {
        private const _Str_11360:int = 1;
        private const _Str_10266:int = 2;

        private var _itemTemplates:Map;
        private var _itemList:IItemListWindow;
        private var _offers:Map;

        public function MarketPlaceOwnItemsCatalogWidget(k:IWindowContainer)
        {
            super(k);
            this._itemTemplates = new Map();
        }

        override public function dispose():void
        {
            super.dispose();
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
            var k:IHabboWindowManager = this._Str_2552.windowManager;
            if (k == null)
            {
                return false;
            }
            this.displayMainView();
            var _local_2:IItemListWindow = (_window.findChildByName("item_list") as IItemListWindow);
            this._itemTemplates.add(MarketPlaceOfferState._Str_15376, _local_2.removeListItem(_local_2.getListItemByName("ongoing_item")));
            this._itemTemplates.add(MarketPlaceOfferState._Str_8295, _local_2.removeListItem(_local_2.getListItemByName("sold_item")));
            this._itemTemplates.add(MarketPlaceOfferState._Str_6495, _local_2.removeListItem(_local_2.getListItemByName("expired_item")));
            this._Str_2552.registerVisualization(this);
            this._Str_2552.requestOwnItems();
            this._Str_10239(this._Str_11360);
            this._Str_21553(false);
            return true;
        }

        private function _Str_21553(k:Boolean):void
        {
            if (!window)
            {
                return;
            }
            var _local_2:IWindowContainer = (window.findChildByName("redeem_border") as IWindowContainer);
            if (_local_2)
            {
                _local_2.visible = k;
            }
        }

        public function listUpdatedNotify():void
        {
            if (this._Str_2552 == null)
            {
                return;
            }
            this._Str_11855(this._Str_2552.latestOwnOffers());
        }

        private function _Str_10239(k:int, _arg_2:int=-1):void
        {
            var _local_5:String;
            if (((!(this._Str_2552)) || (!(window))))
            {
                return;
            }
            var _local_3:IHabboLocalizationManager = this._Str_2552.localization;
            if (!_local_3)
            {
                return;
            }
            var _local_4:IWindow = window.findChildByName("status_text");
            if (_local_4 == null)
            {
                return;
            }
            if (k == this._Str_11360)
            {
                _local_5 = _local_3.getLocalization("catalog.marketplace.searching");
            }
            else
            {
                if (this._Str_10266)
                {
                    if (_arg_2 > 0)
                    {
                        _local_5 = _local_3.getLocalization("catalog.marketplace.items_found");
                        _local_5 = _local_5.replace("%count%", _arg_2);
                    }
                    else
                    {
                        _local_5 = _local_3.getLocalization("catalog.marketplace.no_items");
                    }
                }
            }
            _local_4.caption = _local_5;
        }

        private function get _Str_2552():IMarketPlace
        {
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.catalog))))
            {
                return null;
            }
            return page.viewer.catalog.getMarketPlace();
        }

        private function _Str_11855(k:Map):void
        {
            var _local_4:IWindowContainer;
            var _local_10:int;
            var _local_11:MarketPlaceOfferData;
            var _local_12:IWindowContainer;
            var _local_13:IWindow;
            var _local_14:IWindow;
            var _local_15:IWindow;
            var _local_16:String;
            var _local_17:IWindow;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:String;
            var _local_22:String;
            var _local_23:IWindow;
            var _local_24:IWindow;
            var _local_25:ImageResult;
            var _local_26:IBitmapWrapperWindow;
            var _local_27:Point;
            var _local_28:IWindow;
            var _local_29:IWidgetWindow;
            var _local_30:_Str_3353;
            var _local_31:IWidgetWindow;
            var _local_32:_Str_3083;
            if ((((!(k)) || (!(this._Str_2552))) || (!(window))))
            {
                return;
            }
            this._offers = k;
            var _local_2:IHabboLocalizationManager = this._Str_2552.localization;
            if (!_local_2)
            {
                return;
            }
            var _local_3:IItemListWindow = (window.findChildByName("item_list") as IItemListWindow);
            if (!_local_3)
            {
                return;
            }
            _local_3.destroyListItems();
            var _local_5:int;
            var _local_6:Array = k.getKeys();
            if (!_local_6)
            {
                return;
            }
            this._Str_10239(this._Str_10266, _local_6.length);
            var _local_7:int;
            while (_local_7 < _local_6.length)
            {
                _local_10 = _local_6[_local_7];
                _local_11 = (k.getValue(_local_10) as MarketPlaceOfferData);
                if (_local_11.status == MarketPlaceOfferState._Str_8295)
                {
                    _local_5++;
                }
                _local_4 = this._itemTemplates.getValue(_local_11.status);
                if (_local_4)
                {
                    _local_12 = (_local_4.clone() as IWindowContainer);
                    if (!((!(_local_12)) || (_local_12.disposed)))
                    {
                        _local_13 = _local_12.findChildByName("item_name");
                        if (_local_13 != null)
                        {
                            _local_13.caption = ((this._Str_2552 != null) ? ((("$" + "{") + this._Str_2552.getNameLocalizationKey(_local_11)) + "}") : "");
                        }
                        _local_14 = _local_12.findChildByName("item_desc");
                        if (_local_14 != null)
                        {
                            _local_14.caption = ((this._Str_2552 != null) ? ((("$" + "{") + this._Str_2552.getDescriptionLocalizationKey(_local_11)) + "}") : "");
                        }
                        _local_15 = _local_12.findChildByName("item_price");
                        if (_local_15 != null)
                        {
                            _local_16 = _local_2.getLocalization("catalog.marketplace.offer.price_own_item");
                            _local_16 = _local_16.replace("%price%", _local_11.price);
                            _local_15.caption = _local_16;
                        }
                        if (_local_11.status == MarketPlaceOfferState._Str_15376)
                        {
                            _local_17 = _local_12.findChildByName("item_time");
                            if (_local_17 != null)
                            {
                                _local_18 = Math.max(1, _local_11._Str_5853);
                                _local_19 = Math.floor((_local_18 / 60));
                                _local_20 = (_local_18 - (_local_19 * 60));
                                _local_21 = ((_local_20 + " ") + _local_2.getLocalization("catalog.marketplace.offer.minutes"));
                                if (_local_19 > 0)
                                {
                                    _local_21 = ((((_local_19 + " ") + _local_2.getLocalization("catalog.marketplace.offer.hours")) + " ") + _local_21);
                                }
                                _local_22 = _local_2.getLocalization("catalog.marketplace.offer.time_left");
                                _local_22 = _local_22.replace("%time%", _local_21);
                                _local_17.caption = _local_22;
                            }
                        }
                        if (_local_11.status == MarketPlaceOfferState._Str_8295)
                        {
                            _local_23 = _local_12.findChildByName("item_sold");
                            if (_local_23 != null)
                            {
                                _local_23.caption = _local_2.getLocalization("catalog.marketplace.offer.sold");
                            }
                        }
                        if (_local_11.status == MarketPlaceOfferState._Str_6495)
                        {
                            _local_24 = _local_12.findChildByName("item_expired");
                            if (_local_24 != null)
                            {
                                _local_24.caption = _local_2.getLocalization("catalog.marketplace.offer.expired");
                            }
                        }
                        if (_local_11.image == null)
                        {
                            _local_25 = this._Str_6819(_local_11.furniId, _local_11.furniType, _local_11.extraData);
                            if (((!(_local_25 == null)) && (!(_local_25.data == null))))
                            {
                                _local_11.image = (_local_25.data as BitmapData);
                                _local_11._Str_4774 = _local_25.id;
                                _local_12.id = _local_25.id;
                            }
                        }
                        if (_local_11.image != null)
                        {
                            _local_26 = (_local_12.findChildByName("item_image") as IBitmapWrapperWindow);
                            if (_local_26 != null)
                            {
                                _local_27 = new Point(((_local_26.width - _local_11.image.width) / 2), ((_local_26.height - _local_11.image.height) / 2));
                                if (_local_26.bitmap == null)
                                {
                                    _local_26.bitmap = new BitmapData(_local_26.width, _local_26.height, true, 0);
                                }
                                _local_26.bitmap.copyPixels(_local_11.image, _local_11.image.rect, _local_27);
                            }
                        }
                        if (_local_11.isUniqueLimitedItem)
                        {
                            _local_28 = _local_12.findChildByName("unique_item_background_bitmap");
                            _local_29 = IWidgetWindow(_local_12.findChildByName("unique_item_overlay_widget"));
                            _local_30 = _Str_3353(_local_29.widget);
                            _local_30._Str_3442 = _local_11.stuffData.uniqueSerialNumber;
                            _local_30.animated = true;
                            _local_28.visible = true;
                            _local_29.visible = true;
                        }
                        if (((_local_11.stuffData) && (_local_11.stuffData.rarityLevel >= 0)))
                        {
                            _local_31 = IWidgetWindow(_local_12.findChildByName("rarity_item_overlay_widget"));
                            _local_32 = _Str_3083(_local_31.widget);
                            _local_31.visible = true;
                            _local_32.rarityLevel = _local_11.stuffData.rarityLevel;
                        }
                        _local_3.addListItem(_local_12);
                        _local_12.procedure = this._Str_23504;
                    }
                }
                _local_7++;
            }
            this._Str_21553(true);
            var _local_8:IButtonWindow = (window.findChildByName("redeem_sold") as IButtonWindow);
            var _local_9:IWindow = window.findChildByName("redeem_info");
            if (((_local_8) && (_local_9)))
            {
                if (_local_5 > 0)
                {
                    _local_8.enable();
                    _local_2.registerParameter("catalog.marketplace.redeem.get_credits", "count", _local_5.toString());
                    _local_2.registerParameter("catalog.marketplace.redeem.get_credits", "credits", this._Str_2552.creditsWaiting.toString());
                    _local_9.caption = ("$" + "{catalog.marketplace.redeem.get_credits}");
                }
                else
                {
                    _local_8.disable();
                    _local_9.caption = ("$" + "{catalog.marketplace.redeem.no_sold_items}");
                }
            }
        }

        public function displayMainView():void
        {
            _Str_2819(CatalogWidgetEnum.MARKET_PLACE_OWN_ITEMS);
            window.procedure = this._Str_17366;
            this._itemList = (window.findChildByName("item_list") as IItemListWindow);
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

        private function _Str_23504(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:IItemListWindow;
            var _local_4:int;
            var _local_5:Map;
            var _local_6:MarketPlaceOfferData;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if ((((!(this._Str_2552)) || (!(_arg_2))) || (!(window))))
                {
                    return;
                }
                if (_arg_2.name == "pick_button")
                {
                    _local_3 = (window.findChildByName("item_list") as IItemListWindow);
                    if (_local_3 == null)
                    {
                        return;
                    }
                    _local_4 = _local_3.getListItemIndex(k.window.parent);
                    _local_5 = this._Str_2552.latestOwnOffers();
                    if (!_local_5)
                    {
                        return;
                    }
                    _local_6 = (_local_5.getWithIndex(_local_4) as MarketPlaceOfferData);
                    if (_local_6)
                    {
                        this._Str_2552.redeemExpiredOffer(_local_6.offerId);
                    }
                }
            }
        }

        private function _Str_17366(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2 == null)
            {
                _arg_2 = (k.target as IWindow);
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "redeem_sold":
                        if (this._Str_2552)
                        {
                            this._Str_2552.redeemSoldOffers();
                        }
                        return;
                }
            }
        }

        public function updateStats():void
        {
        }
    }
}
