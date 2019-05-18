package com.sulake.habbo.inventory.marketplace
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_11938;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_9793;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_7610;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_7890;
    import com.sulake.habbo.communication.messages.outgoing._Str_307._Str_7525;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MarketplaceModel implements IInventoryModel 
    {
        private var _controller:HabboInventory;
        private var _assets:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _disposed:Boolean = false;
        private var _item:FurnitureItem;
        private var _isEnabled:Boolean;
        private var _commission:int;
        private var _tokenBatchPrice:int;
        private var _tokensBatchSize:int;
        private var _offerMinPrice:int;
        private var _offerMaxPrice:int;
        private var _expirationHours:int;
        private var _averagePricePeriod:int;
        private var _statsRequestCategoryId:int;
        private var _statsRequestTypeId:int;
        private var _view:MarketplaceView;
        private var _isBuyingTokens:Boolean = false;

        public function MarketplaceModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:IHabboLocalizationManager)
        {
            this._controller = k;
            this._communication = _arg_3;
            this._windowManager = _arg_2;
            this._assets = _arg_4;
            this._roomEngine = _arg_5;
            this._view = new MarketplaceView(this, this._windowManager, this._assets, _arg_5, _arg_6, k);
        }

        public function get id():String
        {
            return InventoryCategory.MARKETPLACE;
        }

        public function set enabled(k:Boolean):void
        {
            this._isEnabled = k;
        }

        public function set commission(k:int):void
        {
            this._commission = k;
        }

        public function set credits(k:int):void
        {
            this._tokenBatchPrice = k;
        }

        public function set advertisements(k:int):void
        {
            this._tokensBatchSize = k;
        }

        public function set minimumPrice(k:int):void
        {
            this._offerMinPrice = k;
        }

        public function set maximumPrice(k:int):void
        {
            this._offerMaxPrice = k;
        }

        public function set offerTime(k:int):void
        {
            this._expirationHours = k;
        }

        public function set displayTime(k:int):void
        {
            this._averagePricePeriod = k;
        }

        public function get enabled():Boolean
        {
            return this._isEnabled;
        }

        public function get commission():int
        {
            return this._commission;
        }

        public function get credits():int
        {
            return this._tokenBatchPrice;
        }

        public function get advertisements():int
        {
            return this._tokensBatchSize;
        }

        public function get minimumPrice():int
        {
            return this._offerMinPrice;
        }

        public function get maximumPrice():int
        {
            return this._offerMaxPrice;
        }

        public function get offerTime():int
        {
            return this._expirationHours;
        }

        public function get controller():HabboInventory
        {
            return this._controller;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this._controller = null;
            this._communication = null;
            this._windowManager = null;
            this._assets = null;
            this._roomEngine = null;
        }

        public function _Str_9529():void
        {
            if ((((!(this._controller == null)) && (!(this._controller._Str_2834 == null))) && (!(this._item == null))))
            {
                this._controller._Str_2834._Str_10184(this._item.id);
                this._item = null;
            }
        }

        public function _Str_24075(k:FurnitureItem):void
        {
            if (((!(this._item == null)) || (k == null)))
            {
                return;
            }
            if (this._controller == null)
            {
                return;
            }
            var _local_2:FurniModel = this._controller._Str_2834;
            if (_local_2 == null)
            {
                return;
            }
            this._item = k;
            _local_2._Str_15750(k.id);
            this.send(new _Str_11938());
        }

        public function _Str_25069():void
        {
            this.send(new _Str_9793());
            this._isBuyingTokens = true;
        }

        public function _Str_23093(k:int):void
        {
            if (this._item == null)
            {
                return;
            }
            var _local_2:int = ((this._item._Str_2770) ? _Str_7610._Str_17086 : _Str_7610._Str_18366);
            this.send(new _Str_7610(k, _local_2, this._item.ref));
            this._Str_9529();
        }

        public function _Str_23516():void
        {
            if (this._item == null)
            {
                return;
            }
            var k:int = ((this._item._Str_2770) ? 2 : 1);
            this._statsRequestCategoryId = k;
            this._statsRequestTypeId = this._item.type;
            this.send(new _Str_7890(k, this._item.type));
        }

        public function _Str_23766(k:int, _arg_2:int):void
        {
            this._isBuyingTokens = false;
            switch (k)
            {
                case 1:
                    this._view._Str_24597(this._item);
                    return;
                case 2:
                    this._view.alert(("$" + "{inventory.marketplace.no_trading_privilege.title}"), ("$" + "{inventory.marketplace.no_trading_privilege.info}"));
                    return;
                case 3:
                    this._view.alert(("$" + "{inventory.marketplace.no_trading_pass.title}"), ("$" + "{inventory.marketplace.no_trading_pass.info}"));
                    return;
                case 4:
                    this._view._Str_25195(this._tokenBatchPrice, this._tokensBatchSize);
                    return;
                case 5:
                    return;
                case 6:
                    this._view.alert(("$" + "{inventory.marketplace.trading_lock.title}"), ("$" + "{inventory.marketplace.trading_lock.info}"));
                    return;
            }
        }

        public function _Str_24514(k:int):void
        {
            if (!this._view)
            {
                return;
            }
            this._view._Str_22694(k);
        }

        public function _Str_22836(k:int, _arg_2:int, _arg_3:int):void
        {
            if (((!(k == this._statsRequestCategoryId)) || (!(_arg_2 == this._statsRequestTypeId))))
            {
                return;
            }
            if (!this._view)
            {
                return;
            }
            this._view._Str_25456(_arg_3, this._averagePricePeriod);
        }

        public function _Str_16520():void
        {
            if (this._isBuyingTokens)
            {
                this._isBuyingTokens = false;
                this._Str_9529();
            }
        }

        public function _Str_4889():void
        {
            this.send(new _Str_7525());
        }

        public function _Str_19036():IFurnitureItem
        {
            return this._item;
        }

        public function getWindowContainer():IWindowContainer
        {
            return null;
        }

        public function _Str_5913(k:String):void
        {
        }

        public function _Str_5813(k:String):void
        {
        }

        public function _Str_5100():void
        {
        }

        public function _Str_2491():void
        {
        }

        private function send(k:IMessageComposer):void
        {
            if (((!(this._communication == null)) && (!(this._communication.connection == null))))
            {
                this._communication.connection.send(k);
            }
        }

        public function _Str_5725(k:String):void
        {
            Logger.log("NOT SUPPORTED: MARKETPLACE SELECT BY ID");
        }
    }
}
