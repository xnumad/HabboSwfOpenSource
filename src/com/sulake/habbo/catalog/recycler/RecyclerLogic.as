package com.sulake.habbo.catalog.recycler
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_5376;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_4691;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class RecyclerLogic implements IRecycler 
    {
        private static const _Str_13868:int = 0;
        private static const _Str_9243:int = 1;
        private static const _Str_13576:int = 2;

        private var _Str_6624:int = 0;
        private var _Str_16884:int;
        private var _Str_3602:Array;
        private var _habboCatalog:HabboCatalog;
        private var _windowManager:IHabboWindowManager;
        private var _Str_2271:_Str_7232;
        private var _Str_3154:Array;
        private var _Str_7638:int;

        public function RecyclerLogic(k:HabboCatalog, _arg_2:IHabboWindowManager)
        {
            this._Str_3602 = new Array();
            super();
            this._habboCatalog = k;
            this._windowManager = _arg_2;
            this._Str_7638 = k.getInteger("recycler.number_of_slots", 5);
        }

        private function get _Str_14201():Boolean
        {
            return !(this._Str_6624 == _Str_13868);
        }

        private function get _Str_12921():Boolean
        {
            return !(this._Str_16884 == _Str_5376._Str_14635);
        }

        private function get ready():Boolean
        {
            return (this.active) && (this._Str_6624 == _Str_9243);
        }

        public function get active():Boolean
        {
            return (this._Str_14201) && (this._Str_12921);
        }

        public function get numberOfSlots():int
        {
            return this._Str_7638;
        }

        public function dispose():void
        {
            this._Str_3602 = null;
            this._habboCatalog = null;
            this._windowManager = null;
        }

        public function init(k:_Str_7232=null):void
        {
            this._Str_6624 = _Str_13576;
            this._Str_3602 = new Array(this._Str_7638);
            if (k == null)
            {
                return;
            }
            this._Str_2271 = k;
            this._habboCatalog.getRecyclerStatus();
        }

        public function activate():void
        {
            if (this._Str_12921)
            {
                this._Str_6624 = _Str_9243;
            }
        }

        public function cancel():void
        {
            this._habboCatalog.setupInventoryForRecycler(false);
            var k:int;
            while (k < this._Str_7638)
            {
                this.releaseSlot(k);
                k++;
            }
            this._Str_6624 = _Str_13868;
        }

        public function empty():void
        {
            var k:int;
            while (k < this._Str_7638)
            {
                this.releaseSlot(k);
                k++;
            }
            this._Str_15040();
            this._Str_8448();
        }

        public function _Str_25018(k:int, _arg_2:int):void
        {
            this._Str_16884 = k;
            if (!this._Str_12921)
            {
                return;
            }
            switch (this._Str_16884)
            {
                case _Str_5376._Str_16635:
                    this._Str_6624 = _Str_9243;
                    if (((this._Str_2271 == null) || (this._Str_2271.disposed)))
                    {
                        return;
                    }
                    this._Str_2271._Str_19869();
                    this._habboCatalog.setupInventoryForRecycler(true);
                    this._Str_21753();
                    this._Str_15040();
                    this._Str_8448();
                    return;
                case _Str_5376._Str_14635:
                    if (((this._Str_2271 == null) || (this._Str_2271.disposed)))
                    {
                        return;
                    }
                    this._Str_2271._Str_17679();
                    this._habboCatalog.setupInventoryForRecycler(false);
                    return;
                case _Str_5376._Str_16908:
                    if (((this._Str_2271 == null) || (this._Str_2271.disposed)))
                    {
                        return;
                    }
                    this._Str_2271._Str_19627(_arg_2);
                    this._habboCatalog.setupInventoryForRecycler(false);
                    return;
            }
        }

        public function _Str_22958(status:int, prizeId:int):void
        {
            if (!this._Str_14201)
            {
                return;
            }
            this._Str_6624 = _Str_9243;
            if (!this._Str_12921)
            {
                return;
            }
            switch (status)
            {
                case _Str_4691._Str_15052:
                    if (this._Str_2271 != null)
                    {
                        this._Str_2271._Str_20131();
                    }
                    break;
                case _Str_4691._Str_18717:
                    Logger.log("* Recycler finished with FAILURE");
                    this._windowManager.alert("${generic.alert.title}", "${recycler.info.closed}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    if (this._Str_2271 != null)
                    {
                        this._Str_2271._Str_17679();
                    }
                    break;
            }
            this._habboCatalog.setupInventoryForRecycler(false);
        }

        public function _Str_18924(k:int):_Str_3718
        {
            if (this._Str_3602 == null)
            {
                return null;
            }
            if (k >= this._Str_3602.length)
            {
                return null;
            }
            return this._Str_3602[k];
        }

        public function placeObjectAtSlot(slotId:int, id:int, category:int, typeId:int, xxxExtra:String):void
        {
            var oldObjectData:_Str_3718;
            var newSlotId:int;
            if (!this.ready)
            {
                return;
            }
            if (this._Str_3602.length > 0)
            {
                oldObjectData = this._Str_3602[0];
                newSlotId = 0;
                while (((!(oldObjectData == null)) && (newSlotId < this._Str_7638)))
                {
                    oldObjectData = this._Str_3602[newSlotId];
                    if (oldObjectData != null)
                    {
                        newSlotId = (newSlotId + 1);
                    }
                }
                if (oldObjectData == null)
                {
                    slotId = newSlotId;
                }
                else
                {
                    return;
                }
            }
            var itemId:int = this._habboCatalog.requestInventoryFurniToRecycler();
            if (itemId == 0)
            {
                this._windowManager.alert("${generic.alert.title}", "${recycler.alert.non.recyclable}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
                return;
            }
            this._Str_3602[slotId] = new _Str_3718(itemId, category, typeId, xxxExtra);
            this._Str_15040();
            this._Str_8448();
        }

        public function releaseSlot(k:int):void
        {
            if (!this.ready)
            {
                return;
            }
            if (this._Str_3602[k] == null)
            {
                return;
            }
            if (!this._habboCatalog.returnInventoryFurniFromRecycler(this._Str_3602[k].id))
            {
                return;
            }
            this._Str_3602[k] = null;
            this._Str_15040();
            this._Str_8448();
        }

        public function executeRecycler():void
        {
            var _local_3:_Str_3718;
            if (!this.isReadyToRecycle())
            {
                return;
            }
            this._Str_6624 = _Str_13576;
            this._Str_8448();
            var k:Array = new Array();
            var _local_2:int;
            while (_local_2 < this._Str_3602.length)
            {
                _local_3 = this._Str_3602[_local_2];
                if (_local_3 == null)
                {
                    return;
                }
                k.push(_local_3.id);
                _local_2++;
            }
            this._habboCatalog.sendRecycleItems(k);
            this._Str_2271._Str_20090();
        }

        public function isReadyToRecycle():Boolean
        {
            if (((!(this.ready)) || (!(this._habboCatalog.privateRoomSessionActive))))
            {
                return false;
            }
            if (this._Str_22951())
            {
                this._windowManager.alert("${generic.alert.title}", "${recycler.alert.trading}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
                return false;
            }
            return this._Str_23847();
        }

        public function _Str_19372(k:Boolean):void
        {
            if (k == false)
            {
                this.empty();
                this._Str_21753();
            }
            this._Str_8448();
        }

        private function _Str_21753():void
        {
            if (((!(this._habboCatalog.privateRoomSessionActive)) && (this.ready)))
            {
                this._windowManager.alert("${generic.alert.title}", "${recycler.alert.privateroom}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
            }
        }

        private function _Str_15040():void
        {
            if (((this._Str_2271 == null) || (!(this._Str_14201))))
            {
                return;
            }
            this._Str_2271._Str_15301();
        }

        private function _Str_8448():void
        {
            if (((this._Str_2271 == null) || (!(this._Str_14201))))
            {
                return;
            }
            this._Str_2271._Str_20203(this.isReadyToRecycle());
        }

        private function _Str_23847():Boolean
        {
            if (this._Str_3602 == null)
            {
                return false;
            }
            if (this._Str_3602.length < this._Str_7638)
            {
                return false;
            }
            var k:int;
            while (k < this._Str_3602.length)
            {
                if (this._Str_3602[k] == null)
                {
                    return false;
                }
                k++;
            }
            return true;
        }

        private function _Str_22951():Boolean
        {
            return this._habboCatalog.tradingActive;
        }

        public function _Str_22273(k:Array):void
        {
            var _local_3:PrizeLevelContainer;
            this._Str_3154 = new Array();
            var _local_2:int;
            while (_local_2 < k.length)
            {
                _local_3 = new PrizeLevelContainer(k[_local_2], this._habboCatalog);
                this._Str_3154.push(_local_3);
                _local_2++;
            }
        }

        public function getPrizeTable():Array
        {
            if (this._Str_3154 == null)
            {
                this._habboCatalog.getRecyclerPrizes();
                return null;
            }
            return this._Str_3154;
        }
    }
}
