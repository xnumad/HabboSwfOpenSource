package com.sulake.habbo.inventory.furni
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import flash.utils.Timer;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import flash.utils.Dictionary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.inventory.enum.InventorySubCategory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.InventoryItemParser;
    import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.inventory.items.CreditTradingItem;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.outgoing._Str_91._Str_7844;
    import com.sulake.habbo.communication.messages.outgoing._Str_91._Str_11327;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import com.sulake.habbo.inventory.recycler.RecyclerModel;
    import com.sulake.habbo.inventory.IUnseenItemTracker;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.habbo.communication.messages.outgoing._Str_91._Str_5270;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_5756;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.enum.RoomObjectPlacementSource;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import flash.events.Event;
    import __AS3__.vec.*;

    public class FurniModel implements IInventoryModel 
    {
        private static const _Str_14184:int = 100;

        private var _controller:HabboInventory;
        private var _view:FurniView;
        private var _furniData:Vector.<GroupItem>;
        private var _assets:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _soundManager:IHabboSoundManager;
        private var _disposed:Boolean = false;
        private var _itemIdInFurniPlacing:int = -1;
        private var _isObjectMoverRequested:Boolean;
        private var _imageUpdateTimer:Timer;
        private var _isListInitialized:Boolean;
        private var _catalog:IHabboCatalog;
        private var _thumbWindowTemplates:Dictionary;
        private var _localization:IHabboLocalizationManager;
        private var _bottomAlignedFurniture:Array;
        private var _showingRentedFurni:Boolean;
        private var _categorySelection:Dictionary;
        private var _category:String;
        private var _imageUpdateCumulativeTime:int = 0;
        private var _roomItemToSelect:FurnitureItem = null;
        private var _isInRoom:Boolean = false;

        public function FurniModel(k:HabboInventory, _arg_2:MarketplaceModel, _arg_3:IHabboWindowManager, _arg_4:IHabboCommunicationManager, _arg_5:IAssetLibrary, _arg_6:IRoomEngine, _arg_7:IHabboCatalog, _arg_8:IHabboSoundManager, _arg_9:IHabboLocalizationManager)
        {
            this._controller = k;
            this._communication = _arg_4;
            this._windowManager = _arg_3;
            this._assets = _arg_5;
            this._roomEngine = _arg_6;
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.PLACED, this._Str_6946);
            this._catalog = _arg_7;
            this._soundManager = _arg_8;
            this._localization = _arg_9;
            this._thumbWindowTemplates = new Dictionary();
            this._bottomAlignedFurniture = this._controller.getProperty("catalog.preview.alignment.bottom").split(",");
            this._imageUpdateTimer = new Timer(_Str_14184);
            this._imageUpdateTimer.addEventListener(TimerEvent.TIMER, this._Str_20314);
            this._categorySelection = new Dictionary();
            this._categorySelection[InventoryCategory.FURNI] = null;
            this._categorySelection[InventoryCategory.RENTABLES] = null;
            this._Str_22374();
            this._view = new FurniView(this, _arg_2, this._windowManager, this._assets, this._roomEngine);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get controller():HabboInventory
        {
            return this._controller;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get _Str_7553():Boolean
        {
            return this._controller._Str_18332() == InventorySubCategory.TRADING;
        }

        public function get _Str_7411():Boolean
        {
            if (((!(this._controller)) || (!(this._controller.roomSession))))
            {
                return false;
            }
            return this._controller.roomSession._Str_7411;
        }

        public function get furniData():Vector.<GroupItem>
        {
            return this._furniData;
        }

        public function get _Str_2476():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function get _Str_22702():Boolean
        {
            return this._showingRentedFurni;
        }

        public function set _Str_21498(k:GroupItem):void
        {
            this._categorySelection[this._category] = k;
        }

        public function dispose():void
        {
            var k:IWindowContainer;
            if (!this._disposed)
            {
                this._controller = null;
                if (this._furniData != null)
                {
                    this._furniData = null;
                }
                if (this._view != null)
                {
                    this._view.dispose();
                    this._view = null;
                }
                if (this._roomEngine != null)
                {
                    if (this._roomEngine.events != null)
                    {
                        this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.PLACED, this._Str_6946);
                    }
                    this._roomEngine = null;
                }
                this._communication = null;
                this._assets = null;
                this._windowManager = null;
                this._catalog = null;
                this._soundManager = null;
                this._localization = null;
                if (this._imageUpdateTimer != null)
                {
                    this._imageUpdateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20314);
                    this._imageUpdateTimer.stop();
                    this._imageUpdateTimer = null;
                }
                for each (k in this._thumbWindowTemplates)
                {
                    if (k != null)
                    {
                        k.dispose();
                    }
                }
                this._thumbWindowTemplates = null;
                this._disposed = true;
            }
        }

        public function createItemWindow(k:*):IWindowContainer
        {
            var _local_2:IAsset;
            var _local_3:XmlAsset;
            var _local_4:XML;
            if (this._thumbWindowTemplates[k] == null)
            {
                _local_2 = this._assets.getAssetByName(k);
                _local_3 = XmlAsset(_local_2);
                _local_4 = XML(_local_3.content);
                this._thumbWindowTemplates[k] = (this._windowManager.buildFromXML(_local_4) as IWindowContainer);
            }
            return this._thumbWindowTemplates[k].clone();
        }

        public function _Str_24428(k:Map):void
        {
            var _local_2:FurnitureItem;
            var _local_3:InventoryItemParser;
            var _local_4:int;
            var _local_5:int;
            var _local_10:Boolean;
            var _local_11:int;
            var _local_12:int;
            var _local_13:HabboInventoryItemAddedEvent;
            this._controller._Str_5943(InventoryCategory.FURNI);
            this._controller._Str_5943(InventoryCategory.RENTABLES);
            var _local_6:Vector.<int> = this._Str_23292();
            var _local_7:Array = k.getKeys();
            var _local_8:Vector.<int> = new Vector.<int>(0);
            var _local_9:Vector.<int> = new Vector.<int>(0);
            _local_4 = 0;
            while (_local_4 < _local_7.length)
            {
                _local_12 = _local_7[_local_4];
                if (_local_6.indexOf(_local_12) == -1)
                {
                    _local_8.push(_local_12);
                }
                _local_4++;
            }
            for each (_local_5 in _local_6)
            {
                if (_local_7.indexOf(_local_5) == -1)
                {
                    _local_9.push(_local_5);
                }
            }
            _local_10 = (_local_6.length == 0);
            for each (_local_5 in _local_9)
            {
                this._Str_17979(_local_5);
            }
            for each (_local_5 in _local_8)
            {
                _local_3 = InventoryItemParser(k.getValue(_local_5));
                _local_2 = new FurnitureItem(_local_3);
                this._Str_20455(_local_2, true);
            }
            if (!_local_10)
            {
                if (_local_8.length > 0)
                {
                    this._Str_17963();
                }
            }
            this._Str_11524();
            this._view._Str_18112(this._furniData);
            if (_local_10)
            {
                this._Str_14744();
            }
            else
            {
                if (this._Str_3968() == null)
                {
                    this._Str_14744();
                }
            }
            this._Str_7636();
            this._Str_19135();
            for each (_local_11 in _local_7)
            {
                if (_local_8.indexOf(_local_11) > -1)
                {
                    _local_13 = new HabboInventoryItemAddedEvent(_local_3.spriteId, _local_3.itemId, _local_3.category);
                    this._controller.events.dispatchEvent(_local_13);
                }
            }
        }

        public function _Str_21873():Boolean
        {
            return this._isListInitialized;
        }

        public function _Str_11524():void
        {
            if (!this._isListInitialized)
            {
                this._isListInitialized = true;
                this._Str_7636();
            }
        }

        public function _Str_18196(k:int, _arg_2:int, _arg_3:IStuffData, _arg_4:Number=NaN, _arg_5:Boolean=false):GroupItem
        {
            var _local_6:BitmapData;
            var _local_7:IAsset;
            if (_arg_2 == FurniCategory._Str_3639)
            {
                _local_7 = this._windowManager.assets.getAssetByName("inventory_furni_icon_wallpaper");
                if (_local_7 != null)
                {
                    _local_6 = (_local_7.content as BitmapData).clone();
                }
            }
            else
            {
                if (_arg_2 == FurniCategory._Str_3683)
                {
                    _local_7 = this._windowManager.assets.getAssetByName("inventory_furni_icon_floor");
                    if (_local_7 != null)
                    {
                        _local_6 = (_local_7.content as BitmapData).clone();
                    }
                }
                else
                {
                    if (_arg_2 == FurniCategory._Str_3432)
                    {
                        _local_7 = this._windowManager.assets.getAssetByName("inventory_furni_icon_landscape");
                        if (_local_7 != null)
                        {
                            _local_6 = (_local_7.content as BitmapData).clone();
                        }
                    }
                }
            }
            var _local_8:String = "center";
            var _local_9:String = this._roomEngine.getFurnitureType(k);
            if (this._bottomAlignedFurniture.indexOf(_local_9) > -1)
            {
                _local_8 = "bottom";
            }
            return new GroupItem(this, k, _arg_2, this._roomEngine, this._controller._Str_5568.running, _arg_3, _arg_4, _local_6, _arg_5, _local_8);
        }

        public function _Str_23876(k:int):GroupItem
        {
            return new CreditTradingItem(this, this._windowManager.assets, this._roomEngine, k);
        }

        public function _Str_4889():void
        {
            var k:IConnection = this._communication.connection;
            if (k != null)
            {
                if (this._isInRoom)
                {
                    k.send(new _Str_7844());
                }
                else
                {
                    k.send(new _Str_11327());
                }
            }
        }

        public function _Str_5913(k:String):void
        {
            if (this._controller.isVisible)
            {
                Logger.log(("FurniMode.categorySwitch: " + k));
                switch (k)
                {
                    case InventoryCategory.FURNI:
                    case InventoryCategory.RENTABLES:
                        this._category = k;
                        this._showingRentedFurni = (this._category == InventoryCategory.RENTABLES);
                        this._view._Str_23210(k);
                        this._Str_24099();
                        this._Str_17963();
                        return;
                }
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            this._controller._Str_11401(InventoryCategory.MARKETPLACE);
            return this._view.getWindowContainer();
        }

        public function _Str_5100():void
        {
            if (this._view.isVisible)
            {
                this._Str_4409();
            }
        }

        public function _Str_17963():void
        {
            var _local_5:GroupItem;
            var k:Array = new Array();
            var _local_2:TradingModel = this._controller._Str_3957;
            if (_local_2 != null)
            {
                k = k.concat(_local_2._Str_21112());
            }
            var _local_3:RecyclerModel = this._controller._Str_5568;
            if (_local_3 != null)
            {
                k = k.concat(_local_3._Str_23744());
            }
            var _local_4:MarketplaceModel = this._controller._Str_6398;
            if (((!(_local_4 == null)) && (!(_local_4._Str_19036() == null))))
            {
                k = k.concat([_local_4._Str_19036().ref]);
            }
            if (k.length == 0)
            {
                this._Str_12838();
                return;
            }
            for each (_local_5 in this._furniData)
            {
                _local_5._Str_25603(k);
            }
            this._view._Str_2944();
        }

        public function _Str_15750(k:int):void
        {
            var _local_2:GroupItem;
            for each (_local_2 in this._furniData)
            {
                _local_2._Str_15750(k);
            }
            this._view._Str_2944();
        }

        public function _Str_10184(k:int):void
        {
            var _local_2:GroupItem;
            for each (_local_2 in this._furniData)
            {
                _local_2._Str_10184(k);
            }
            this._view._Str_2944();
        }

        public function _Str_14978(k:Boolean):void
        {
            var _local_2:GroupItem;
            for each (_local_2 in this._furniData)
            {
                _local_2._Str_14978 = k;
            }
            this._view._Str_2944();
        }

        public function _Str_22374():void
        {
            this._furniData = new Vector.<GroupItem>(0);
            if (this._view != null)
            {
                this._view._Str_22617();
            }
        }

        public function _Str_7938(k:int):Boolean
        {
            var _local_2:Boolean;
            var _local_3:int;
            var _local_4:IUnseenItemTracker = this._controller._Str_3455;
            if (_local_4 == null)
            {
                return false;
            }
            var _local_5:GroupItem = this._Str_14402(k);
            if (_local_5 == null)
            {
                return false;
            }
            if (this._category == InventoryCategory.RENTABLES)
            {
                _local_3 = UnseenItemCategoryEnum.RENTABLE;
            }
            else
            {
                _local_3 = UnseenItemCategoryEnum.FURNI;
            }
            var _local_6:Boolean = this._controller._Str_3455._Str_3613(_local_3, k);
            if (_local_6)
            {
                _local_2 = _local_4._Str_16745(_local_3, k);
            }
            if (_local_2)
            {
                _local_4._Str_17159(_local_3);
            }
            return _local_2;
        }

        public function _Str_25496(k:int):GroupItem
        {
            var _local_2:GroupItem;
            var _local_3:IFurnitureItem;
            for each (_local_2 in this._furniData)
            {
                _local_3 = _local_2._Str_2990(k);
                if (_local_3)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_24542(k:int):GroupItem
        {
            var _local_2:GroupItem;
            for each (_local_2 in this._furniData)
            {
                if (_local_2.type == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_20455(k:FurnitureItem, _arg_2:Boolean):void
        {
            var _local_3:GroupItem;
            if (!k._Str_13551)
            {
                _local_3 = this._Str_22387(k, _arg_2);
            }
            else
            {
                _local_3 = this._Str_23860(k, _arg_2);
            }
            if (!_arg_2)
            {
                _local_3._Str_6126 = true;
            }
            if (_local_3._Str_2365)
            {
                this._view._Str_2944();
            }
        }

        public function _Str_7636():void
        {
            this._view._Str_7636();
        }

        public function _Str_17979(k:int):GroupItem
        {
            var _local_2:Array;
            var _local_3:GroupItem;
            var _local_5:IFurnitureItem;
            var _local_4:int;
            while (_local_4 < this._furniData.length)
            {
                _local_3 = (this._furniData[_local_4] as GroupItem);
                _local_5 = _local_3.remove(k);
                if (_local_5)
                {
                    if (this._itemIdInFurniPlacing == _local_5.ref)
                    {
                        this._Str_5298();
                        if (!this._Str_5337())
                        {
                            this._controller._Str_4731();
                        }
                    }
                    if (_local_3.getTotalCount() <= 0)
                    {
                        this._furniData.splice(_local_4, 1);
                        if (((this._view) && (this._view.grid)))
                        {
                            this._view.grid._Str_9854(_local_3);
                        }
                        if (_local_3._Str_2365)
                        {
                            this._Str_14744();
                        }
                        _local_3.dispose();
                    }
                    else
                    {
                        this._view._Str_2944();
                    }
                    this._view._Str_7636();
                    return _local_3;
                }
                _local_4++;
            }
            return null;
        }

        public function _Str_22816(k:int, _arg_2:int):void
        {
            var _local_3:GroupItem;
            var _local_4:FurnitureItem;
            var _local_5:LegacyStuffData;
            for each (_local_3 in this._furniData)
            {
                _local_4 = (_local_3._Str_2990(k) as FurnitureItem);
                if (_local_4 != null)
                {
                    _local_5 = (_local_4.stuffData as LegacyStuffData);
                    _local_5.setString(String(_arg_2));
                    _local_4.stuffData = _local_5;
                    _local_3._Str_23685(k, _local_4);
                }
            }
        }

        public function _Str_14744():void
        {
            var _local_2:GroupItem;
            var k:IWindowContainer = this._view._Str_15980();
            if (k == null)
            {
                return;
            }
            for each (_local_2 in this._furniData)
            {
                if (_local_2.window == k)
                {
                    _local_2._Str_2365 = true;
                    _local_2._Str_4405 = -1;
                    break;
                }
            }
            this._view._Str_2944();
        }

        public function _Str_12834(k:GroupItem):void
        {
            if (((this._view) && (!(this._view.disposed))))
            {
                this._view._Str_12834(k);
            }
        }

        public function _Str_3968():GroupItem
        {
            var k:GroupItem;
            for each (k in this._furniData)
            {
                if (k._Str_2365)
                {
                    return k;
                }
            }
            return null;
        }

        public function _Str_19669():void
        {
            var k:GroupItem;
            for each (k in this._furniData)
            {
                k._Str_2365 = false;
            }
        }

        public function _Str_16742():Boolean
        {
            return this._controller._Str_16742();
        }

        public function _Str_12838():void
        {
            var k:GroupItem;
            for each (k in this._furniData)
            {
                k._Str_12838();
            }
            if (this._view != null)
            {
                this._view._Str_2944();
            }
        }

        public function _Str_5298():void
        {
            if (this._itemIdInFurniPlacing > -1)
            {
                this._roomEngine.cancelRoomObjectInsert();
                this._isObjectMoverRequested = false;
                this._itemIdInFurniPlacing = -1;
            }
        }

        public function _Str_5337(k:Boolean=false):Boolean
        {
            var _local_3:FurnitureItem;
            var _local_2:GroupItem = this._Str_3968();
            if (_local_2 == null)
            {
                return false;
            }
            if (_local_2.getUnlockedCount() == 0)
            {
                return false;
            }
            if (_local_2._Str_4405 >= 0)
            {
                _local_3 = _local_2._Str_5087(_local_2._Str_4405);
                if (!_local_3)
                {
                    _local_3 = _local_2._Str_3205();
                }
            }
            else
            {
                _local_3 = _local_2._Str_3205();
            }
            if (_local_3 == null)
            {
                return false;
            }
            if (((_local_3.rentable) && (_local_3.flatId > -1)))
            {
                return false;
            }
            if ((((_local_3.category == FurniCategory._Str_3683) || (_local_3.category == FurniCategory._Str_3639)) || (_local_3.category == FurniCategory._Str_3432)))
            {
                if (k)
                {
                    return false;
                }
                this._communication.connection.send(new _Str_5270(_local_3.id));
            }
            else
            {
                this._Str_12029(_local_3);
            }
            this._view._Str_2944();
            return true;
        }

        public function _Str_21349(itemsToTrade:int=1, offerInTradingCount:ITextFieldWindow=null):void
        {
            var furnitureItem:IFurnitureItem;
            var ownItemCount:int;
            var groupItem:GroupItem = this._Str_3968();
            if (groupItem == null)
            {
                return;
            }
            var itemsInTrade:Vector.<IFurnitureItem> = groupItem._Str_25861(itemsToTrade);
            if (itemsInTrade.length == 0)
            {
                return;
            }
            var coreItem:IFurnitureItem;
            var itemIds:Vector.<int> = new Vector.<int>();
            for each (furnitureItem in itemsInTrade)
            {
                itemIds.push(furnitureItem.id);
                if (coreItem == null)
                {
                    coreItem = furnitureItem;
                }
            }
            if (coreItem == null)
            {
                return;
            }
            var trading:TradingModel = this._controller._Str_3957;
            if (trading != null)
            {
                ownItemCount = trading._Str_21112().length;
                if ((ownItemCount + itemIds.length) <= 1500)
                {
                    if (offerInTradingCount != null)
                    {
                        offerInTradingCount.caption = String(itemIds.length);
                    }
                    trading._Str_24612(itemIds, coreItem._Str_2770, coreItem.type, coreItem.category, coreItem._Str_13551, coreItem.stuffData);
                }
                else
                {
                    if (offerInTradingCount != null)
                    {
                        offerInTradingCount.caption = "1";
                    }
                    this._windowManager.alert("${trading.items.too_many_items.title}", "${trading.items.too_many_items.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                }
            }
            else
            {
                if (offerInTradingCount != null)
                {
                    offerInTradingCount.caption = "1";
                }
            }
            this._view._Str_2944();
        }

        public function _Str_10094():void
        {
            var k:GroupItem = this._Str_3968();
            if (k == null)
            {
                return;
            }
            var _local_2:FurnitureItem = k._Str_3205();
            if (_local_2 == null)
            {
                return;
            }
            if (this._communication == null)
            {
                return;
            }
            var _local_3:IConnection = this._communication.connection;
            if (_local_3 == null)
            {
                return;
            }
            _local_3.send(new _Str_5756(_local_2.flatId));
            this._roomItemToSelect = _local_2;
        }

        public function _Str_25554():void
        {
            var k:GroupItem = this._Str_3968();
            if (k == null)
            {
                return;
            }
            var _local_2:FurnitureItem = k._Str_21356();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:MarketplaceModel = this._controller._Str_6398;
            if (_local_3 == null)
            {
                return;
            }
            _local_3._Str_24075(_local_2);
        }

        public function _Str_15313():IFurnitureItem
        {
            var k:GroupItem = this._Str_3968();
            if (k == null)
            {
                return null;
            }
            var _local_2:IFurnitureItem = k._Str_25739();
            if (_local_2 == null)
            {
                return null;
            }
            this._view._Str_2944();
            return _local_2;
        }

        public function _Str_25520():void
        {
            if (this._Str_7553)
            {
                this._Str_21349();
            }
            else
            {
                this._Str_5337(false);
            }
        }

        public function _Str_22716():void
        {
            this._controller._Str_13252();
        }

        public function showUseProductSelection():void
        {
            var _local_2:IFurnitureItem;
            var k:GroupItem = this._Str_3968();
            if (((!(k == null)) && (!(k._Str_3205() == null))))
            {
                _local_2 = k._Str_3205();
                if (_local_2)
                {
                    this._roomEngine.showUseProductSelection(_local_2.ref, _local_2.type);
                }
            }
        }

        public function _Str_5813(k:String):void
        {
            switch (k)
            {
                case InventorySubCategory.TRADING:
                    this._Str_5298();
                    if (this._view != null)
                    {
                        this._view._Str_2944();
                    }
                    return;
                case InventorySubCategory.EMPTY:
                    this._Str_12838();
                    if (this._view != null)
                    {
                        this._view._Str_2944();
                    }
                    return;
            }
        }

        public function _Str_2944():void
        {
            this._view._Str_2944();
        }

        public function _Str_2491():void
        {
            if (this._view != null)
            {
                this._view._Str_2944();
                this._view._Str_7221();
            }
        }

        public function _Str_4409():void
        {
            var _local_2:GroupItem;
            if (!this._view)
            {
                return;
            }
            var k:Boolean;
            if (this._category == InventoryCategory.RENTABLES)
            {
                this._controller._Str_3455._Str_8813(UnseenItemCategoryEnum.RENTABLE);
                k = true;
            }
            else
            {
                this._controller._Str_3455._Str_8813(UnseenItemCategoryEnum.FURNI);
            }
            for each (_local_2 in this._furniData)
            {
                if (((_local_2._Str_6126) && (_local_2._Str_3459 == k)))
                {
                    _local_2._Str_6126 = false;
                }
            }
            this._controller._Str_6956();
        }

        public function _Str_22285():void
        {
            var _local_4:Array;
            var _local_5:GroupItem;
            var _local_6:int;
            if (((!(this._view)) || (!(this._view.grid))))
            {
                return;
            }
            var k:Array = [];
            var _local_2:Array = this._controller._Str_3455._Str_11239(UnseenItemCategoryEnum.FURNI);
            var _local_3:Array = this._controller._Str_3455._Str_11239(UnseenItemCategoryEnum.RENTABLE);
            k = k.concat(_local_2);
            k = k.concat(_local_3);
            if (((!(k)) || (k.length == 0)))
            {
                return;
            }
            for each (_local_5 in this._furniData)
            {
                _local_4 = _local_5._Str_24519();
                for each (_local_6 in _local_4)
                {
                    if (k.indexOf(_local_6) != -1)
                    {
                        _local_5._Str_6126 = true;
                        this._Str_21263(_local_5);
                        this._view.grid._Str_9854(_local_5);
                        break;
                    }
                }
            }
        }

        public function _Str_25502():void
        {
            var k:GroupItem = this._Str_3968();
            if (k == null)
            {
                return;
            }
            var _local_2:FurnitureItem = k._Str_3205();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IFurnitureData = this._controller.getFurnitureData(_local_2.type, ((_local_2._Str_2770) ? ProductTypeEnum.WALL : ProductTypeEnum.FLOOR));
            this._catalog.openRentConfirmationWindow(_local_3, false, -1, _local_2.id);
        }

        public function _Str_22829():void
        {
            var k:GroupItem = this._Str_3968();
            if (k == null)
            {
                return;
            }
            var _local_2:FurnitureItem = k._Str_3205();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IFurnitureData = this._controller.getFurnitureData(_local_2.type, ((_local_2._Str_2770) ? ProductTypeEnum.WALL : ProductTypeEnum.FLOOR));
            this._catalog.openRentConfirmationWindow(_local_3, true, -1, _local_2.id);
        }

        private function _Str_18724(k:GroupItem):void
        {
            this._furniData.unshift(k);
        }

        private function _Str_19354(k:GroupItem):void
        {
            this._furniData.push(k);
        }

        private function removeItem(k:GroupItem):void
        {
            var _local_2:int = this._furniData.indexOf(k);
            if (_local_2 > -1)
            {
                this._furniData.splice(_local_2, 1);
            }
        }

        private function _Str_21263(k:GroupItem):void
        {
            this.removeItem(k);
            this._Str_18724(k);
        }

        private function _Str_23292():Vector.<int>
        {
            var _local_2:GroupItem;
            var _local_3:int;
            var _local_4:int;
            var k:Vector.<int> = new Vector.<int>(0);
            for each (_local_2 in this._furniData)
            {
                _local_3 = _local_2.getTotalCount();
                if (_local_2.category == FurniCategory._Str_12351)
                {
                    _local_3 = 1;
                }
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    k.push(_local_2._Str_5087(_local_4).id);
                    _local_4++;
                }
            }
            return k;
        }

        private function _Str_19135():void
        {
            var k:GroupItem;
            if (!this._imageUpdateTimer.running)
            {
                this._imageUpdateTimer.start();
            }
            if (((this._view) && (this._view._Str_12561)))
            {
                for each (k in this._view._Str_12561)
                {
                    if (!k._Str_23694)
                    {
                        k._Str_20973(false);
                        break;
                    }
                }
            }
        }

        private function _Str_14402(k:int):GroupItem
        {
            var _local_2:GroupItem;
            for each (_local_2 in this._furniData)
            {
                if (_local_2._Str_2990(k) !== null)
                {
                    return _local_2;
                }
            }
            return null;
        }

        private function _Str_3613(k:FurnitureItem):Boolean
        {
            var _local_2:int;
            if (k.rentable)
            {
                _local_2 = UnseenItemCategoryEnum.RENTABLE;
            }
            else
            {
                _local_2 = UnseenItemCategoryEnum.FURNI;
            }
            return this._controller._Str_3455._Str_3613(_local_2, k.id);
        }

        private function _Str_22387(k:FurnitureItem, _arg_2:Boolean):GroupItem
        {
            var _local_3:GroupItem;
            var _local_5:Boolean;
            var _local_4:Vector.<GroupItem> = new Vector.<GroupItem>(0);
            for each (_local_3 in this._furniData)
            {
                if (_local_3.type == k.type)
                {
                    _local_4.push(_local_3);
                }
            }
            for each (_local_3 in _local_4)
            {
                if (_local_3._Str_2990(k.id) != null)
                {
                    return _local_3;
                }
            }
            _local_5 = this._Str_3613(k);
            _local_3 = this._Str_18196(k.type, k.category, k.stuffData, k._Str_2794, _arg_2);
            _local_3.push(k, _local_5);
            if (_local_5)
            {
                _local_3._Str_6126 = true;
                this._Str_18724(_local_3);
            }
            else
            {
                this._Str_19354(_local_3);
            }
            if (((this._view) && (this._view.grid)))
            {
                this._view.grid._Str_9854(_local_3);
            }
            return _local_3;
        }

        private function _Str_23860(k:FurnitureItem, _arg_2:Boolean):GroupItem
        {
            var _local_4:GroupItem;
            var _local_5:GroupItem;
            var _local_3:Boolean = this._Str_3613(k);
            for each (_local_5 in this._furniData)
            {
                if ((((_local_5.type == k.type) && (_local_5._Str_2770 == k._Str_2770)) && (_local_5.isGroupable)))
                {
                    if (k.category == FurniCategory._Str_5186)
                    {
                        if (_local_5.stuffData.getLegacyString() == k.stuffData.getLegacyString())
                        {
                            _local_4 = _local_5;
                            break;
                        }
                    }
                    else
                    {
                        if (k.category == FurniCategory._Str_12454)
                        {
                            if (k.stuffData.compare(_local_5.stuffData))
                            {
                                _local_4 = _local_5;
                                break;
                            }
                        }
                        else
                        {
                            _local_4 = _local_5;
                            break;
                        }
                    }
                }
            }
            if (_local_4)
            {
                _local_4.push(k, _local_3);
                if (_local_3)
                {
                    _local_4._Str_6126 = true;
                    this._Str_21263(_local_4);
                }
                if (((this._view) && (this._view.grid)))
                {
                    this._view.grid._Str_9854(_local_4);
                }
                return _local_4;
            }
            _local_5 = this._Str_18196(k.type, k.category, k.stuffData, k._Str_2794, _arg_2);
            _local_5.push(k, _local_3);
            if (_local_3)
            {
                _local_5._Str_6126 = true;
                this._Str_18724(_local_5);
            }
            else
            {
                this._Str_19354(_local_5);
            }
            if (((this._view) && (this._view.grid)))
            {
                this._view.grid._Str_9854(_local_5);
            }
            return _local_5;
        }

        private function _Str_12029(k:FurnitureItem):void
        {
            var _local_2:int;
            var _local_3:Boolean;
            if (k._Str_2770)
            {
                _local_2 = RoomObjectCategoryEnum.CONST_20;
            }
            else
            {
                _local_2 = RoomObjectCategoryEnum.CONST_10;
            }
            if (((k.category == FurniCategory._Str_5186) || (this._Str_22524(k))))
            {
                _local_3 = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.INVENTORY, k.id, _local_2, k.type, k.stuffData.getLegacyString());
            }
            else
            {
                _local_3 = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.INVENTORY, k.id, _local_2, k.type, k._Str_2794.toString(), k.stuffData);
            }
            if (_local_3)
            {
                this._itemIdInFurniPlacing = k.ref;
                if (!this._controller._Str_5568.running)
                {
                    this._Str_22716();
                }
                this._isObjectMoverRequested = true;
            }
            this._view._Str_2944();
        }

        private function _Str_22524(k:FurnitureItem):Boolean
        {
            var _local_2:IFurnitureData = this._catalog.getFurnitureData(k.type, ProductTypeEnum.WALL);
            return (_local_2) && (_local_2.isExternalImageType);
        }

        private function _Str_24099():void
        {
            var _local_2:int;
            this._Str_19669();
            var k:GroupItem = this._categorySelection[this._category];
            if (k != null)
            {
                _local_2 = this._furniData.indexOf(k);
                if (_local_2 > -1)
                {
                    k._Str_2365 = true;
                    k._Str_4405 = -1;
                }
            }
            else
            {
                this._Str_14744();
            }
            this._view._Str_2944();
        }

        public function _Str_6946(k:Event):void
        {
            if (((this._isObjectMoverRequested) && (k.type == RoomEngineObjectEvent.PLACED)))
            {
                this._isObjectMoverRequested = false;
                if (!(k as RoomEngineObjectPlacedEvent)._Str_4057)
                {
                    this._controller._Str_4731();
                }
                else
                {
                    if (this._category == InventoryCategory.RENTABLES)
                    {
                        this._controller._Str_4731();
                    }
                }
            }
        }

        private function _Str_20314(k:TimerEvent):void
        {
            var _local_2:Vector.<int>;
            var _local_3:GroupItem;
            var _local_4:int;
            var _local_5:FurnitureItem;
            this._Str_19135();
            this._imageUpdateCumulativeTime = (this._imageUpdateCumulativeTime + _Str_14184);
            if (this._imageUpdateCumulativeTime >= 1000)
            {
                _local_2 = new Vector.<int>(0);
                for each (_local_3 in this._furniData)
                {
                    _local_5 = _local_3._Str_5087(0);
                    if (((((_local_5) && (_local_5.rentable)) && (_local_5.hasRentPeriodStarted)) && (_local_5.secondsToExpiration <= 0)))
                    {
                        _local_2.push(_local_5.id);
                    }
                }
                for each (_local_4 in _local_2)
                {
                    this._Str_17979(_local_4);
                }
                if (_local_2.length > 0)
                {
                    this._view._Str_7221();
                }
                this._view._Str_19739();
                this._imageUpdateCumulativeTime = 0;
            }
        }

        public function _Str_15723():void
        {
            var k:int;
            this._isInRoom = true;
            if (this._roomItemToSelect == null)
            {
                return;
            }
            if (this._roomEngine != null)
            {
                k = ((this._roomItemToSelect._Str_2770) ? RoomObjectCategoryEnum.CONST_20 : RoomObjectCategoryEnum.CONST_10);
                this._roomEngine._Str_5538(this._roomItemToSelect.flatId, Math.abs(this._roomItemToSelect.id), k);
            }
            this._roomItemToSelect = null;
        }

        public function _Str_13202():void
        {
            this._isInRoom = false;
        }

        public function _Str_5725(k:String):void
        {
            var _local_2:GroupItem = this._Str_14402(-(int(k)));
            if (_local_2 != null)
            {
                this._Str_21498 = _local_2;
            }
        }
    }
}
