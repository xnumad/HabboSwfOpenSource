package com.sulake.habbo.inventory.pets
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.outgoing._Str_461._Str_10323;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_2848;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import flash.events.Event;
    import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.room.enum.RoomObjectPlacementSource;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_8042;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;

    public class PetsModel implements IInventoryModel 
    {
        private var _controller:HabboInventory;
        private var _view:PetsView;
        private var _assets:IAssetLibrary;
        private var _communication:IHabboCommunicationManager;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboCatalog;
        private var _pets:Map;
        private var _isPlacing:Boolean = false;
        private var _disposed:Boolean = false;
        private var _isListInitialized:Boolean;

        public function PetsModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:IHabboCatalog)
        {
            this._controller = k;
            this._assets = _arg_4;
            this._communication = _arg_3;
            this._roomEngine = _arg_5;
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.PLACED, this._Str_6946);
            this._catalog = _arg_6;
            this._pets = new Map();
            this._view = new PetsView(this, _arg_2, _arg_4, _arg_5);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._view)
                {
                    this._view.dispose();
                    this._view = null;
                }
                if (this._roomEngine)
                {
                    if (this._roomEngine.events)
                    {
                        this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.PLACED, this._Str_6946);
                    }
                    this._roomEngine = null;
                }
                if (this._pets)
                {
                    this._pets.dispose();
                    this._pets = null;
                }
                this._controller = null;
                this._catalog = null;
                this._assets = null;
                this._communication = null;
                this._disposed = true;
            }
        }

        public function get controller():HabboInventory
        {
            return this._controller;
        }

        public function _Str_18819():Boolean
        {
            return this._isListInitialized;
        }

        public function _Str_11524():void
        {
            this._isListInitialized = true;
            this._view._Str_3820();
        }

        public function _Str_22384():void
        {
            if (this._communication == null)
            {
                return;
            }
            var k:IConnection = this._communication.connection;
            if (k == null)
            {
                return;
            }
            k.send(new _Str_10323());
        }

        public function get pets():Map
        {
            return this._pets;
        }

        public function _Str_9947(k:_Str_2848):void
        {
            if (this._pets.add(k.id, k))
            {
                this._view._Str_9947(k);
            }
            this._view._Str_3820();
        }

        public function _Str_25168(k:Map):void
        {
            var _local_2:int;
            var _local_3:Array = k.getKeys();
            var _local_4:Array = this._pets.getKeys();
            this._controller._Str_5943(InventoryCategory.PETS);
            for each (_local_2 in _local_4)
            {
                if (_local_3.indexOf(_local_2) == -1)
                {
                    this._pets.remove(_local_2);
                    this._view._Str_12321(_local_2);
                }
            }
            for each (_local_2 in _local_3)
            {
                if (_local_4.indexOf(_local_2) == -1)
                {
                    this._pets.add(_local_2, k.getValue(_local_2));
                    this._view._Str_9947(k.getValue(_local_2));
                }
            }
            this._Str_11524();
        }

        public function _Str_12321(k:int):void
        {
            this._pets.remove(k);
            this._view._Str_12321(k);
            this._view._Str_3820();
        }

        public function _Str_4889():void
        {
            this._Str_22384();
        }

        public function _Str_5913(k:String):void
        {
            if (((k == InventoryCategory.PETS) && (this._controller.isVisible)))
            {
                this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_PETS));
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            return this._view.getWindowContainer();
        }

        public function _Str_5100():void
        {
            if (this._view.isVisible)
            {
                this._Str_4409();
            }
        }

        public function _Str_5813(k:String):void
        {
        }

        public function _Str_6675(k:int, _arg_2:Boolean=false):Boolean
        {
            var _local_5:int;
            var _local_3:_Str_2848 = this._Str_22756(k);
            if (_local_3 == null)
            {
                return false;
            }
            var _local_4:String;
            if (_local_3.typeId == PetTypeEnum.MONSTERPLANT)
            {
                if (_local_3.level >= 7)
                {
                    _local_4 = "std";
                }
                else
                {
                    _local_4 = ("grw" + _local_3.level);
                }
            }
            if (this._controller.roomSession.isRoomController)
            {
                _local_5 = (_local_3.id * -1);
                this._isPlacing = this._roomEngine.initializeRoomObjectInsert(RoomObjectPlacementSource.INVENTORY, _local_5, RoomObjectCategoryEnum.CONST_100, RoomObjectTypeEnum.PET, _local_3.figureString, null, -1, -1, _local_4);
                this._controller._Str_13252();
                return this._isPlacing;
            }
            if (!this._controller.roomSession._Str_9439)
            {
                return false;
            }
            if (!_arg_2)
            {
                this._communication.connection.send(new _Str_8042(_local_3.id, 0, 0));
            }
            return true;
        }

        public function _Str_2491():void
        {
            if (this._view == null)
            {
                return;
            }
            this._view.update();
        }

        private function _Str_22756(k:int):_Str_2848
        {
            var _local_2:_Str_2848;
            for each (_local_2 in this._pets)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_6946(k:Event):void
        {
            if (k == null)
            {
                return;
            }
            if (((this._isPlacing) && (k.type == RoomEngineObjectEvent.PLACED)))
            {
                this._controller._Str_4731();
                this._isPlacing = false;
            }
        }

        public function get roomSession():IRoomSession
        {
            return this._controller.roomSession;
        }

        public function _Str_19310():void
        {
            this._view.update();
        }

        public function _Str_4409():void
        {
            this._controller._Str_3455._Str_8813(UnseenItemCategoryEnum.PET);
            this._controller._Str_6956();
            this._view.update();
        }

        public function _Str_3613(k:int):Boolean
        {
            return this._controller._Str_3455._Str_3613(UnseenItemCategoryEnum.PET, k);
        }

        public function _Str_7938(k:int):Boolean
        {
            var _local_2:Boolean;
            if (this._Str_3613(k))
            {
                _local_2 = this._controller._Str_3455._Str_16745(UnseenItemCategoryEnum.PET, k);
                if (_local_2)
                {
                    this._controller._Str_3455._Str_17159(UnseenItemCategoryEnum.PET);
                }
            }
            return _local_2;
        }

        public function _Str_5725(k:String):void
        {
            this._view._Str_16613(int(k));
        }
    }
}
