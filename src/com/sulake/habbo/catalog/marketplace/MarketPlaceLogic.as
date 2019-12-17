package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_7525;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_4192;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_7697;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_4738;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_7169;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6982;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6344;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6144;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6345;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_5775;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;

    public class MarketPlaceLogic implements IMarketPlace 
    {
        private static const POSTER:String = "poster";

        public const _Str_19658:int = 1;
        public const _Str_22006:int = 2;
        public const _Str_26354:int = 3;

        private var _catalog:HabboCatalog;
        private var _windowManager:IHabboWindowManager;
        private var _roomEngine:IRoomEngine;
        private var _visualization:IMarketPlaceVisualization;
        private var _confirmationDialog:MarketplaceConfirmationDialog;
        private var _latestOffers:Map;
        private var _latestOwnOffers:Map;
        private var _creditsWaiting:int;
        private var _averagePricePeriod:int = -1;
        private var _itemStats:MarketplaceItemStats;
        private var _statsRequestCategoryId:int;
        private var _statsRequestTypeId:int;
        private var _totalItemsFound:int;
        private var _minPrice:int = 0;
        private var _maxPrice:int = 0;
        private var _searchString:String = "";
        private var _sortOrder:int = -1;
        private var _disposed:Boolean = false;

        public function MarketPlaceLogic(k:HabboCatalog, _arg_2:IHabboWindowManager, _arg_3:IRoomEngine)
        {
            this._catalog = k;
            this._windowManager = _arg_2;
            this._roomEngine = _arg_3;
            this._Str_22933();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._catalog = null;
            this._windowManager = null;
            if (this._latestOffers != null)
            {
                this._Str_13241(this._latestOffers);
                this._latestOffers = null;
            }
            if (this._latestOwnOffers != null)
            {
                this._Str_13241(this._latestOwnOffers);
                this._latestOwnOffers = null;
            }
            this._disposed = true;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._catalog.localization;
        }

        public function registerVisualization(k:IMarketPlaceVisualization=null):void
        {
            if (k == null)
            {
                return;
            }
            this._visualization = k;
        }

        private function _Str_22933():void
        {
            if (((!(this._catalog)) || (!(this._catalog.connection))))
            {
                return;
            }
            this._catalog.connection.send(new _Str_7525());
        }

        private function showConfirmation(k:int, _arg_2:MarketPlaceOfferData):void
        {
            if (!this._confirmationDialog)
            {
                this._confirmationDialog = new MarketplaceConfirmationDialog(this, this._catalog, this._roomEngine);
            }
            this._confirmationDialog.showConfirmation(k, _arg_2);
        }

        public function requestOffersByName(k:String):void
        {
            if (this._catalog)
            {
                this._catalog.getPublicMarketPlaceOffers(-1, -1, k, -1);
            }
        }

        public function requestOffersByPrice(k:int):void
        {
            if (this._catalog)
            {
                this._catalog.getPublicMarketPlaceOffers(k, -1, "", -1);
            }
        }

        public function requestOffers(k:int, _arg_2:int, _arg_3:String, _arg_4:int):void
        {
            this._minPrice = k;
            this._maxPrice = _arg_2;
            this._searchString = _arg_3;
            this._sortOrder = _arg_4;
            if (this._catalog)
            {
                this._catalog.getPublicMarketPlaceOffers(k, _arg_2, _arg_3, _arg_4);
            }
        }

        public function refreshOffers():void
        {
            this.requestOffers(this._minPrice, this._maxPrice, this._searchString, this._sortOrder);
        }

        public function requestOwnItems():void
        {
            if (this._catalog)
            {
                this._catalog.getOwnMarketPlaceOffers();
            }
        }

        public function requestItemStats(k:int, _arg_2:int):void
        {
            if (this._catalog)
            {
                this._statsRequestTypeId = _arg_2;
                this._statsRequestCategoryId = k;
                this._catalog.getMarketplaceItemStats(k, _arg_2);
            }
        }

        public function buyOffer(k:int):void
        {
            if ((((!(this._latestOffers)) || (!(this._catalog))) || (!(this._catalog.getPurse()))))
            {
                return;
            }
            var _local_2:MarketPlaceOfferData = (this._latestOffers.getValue(k) as MarketPlaceOfferData);
            if (!_local_2)
            {
                return;
            }
            if (this._catalog.getPurse().credits < _local_2.price)
            {
                this._catalog.showNotEnoughCreditsAlert();
                return;
            }
            this.showConfirmation(this._Str_19658, _local_2);
        }

        public function redeemExpiredOffer(k:int):void
        {
            if (this._catalog)
            {
                this._catalog.redeemExpiredMarketPlaceOffer(k);
            }
        }

        public function redeemSoldOffers():void
        {
            var _local_2:int;
            var _local_3:MarketPlaceOfferData;
            if (this.disposed)
            {
                return;
            }
            if (this._latestOwnOffers == null)
            {
                return;
            }
            var k:Array = this._latestOwnOffers.getKeys();
            for each (_local_2 in k)
            {
                _local_3 = this._latestOwnOffers.getValue(_local_2);
                if (_local_3.status == MarketPlaceOfferState._Str_8295)
                {
                    this._latestOwnOffers.remove(_local_2);
                    _local_3.dispose();
                }
            }
            if (this._catalog)
            {
                this._catalog.redeemSoldMarketPlaceOffers();
            }
            if (this._visualization != null)
            {
                this._visualization.listUpdatedNotify();
            }
        }

        private function _Str_13241(k:Map):void
        {
            var _local_2:MarketPlaceOfferData;
            if (k != null)
            {
                for each (_local_2 in k)
                {
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                }
                k.dispose();
            }
        }

        public function onOffers(k:IMessageEvent):void
        {
            var _local_4:_Str_4192;
            var _local_5:MarketPlaceOfferData;
            var _local_2:_Str_7697 = (k as _Str_7697);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_4738 = (_local_2.getParser() as _Str_4738);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_13241(this._latestOffers);
            this._latestOffers = new Map();
            for each (_local_4 in _local_3.offers)
            {
                _local_5 = new MarketPlaceOfferData(_local_4.offerId, _local_4.furniId, _local_4.furniType, _local_4.extraData, _local_4.stuffData, _local_4.price, _local_4.status, _local_4._Str_3925, _local_4._Str_4121);
                _local_5._Str_5853 = _local_4._Str_5853;
                this._latestOffers.add(_local_4.offerId, _local_5);
            }
            this._totalItemsFound = _local_3.totalItemsFound;
            if (this._visualization != null)
            {
                this._visualization.listUpdatedNotify();
            }
        }

        public function onOwnOffers(k:IMessageEvent):void
        {
            var _local_4:_Str_4192;
            var _local_5:MarketPlaceOfferData;
            var _local_2:_Str_7169 = (k as _Str_7169);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_6982 = (_local_2.getParser() as _Str_6982);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_13241(this._latestOwnOffers);
            this._latestOwnOffers = new Map();
            this._creditsWaiting = _local_3.creditsWaiting;
            for each (_local_4 in _local_3.offers)
            {
                _local_5 = new MarketPlaceOfferData(_local_4.offerId, _local_4.furniId, _local_4.furniType, _local_4.extraData, _local_4.stuffData, _local_4.price, _local_4.status, _local_4._Str_3925);
                _local_5._Str_5853 = _local_4._Str_5853;
                this._latestOwnOffers.add(_local_4.offerId, _local_5);
            }
            if (this._visualization != null)
            {
                this._visualization.listUpdatedNotify();
            }
        }

        public function onBuyResult(event:IMessageEvent):void
        {
            var item:MarketPlaceOfferData;
            var updateItem:MarketPlaceOfferData;
            var buyEvent:_Str_6344 = (event as _Str_6344);
            if (event == null)
            {
                return;
            }
            var parser:_Str_6144 = (buyEvent.getParser() as _Str_6144);
            if (parser == null)
            {
                return;
            }
            if (parser.result == 1)
            {
                this.refreshOffers();
            }
            else
            {
                if (parser.result == 2)
                {
                    item = this._latestOffers.remove(parser._Str_7501);
                    if (item != null)
                    {
                        item.dispose();
                    }
                    if (this._visualization != null)
                    {
                        this._visualization.listUpdatedNotify();
                    }
                    if (this._windowManager != null)
                    {
                        this._windowManager.alert("${catalog.marketplace.not_available_title}", "${catalog.marketplace.not_available_header}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                        {
                            k.dispose();
                        });
                    }
                }
                else
                {
                    if (parser.result == 3)
                    {
                        updateItem = (this._latestOffers.getValue(parser._Str_7501) as MarketPlaceOfferData);
                        if (updateItem)
                        {
                            updateItem.offerId = parser.offerId;
                            updateItem.price = parser._Str_24839;
                            updateItem._Str_4121--;
                            this._latestOffers.add(parser.offerId, updateItem);
                        }
                        this._latestOffers.remove(parser._Str_7501);
                        this.showConfirmation(this._Str_22006, updateItem);
                        if (this._visualization != null)
                        {
                            this._visualization.listUpdatedNotify();
                        }
                    }
                    else
                    {
                        if (parser.result == 4)
                        {
                            if (this._windowManager != null)
                            {
                                this._windowManager.alert("${catalog.alert.notenough.title}", "${catalog.alert.notenough.credits.description}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                                {
                                    k.dispose();
                                });
                            }
                        }
                    }
                }
            }
        }

        public function onCancelResult(event:IMessageEvent):void
        {
            var item:MarketPlaceOfferData;
            var cancelEvent:_Str_6345 = (event as _Str_6345);
            if (event == null)
            {
                return;
            }
            var parser:_Str_5775 = (cancelEvent.getParser() as _Str_5775);
            if (parser == null)
            {
                return;
            }
            if (parser.success)
            {
                item = this._latestOwnOffers.remove(parser.offerId);
                if (item != null)
                {
                    item.dispose();
                }
                if (this._visualization != null)
                {
                    this._visualization.listUpdatedNotify();
                }
            }
            else
            {
                if (this._windowManager != null)
                {
                    this._windowManager.alert("${catalog.marketplace.operation_failed.topic}", "${catalog.marketplace.cancel_failed}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                }
            }
        }

        public function latestOffers():Map
        {
            return this._latestOffers;
        }

        public function latestOwnOffers():Map
        {
            return this._latestOwnOffers;
        }

        public function totalItemsFound():int
        {
            return this._totalItemsFound;
        }

        public function set _Str_10038(k:MarketplaceItemStats):void
        {
            if (((!(k._Str_9431 == this._statsRequestCategoryId)) || (!(k._Str_8798 == this._statsRequestTypeId))))
            {
                return;
            }
            this._itemStats = k;
            if (this._visualization != null)
            {
                this._visualization.updateStats();
            }
        }

        public function get _Str_10038():MarketplaceItemStats
        {
            return this._itemStats;
        }

        public function get creditsWaiting():int
        {
            return this._creditsWaiting;
        }

        public function get _Str_5014():int
        {
            return this._averagePricePeriod;
        }

        public function set _Str_5014(k:int):void
        {
            this._averagePricePeriod = k;
        }

        private function _Str_19905(k:IMarketPlaceOfferData):Boolean
        {
            var _local_3:IFurnitureData;
            var _local_4:String;
            var _local_2:Boolean;
            if (((k.furniType == 2) && (!(k.extraData == null))))
            {
                _local_3 = this._catalog.getFurnitureData(k.furniId, ProductTypeEnum.WALL);
                if (_local_3)
                {
                    _local_4 = _local_3.className;
                    if (((!(_local_4 == null)) && (_local_4 == POSTER)))
                    {
                        _local_2 = true;
                    }
                }
            }
            return _local_2;
        }

        public function getNameLocalizationKey(k:IMarketPlaceOfferData):String
        {
            var _local_2:String = "";
            if (k != null)
            {
                if (this._Str_19905(k))
                {
                    _local_2 = (("poster_" + k.extraData) + "_name");
                }
                else
                {
                    if (k.furniType == MarketPlaceOfferData.TYPE_LANDSCAPE)
                    {
                        _local_2 = ("roomItem.name." + k.furniId);
                    }
                    else
                    {
                        if (k.furniType == MarketPlaceOfferData.TYPE_FLOOR)
                        {
                            _local_2 = ("wallItem.name." + k.furniId);
                        }
                    }
                }
            }
            return _local_2;
        }

        public function getDescriptionLocalizationKey(k:IMarketPlaceOfferData):String
        {
            var _local_2:String = "";
            if (k != null)
            {
                if (this._Str_19905(k))
                {
                    _local_2 = (("poster_" + k.extraData) + "_desc");
                }
                else
                {
                    if (k.furniType == MarketPlaceOfferData.TYPE_LANDSCAPE)
                    {
                        _local_2 = ("roomItem.desc." + k.furniId);
                    }
                    else
                    {
                        if (k.furniType == MarketPlaceOfferData.TYPE_FLOOR)
                        {
                            _local_2 = ("wallItem.desc." + k.furniId);
                        }
                    }
                }
            }
            return _local_2;
        }

        public function isAccountSafetyLocked():Boolean
        {
            if (this._catalog)
            {
                return this._catalog.sessionDataManager.isAccountSafetyLocked();
            }
            return false;
        }
    }
}
