package com.sulake.habbo.inventory
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.inventory.purse.Purse;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import __AS3__.vec.Vector;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.habbo.communication.messages.outgoing.inventory.purse.GetCreditsInfoComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.ScrGetUserInfoMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgePointLimitsComposer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import com.sulake.habbo.inventory.enum.InventorySubCategory;
    import com.sulake.habbo.inventory.effects.EffectsModel;
    import com.sulake.habbo.inventory.badges.BadgesModel;
    import com.sulake.habbo.inventory.recycler.RecyclerModel;
    import com.sulake.habbo.inventory.pets.PetsModel;
    import com.sulake.habbo.inventory.bots.BotsModel;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.Event;
    import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.room.enum.RoomObjectPlacementSource;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.inventory.badges.Badge;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class HabboInventory extends Component implements IHabboInventory, ILinkEventTracker 
    {
        private var _communication:IHabboCommunicationManager;
        private var _incomingMessages:IncomingMessages;
        private var _windowManager:IHabboWindowManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _localization:IHabboLocalizationManager;
        private var _soundManager:IHabboSoundManager;
        private var _view:InventoryMainView;
        private var _inventories:Map;
        private var _roomEngine:IRoomEngine;
        private var _roomSession:IRoomSession;
        private var _initedInventoryCategories:Array;
        private var _purse:Purse;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _catalog:IHabboCatalog;
        private var _isInitialized:Boolean;
        private var _unseenItemTracker:UnseenItemTracker;
        private var _externalBadgesInitializationRequested:Boolean = false;
        private var _currentCategoryId:String;
        private var _figureSetIds:Vector.<int>;
        private var _boundFurnitureNames:Vector.<String>;
        private var _purseTimer:Timer;

        public function HabboInventory(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._purse = new Purse();
            this._initedInventoryCategories = [];
            this._figureSetIds = new Vector.<int>(0);
        }

        public function get isVisible():Boolean
        {
            return this._view.isVisible;
        }

        public function get _Str_23029():Boolean
        {
            return this._view.isActive;
        }

        public function get isInitialized():Boolean
        {
            return this._isInitialized;
        }

        public function get _Str_3455():IUnseenItemTracker
        {
            return this._unseenItemTracker;
        }

        public function get view():InventoryMainView
        {
            return this._view;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderer = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), null, false, [{
                "type":RoomSessionEvent.STARTED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this.roomSessionEventHandler
            }, {
                "type":RoomSessionPropertyUpdateEvent.RSDUE_ALLOW_PETS,
                "callback":this.roomSessionEventHandler
            }]), new ComponentDependency(new IIDHabboToolbar(), null, false, [{
                "type":HabboToolbarEvent.HTE_TOOLBAR_CLICK,
                "callback":this._Str_23889
            }]), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            })]));
        }

        private function _Str_23889(k:HabboToolbarEvent):void
        {
            if (this._view != null)
            {
                this._view._Str_3304(k);
            }
        }

        override protected function initComponent():void
        {
            if (HabboComponentFlags.isRoomViewerMode(flags))
            {
                return;
            }
            this._incomingMessages = new IncomingMessages(this);
            context.addLinkEventTracker(this);
            this._unseenItemTracker = new UnseenItemTracker(this._communication, events, this);
            this._view = new InventoryMainView(this, this._windowManager, assets);
            this._communication.connection.send(new GetCreditsInfoComposer());
            this._communication.connection.send(new ScrGetUserInfoMessageComposer("habbo_club"));
            this._communication.connection.send(new GetBadgePointLimitsComposer());
        }

        override public function dispose():void
        {
            var k:Array;
            var _local_2:int;
            var _local_3:String;
            var _local_4:IInventoryModel;
            if (disposed)
            {
                return;
            }
            if (this._purseTimer != null)
            {
                this._purseTimer.stop();
                this._purseTimer.removeEventListener(TimerEvent.TIMER, this.onPurseTimer);
                this._purseTimer = null;
            }
            if (this._inventories)
            {
                k = this._inventories.getKeys();
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    _local_3 = k[_local_2];
                    _local_4 = (this._inventories.getValue(_local_3) as IInventoryModel);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    }
                    _local_2++;
                }
                this._inventories.dispose();
                this._inventories = null;
            }
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
            this._roomSession = null;
            if (this._unseenItemTracker != null)
            {
                this._unseenItemTracker.dispose();
                this._unseenItemTracker = null;
            }
            if (this._incomingMessages != null)
            {
                this._incomingMessages.dispose();
                this._incomingMessages = null;
            }
            super.dispose();
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function getModel(k:String):IInventoryModel
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            return this._inventories.getValue(k);
        }

        public function get _Str_2834():FurniModel
        {
            return (disposed) ? null : FurniModel(this.getModel(InventoryCategory.FURNI));
        }

        public function get _Str_3957():TradingModel
        {
            return (disposed) ? null : TradingModel(this.getModel(InventorySubCategory.TRADING));
        }

        public function get _Str_3994():EffectsModel
        {
            return (disposed) ? null : EffectsModel(this.getModel(InventoryCategory.EFFECTS));
        }

        public function get _Str_7962():BadgesModel
        {
            return (disposed) ? null : BadgesModel(this.getModel(InventoryCategory.BADGES));
        }

        public function get _Str_5568():RecyclerModel
        {
            return (disposed) ? null : RecyclerModel(this.getModel(InventorySubCategory.RECYCLER));
        }

        public function get _Str_4524():PetsModel
        {
            return (disposed) ? null : PetsModel(this.getModel(InventoryCategory.PETS));
        }

        public function get _Str_8302():BotsModel
        {
            return (disposed) ? null : BotsModel(this.getModel(InventoryCategory.BOTS));
        }

        public function get _Str_6398():MarketplaceModel
        {
            return (disposed) ? null : MarketplaceModel(this.getModel(InventoryCategory.MARKETPLACE));
        }

        public function get sessionData():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get roomSession():IRoomSession
        {
            return this._roomSession;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get clubDays():int
        {
            return this._purse.clubDays;
        }

        public function get clubPeriods():int
        {
            return this._purse.clubPeriods;
        }

        public function get clubPastPeriods():int
        {
            return this._purse.clubPastPeriods;
        }

        public function get clubHasEverBeenMember():Boolean
        {
            return this._purse.clubHasEverBeenMember;
        }

        public function get clubIsExpiring():Boolean
        {
            return this._purse.clubIsExpiring;
        }

        public function get citizenshipVipIsExpiring():Boolean
        {
            return this._purse.citizenshipVipIsExpiring;
        }

        public function get clubMinutesUntilExpiration():int
        {
            return this._purse.minutesUntilExpiration;
        }

        public function get clubLevel():int
        {
            if (((this.clubDays == 0) && (this.clubPeriods == 0)))
            {
                return HabboClubLevelEnum.NO_CLUB;
            }
            if (this._purse.isVIP)
            {
                return HabboClubLevelEnum.VIP;
            }
            return HabboClubLevelEnum.CLUB;
        }

        public function get hasRoomSession():Boolean
        {
            return !(this._roomSession == null);
        }

        public function _Str_18332():String
        {
            return this._view._Str_18332();
        }

        public function _Str_23808(k:int, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:int, _arg_8:int):void
        {
            this._purse.clubPeriods = k;
            this._purse.clubDays = _arg_2;
            this._purse.clubHasEverBeenMember = _arg_3;
            this._purse.isVIP = _arg_4;
            this._purse.clubIsExpiring = _arg_5;
            this._purse.citizenshipVipIsExpiring = _arg_6;
            this._purse.minutesUntilExpiration = _arg_7;
            this._purse.minutesSinceLastModified = _arg_8;
            if (((_arg_7 > 0) && (_arg_7 < (((60 * 1000) * 60) * 24))))
            {
                if (this._purseTimer == null)
                {
                    this._purseTimer = new Timer((60 * 1000), 0);
                    this._purseTimer.addEventListener(TimerEvent.TIMER, this.onPurseTimer);
                }
                if (!this._purseTimer.running)
                {
                    this._purseTimer.start();
                }
            }
            else
            {
                if (this._purseTimer != null)
                {
                    this._purseTimer.stop();
                    this._purseTimer.removeEventListener(TimerEvent.TIMER, this.onPurseTimer);
                    this._purseTimer = null;
                }
            }
        }

        private function onPurseTimer(k:TimerEvent):void
        {
            this._communication.connection.send(new ScrGetUserInfoMessageComposer("habbo_club"));
        }

        private function roomSessionEventHandler(k:RoomSessionEvent):void
        {
            switch (k.type)
            {
                case RoomSessionEvent.STARTED:
                    this._roomSession = k.session;
                    if (this._isInitialized)
                    {
                        if (this._Str_4524 != null)
                        {
                            this._Str_4524._Str_19310();
                        }
                        if (this._Str_2834 != null)
                        {
                            this._Str_2834.updateView();
                        }
                    }
                    return;
                case RoomSessionEvent.ENDED:
                    this._roomSession = null;
                    if (this._isInitialized)
                    {
                        this.deselectAllEffects();
                    }
                    return;
                case RoomSessionPropertyUpdateEvent.RSDUE_ALLOW_PETS:
                    if (this._isInitialized)
                    {
                        if (this._Str_4524 != null)
                        {
                            this._Str_4524._Str_19310();
                        }
                    }
                    return;
            }
        }

        private function init():void
        {
            if (!allRequiredDependenciesInjected)
            {
                return;
            }
            this._inventories = new Map();
            var marketplaceModel:MarketplaceModel = new MarketplaceModel(this, this._windowManager, this._communication, assets, this._roomEngine, this._localization);
            this._inventories.add(InventoryCategory.MARKETPLACE, marketplaceModel);
            var furniModel:FurniModel = new FurniModel(this, marketplaceModel, this._windowManager, this._communication, assets, this._roomEngine, this._catalog, this._soundManager, this._localization);
            this._inventories.add(InventoryCategory.FURNI, furniModel);
            this._inventories.add(InventoryCategory.RENTABLES, furniModel);
            var badgesModel:BadgesModel = new BadgesModel(this, this._windowManager, this._communication, assets);
            this._inventories.add(InventoryCategory.BADGES, badgesModel);
            var effectsModel:EffectsModel = new EffectsModel(this, this._windowManager, this._communication, assets, this._localization);
            this._inventories.add(InventoryCategory.EFFECTS, effectsModel);
            var tradingModel:TradingModel = new TradingModel(this, this._windowManager, this._communication, assets, this._roomEngine, this._localization, this._soundManager);
            this._inventories.add(InventorySubCategory.TRADING, tradingModel);
            var recyclerModel:RecyclerModel = new RecyclerModel(this, this._windowManager, this._communication, assets, this._roomEngine, this._localization);
            this._inventories.add(InventorySubCategory.RECYCLER, recyclerModel);
            var petsModel:PetsModel = new PetsModel(this, this._windowManager, this._communication, assets, this._roomEngine, this._catalog);
            this._inventories.add(InventoryCategory.PETS, petsModel);
            var botsModel:BotsModel = new BotsModel(this, this._windowManager, this._communication, assets, this._roomEngine, this._catalog, this._avatarRenderer);
            this._inventories.add(InventoryCategory.BOTS, botsModel);
            this._isInitialized = true;
        }

        public function getCategoryWindowContainer(k:String):IWindowContainer
        {
            var _local_2:IInventoryModel = IInventoryModel(this._inventories.getValue(k));
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.getWindowContainer();
        }

        public function updateView(k:String):void
        {
            var _local_2:IInventoryModel = IInventoryModel(this._inventories.getValue(k));
            if (_local_2 == null)
            {
                return;
            }
            return _local_2.updateView();
        }

        public function _Str_24435(k:String):IWindowContainer
        {
            var _local_2:IInventoryModel = IInventoryModel(this._inventories.getValue(k));
            return (_local_2 == null) ? null : _local_2.getWindowContainer();
        }

        public function getActivatedAvatarEffects():Array
        {
            return (this._Str_3994 == null) ? [] : this._Str_3994._Str_6532(EffectsModel._Str_14844);
        }

        public function getAvatarEffects():Array
        {
            return (this._Str_3994 == null) ? [] : this._Str_3994._Str_6532();
        }

        public function setEffectSelected(k:int):void
        {
            var _local_2:EffectsModel = this._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            _local_2._Str_20338(k);
            this._Str_7796();
        }

        public function setEffectDeselected(k:int):void
        {
            var _local_2:EffectsModel = this._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            _local_2.stopUsingEffect(k, true);
            this._Str_7796();
        }

        public function deselectAllEffects(k:Boolean=false):void
        {
            var _local_2:EffectsModel = this._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            _local_2.stopUsingAllEffects(true, true, k);
            this._Str_7796();
        }

        public function getAvatarEffect(k:int):IAvatarEffect
        {
            return (this._Str_3994 == null) ? null : this._Str_3994._Str_23964(k);
        }

        public function _Str_13252():void
        {
            if (((this._view) && (this._view.isVisible)))
            {
                this._view._Str_15430();
            }
        }

        public function showView():void
        {
            if (this._view)
            {
                this._view._Str_24385();
            }
        }

        public function get _Str_23047():Boolean
        {
            return !(this._view.mainContainer == null);
        }

        public function _Str_22707():void
        {
            if (this._view)
            {
                this.toggleInventoryPage(InventoryCategory.FURNI);
                this._view._Str_15430();
            }
        }

        public function toggleInventoryPage(k:String, _arg_2:String=null, _arg_3:Boolean=false):void
        {
            this._currentCategoryId = k;
            var _local_4:Boolean = this._view.toggleCategoryView(k, false, _arg_3);
            if (_local_4)
            {
                this._Str_18877(k);
                if (_arg_2 != null)
                {
                    IInventoryModel(this._inventories.getValue(this._currentCategoryId))._Str_5725(_arg_2);
                }
            }
            if (!_local_4)
            {
                events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
            }
        }

        public function toggleInventorySubPage(k:String):void
        {
            var _local_3:IInventoryModel;
            this._view._Str_24934(k, false);
            var _local_2:int;
            while (_local_2 < this._inventories.length)
            {
                _local_3 = (this._inventories.getWithIndex(_local_2) as IInventoryModel);
                _local_3._Str_5813(k);
                _local_2++;
            }
            switch (k)
            {
                case InventorySubCategory.TRADING:
                    this._view.toggleCategoryView(InventoryCategory.FURNI, false);
                    return;
            }
        }

        public function _Str_24527():void
        {
            this._view._Str_23647();
        }

        public function _Str_5100():void
        {
            var k:int;
            var _local_2:IInventoryModel;
            if (this._inventories)
            {
                k = 0;
                while (k < this._inventories.length)
                {
                    _local_2 = (this._inventories.getWithIndex(k) as IInventoryModel);
                    _local_2._Str_5100();
                    k++;
                }
            }
            events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
        }

        public function _Str_24810():void
        {
            if (!this._isInitialized)
            {
                this.init();
            }
        }

        public function _Str_18877(k:String):void
        {
            var _local_3:IInventoryModel;
            var _local_2:int;
            while (_local_2 < this._inventories.length)
            {
                _local_3 = (this._inventories.getWithIndex(_local_2) as IInventoryModel);
                _local_3._Str_5913(k);
                _local_2++;
            }
        }

        public function setupTrading(k:int, _arg_2:String):void
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            var _local_3:TradingModel = this._Str_3957;
            if (_local_3 == null)
            {
                return;
            }
            _local_3.requestOpenTrading(k);
        }

        public function get tradingActive():Boolean
        {
            return (this._Str_3957 == null) ? false : this._Str_3957.running;
        }

        public function _Str_20251(k:Boolean):void
        {
            if (this._Str_5568 != null)
            {
                if (k)
                {
                    this._Str_5568._Str_22646();
                }
                else
                {
                    this._Str_5568._Str_20195();
                }
            }
        }

        public function _Str_15313():int
        {
            return (this._Str_5568 != null) ? this._Str_5568._Str_22697() : 0;
        }

        public function returnInventoryFurniFromRecycler(k:int):Boolean
        {
            return (this._Str_5568 != null) ? this._Str_5568._Str_23825(k) : false;
        }

        public function _Str_16742():Boolean
        {
            var k:TradingModel = this._Str_3957;
            return (k != null) ? k._Str_23201 : false;
        }

        public function _Str_5943(k:String, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            if (_arg_2)
            {
                if (this._initedInventoryCategories.indexOf(k) == -1)
                {
                    this._initedInventoryCategories.push(k);
                }
            }
            else
            {
                _local_3 = this._initedInventoryCategories.indexOf(k);
                if (_local_3 >= 0)
                {
                    this._initedInventoryCategories.splice(_local_3, 1);
                }
                if (((!(this._view == null)) && (this._view.isVisible)))
                {
                    if (k != InventoryCategory.RENTABLES)
                    {
                        this._Str_22178(k);
                    }
                }
            }
        }

        public function _Str_18826(k:String):Boolean
        {
            return this._initedInventoryCategories.indexOf(k) >= 0;
        }

        public function checkCategoryInitilization(k:String):Boolean
        {
            if (this._Str_18826(k))
            {
                return true;
            }
            this._Str_22178(k);
            return false;
        }

        public function _Str_22178(k:String):void
        {
            var _local_2:IInventoryModel = (this._inventories.getValue(k) as IInventoryModel);
            if (_local_2 != null)
            {
                _local_2._Str_4889();
            }
        }

        public function _Str_7796():void
        {
            events.dispatchEvent(new HabboInventoryEffectsEvent(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED));
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function requestSelectedFurniToMover(k:IFurnitureItem):Boolean
        {
            var _local_2:int;
            var _local_3:Boolean;
            if (k.isWallItem)
            {
                _local_2 = RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM;
            }
            else
            {
                _local_2 = RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE;
            }
            if (k.category == FurniCategory.POSTER)
            {
                _local_3 = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.INVENTORY, k.id, _local_2, k.type, k.stuffData.getLegacyString());
            }
            else
            {
                _local_3 = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.INVENTORY, k.id, _local_2, k.type, k._Str_2794.toString(), k.stuffData);
            }
            return _local_3;
        }

        public function getFloorItemById(k:int):IFurnitureItem
        {
            var _local_2:GroupItem;
            var _local_3:IFurnitureItem;
            for each (_local_2 in this._Str_2834.furniData)
            {
                _local_3 = _local_2.getItem(k);
                if (((!(_local_3 == null)) && (!(_local_3.isWallItem))))
                {
                    return _local_3;
                }
            }
            return null;
        }

        public function getWallItemById(k:int):IFurnitureItem
        {
            var _local_2:GroupItem;
            var _local_3:IFurnitureItem;
            for each (_local_2 in this._Str_2834.furniData)
            {
                _local_3 = _local_2.getItem(k);
                if (((!(_local_3 == null)) && (_local_3.isWallItem)))
                {
                    return _local_3;
                }
            }
            return null;
        }

        public function getNonRentedInventoryIds(k:String, _arg_2:int):Array
        {
            var _local_3:FurniModel = this._inventories.getValue(k);
            if (!_local_3)
            {
                return null;
            }
            var _local_4:GroupItem = this._Str_2834._Str_24542(_arg_2);
            if (!_local_4)
            {
                return null;
            }
            return _local_4._Str_25304();
        }

        public function placePetToRoom(k:int, _arg_2:Boolean=false):Boolean
        {
            return this._Str_4524.placePetToRoom(k, _arg_2);
        }

        public function _Str_6956():void
        {
            var k:int;
            k = this._unseenItemTracker._Str_5621(UnseenItemCategoryEnum.FURNI);
            this._view._Str_23205(k);
            k = this._unseenItemTracker._Str_5621(UnseenItemCategoryEnum.RENTABLE);
            this._view._Str_25138(k);
            var _local_2:int = this._unseenItemTracker._Str_5621(UnseenItemCategoryEnum.PET);
            this._view._Str_22445(_local_2);
            var _local_3:int = this._unseenItemTracker._Str_5621(UnseenItemCategoryEnum.BADGE);
            this._view._Str_24193(_local_3);
            var _local_4:int = this._unseenItemTracker._Str_5621(UnseenItemCategoryEnum.BOT);
            this._view._Str_24185(_local_4);
        }

        public function getItemWithStripId(k:int):Boolean
        {
            var _local_2:Boolean = this._Str_2834.getItemWithStripId(k);
            if (_local_2)
            {
                this._Str_6956();
            }
            return _local_2;
        }

        public function removeUnseenFurniCounter(k:int):Boolean
        {
            var _local_2:Boolean = this._Str_4524._Str_7938(k);
            if (_local_2)
            {
                this._Str_6956();
            }
            return _local_2;
        }

        public function get _Str_24829():int
        {
            return getInteger("inventory.bots.max", 150);
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get _Str_9777():String
        {
            return this._currentCategoryId;
        }

        public function getFurnitureData(k:int, _arg_2:String):IFurnitureData
        {
            var _local_3:IFurnitureData;
            if (this._sessionDataManager == null)
            {
                return null;
            }
            if (_arg_2 == ProductTypeEnum.FLOOR)
            {
                _local_3 = this._sessionDataManager.getFloorItemData(k);
            }
            if (_arg_2 == ProductTypeEnum.WALL)
            {
                _local_3 = this._sessionDataManager.getWallItemData(k);
            }
            return _local_3;
        }

        public function getFurnitureDataByName(k:String, _arg_2:String, _arg_3:int=0):IFurnitureData
        {
            var _local_4:IFurnitureData;
            if (this._sessionDataManager == null)
            {
                return null;
            }
            if (_arg_2 == ProductTypeEnum.FLOOR)
            {
                _local_4 = this._sessionDataManager.getFloorItemDataByName(k);
            }
            if (_arg_2 == ProductTypeEnum.WALL)
            {
                _local_4 = this._sessionDataManager.getWallItemDataByName(k);
            }
            return _local_4;
        }

        public function get linkPattern():String
        {
            return "inventory/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    if (_local_2.length == 2)
                    {
                        this.toggleInventoryPage(InventoryCategory.FURNI);
                    }
                    else
                    {
                        if (_local_2.length == 3)
                        {
                            this.toggleInventoryPage(_local_2[2]);
                        }
                        else
                        {
                            if (_local_2.length == 4)
                            {
                                this.toggleInventoryPage(_local_2[2], _local_2[3]);
                            }
                        }
                    }
                    return;
                default:
                    Logger.log(("Inventory unknown link-type received: " + _local_2[1]));
            }
        }

        public function getAllMyBadgeIds(k:Array):Array
        {
            var _local_4:Badge;
            var _local_2:BadgesModel = this._inventories.getValue(InventoryCategory.BADGES);
            var _local_3:Array = [];
            if (((_local_2._Str_5453().length == 0) && (!(this._externalBadgesInitializationRequested))))
            {
                this._Str_7962._Str_4889();
                this._externalBadgesInitializationRequested = true;
            }
            for each (_local_4 in _local_2._Str_5453())
            {
                if (((k == null) || (k.indexOf(_local_4.badgeId) == -1)))
                {
                    _local_3.push(_local_4.badgeId);
                }
            }
            return _local_3;
        }

        public function hasFigureSetIdInInventory(k:int):Boolean
        {
            return this._figureSetIds.indexOf(k) > -1;
        }

        public function hasBoundFigureSetFurniture(k:String):Boolean
        {
            return this._boundFurnitureNames.indexOf(k) > -1;
        }

        public function _Str_22773(k:Vector.<int>, _arg_2:Vector.<String>):void
        {
            this._figureSetIds = k;
            this._boundFurnitureNames = _arg_2;
        }

        public function getLastActivatedEffect():int
        {
            return this._Str_3994._Str_24332;
        }
    }
}
