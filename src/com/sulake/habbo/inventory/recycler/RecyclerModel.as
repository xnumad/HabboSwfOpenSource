package com.sulake.habbo.inventory.recycler
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.core.window.IWindowContainer;

    public class RecyclerModel implements IInventoryModel 
    {
        public static const _Str_599:uint = 0;
        public static const _Str_4158:uint = 1;

        private var _habboInventory:HabboInventory;
        private var _assetLibrary:IAssetLibrary;
        private var _roomEngine:IRoomEngine;
        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _disposed:Boolean = false;
        private var _running:Boolean = false;
        private var _state:uint = 0;
        private var _Str_2338:Map;

        public function RecyclerModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:IHabboLocalizationManager)
        {
            this._habboInventory = k;
            this._communicationManager = _arg_3;
            this._assetLibrary = _arg_4;
            this._roomEngine = _arg_5;
            this._localizationManager = _arg_6;
        }

        public function get running():Boolean
        {
            return this._state == _Str_4158;
        }

        public function get state():uint
        {
            return this._state;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set state(k:uint):void
        {
            this._state = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._habboInventory = null;
                this._communicationManager = null;
                this._assetLibrary = null;
                this._roomEngine = null;
                this._localizationManager = null;
                this._disposed = true;
            }
            this._Str_20195();
        }

        public function _Str_22646():void
        {
            if (((this._habboInventory == null) || (this._habboInventory._Str_2834 == null)))
            {
                return;
            }
            this._state = _Str_4158;
            this._Str_2338 = new Map();
            this._habboInventory._Str_2834._Str_14978(true);
        }

        public function _Str_20195():void
        {
            var _local_2:int;
            if ((((this._Str_2338 == null) || (this._habboInventory == null)) || (this._habboInventory._Str_2834 == null)))
            {
                return;
            }
            this._state = _Str_599;
            this._habboInventory._Str_2834._Str_14978(false);
            var k:int;
            while (k < this._Str_2338.length)
            {
                _local_2 = this._Str_2338.getKey(k);
                this._habboInventory._Str_2834._Str_10184(_local_2);
                k++;
            }
            this._Str_2338 = null;
        }

        public function _Str_22697():int
        {
            if ((((this._Str_2338 == null) || (this._habboInventory == null)) || (this._habboInventory._Str_2834 == null)))
            {
                return 0;
            }
            var k:IFurnitureItem = this._habboInventory._Str_2834._Str_15313();
            if (k == null)
            {
                return 0;
            }
            if (this._Str_2338.getValue(k.id) == null)
            {
                this._Str_2338.add(k.id, k);
            }
            return k.id;
        }

        public function _Str_23825(k:int):Boolean
        {
            if (this._Str_2338 == null)
            {
                return true;
            }
            var _local_2:IFurnitureItem = this._Str_2338.getValue(k);
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:FurniModel = this._habboInventory._Str_2834;
            if (_local_3 == null)
            {
                return false;
            }
            _local_3._Str_10184(k);
            this._Str_2338.remove(k);
            return true;
        }

        public function _Str_23744():Array
        {
            var k:Array = new Array();
            if (this._Str_2338 == null)
            {
                return [];
            }
            var _local_2:int;
            while (_local_2 < this._Str_2338.length)
            {
                k.push(this._Str_2338.getKey(_local_2));
                _local_2++;
            }
            return k;
        }

        public function _Str_5100():void
        {
        }

        public function _Str_4889():void
        {
        }

        public function _Str_5913(k:String):void
        {
        }

        public function _Str_5813(k:String):void
        {
        }

        public function getWindowContainer():IWindowContainer
        {
            return null;
        }

        public function _Str_2491():void
        {
        }

        public function _Str_5725(k:String):void
        {
            Logger.log("NOT SUPPORTED: MARKETPLACE SELECT BY ID");
        }
    }
}
