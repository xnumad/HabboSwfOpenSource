package com.sulake.habbo.inventory
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9435;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7601;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
    import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_498._Str_10536;
    import com.sulake.habbo.communication.messages.outgoing._Str_498._Str_11812;

    public class UnseenItemTracker implements IUnseenItemTracker 
    {
        private var _communication:IHabboCommunicationManager;
        private var _inventory:HabboInventory;
        private var _unseenItems:Dictionary;
        private var _events:IEventDispatcher;

        public function UnseenItemTracker(k:IHabboCommunicationManager, _arg_2:IEventDispatcher, _arg_3:HabboInventory)
        {
            this._communication = k;
            this._inventory = _arg_3;
            this._events = _arg_2;
            this._unseenItems = new Dictionary();
            this._communication.addHabboConnectionMessageEvent(new _Str_9435(this._Str_14461));
        }

        public function dispose():void
        {
            this._communication = null;
            this._unseenItems = null;
        }

        public function _Str_8813(k:int):Boolean
        {
            if (this._Str_5621(k) == 0)
            {
                return false;
            }
            delete this._unseenItems[k];
            this._Str_20981(k);
            this._Str_12141();
            return true;
        }

        public function _Str_18075(k:int, _arg_2:Array):Boolean
        {
            var _local_4:int;
            if (this._Str_5621(k) == 0)
            {
                return false;
            }
            var _local_3:Array = this._unseenItems[k];
            for each (_local_4 in _arg_2)
            {
                _local_3.splice(_local_3.indexOf(_local_4), 1);
            }
            this._Str_23994(k, _arg_2);
            this._Str_12141();
            return true;
        }

        public function _Str_17159(k:int):Boolean
        {
            if (this._Str_5621(k) == 0)
            {
                delete this._unseenItems[k];
                this._Str_20981(k);
                this._Str_12141();
                return true;
            }
            return false;
        }

        public function _Str_3613(k:int, _arg_2:int):Boolean
        {
            var _local_3:Array;
            if (this._unseenItems[k] != null)
            {
                _local_3 = this._unseenItems[k];
                return _local_3.indexOf(_arg_2) >= 0;
            }
            return false;
        }

        public function _Str_16745(k:int, _arg_2:int):Boolean
        {
            var _local_3:Array;
            var _local_4:int;
            if (this._unseenItems[k] != null)
            {
                _local_3 = this._unseenItems[k];
                _local_4 = _local_3.indexOf(_arg_2);
                if (_local_4 >= 0)
                {
                    _local_3.splice(_local_4, 1);
                    this._Str_12141();
                    return true;
                }
            }
            return false;
        }

        public function _Str_11239(k:int):Array
        {
            if (this._unseenItems[k] != null)
            {
                return this._unseenItems[k];
            }
            return [];
        }

        public function _Str_5621(k:int):int
        {
            if (this._unseenItems[k] != null)
            {
                return (this._unseenItems[k] as Array).length;
            }
            return 0;
        }

        private function _Str_14461(k:_Str_9435):void
        {
            var _local_3:Boolean;
            var _local_4:int;
            var _local_5:Array;
            var _local_2:_Str_7601 = k.getParser();
            for each (_local_4 in _local_2._Str_17858())
            {
                _local_5 = _local_2._Str_24396(_local_4);
                this._Str_18112(_local_4, _local_5);
                if (UnseenItemCategoryEnum._Str_12463.indexOf(_local_4) >= 0)
                {
                    _local_3 = true;
                }
            }
            if (this._inventory.isInitialized)
            {
                this._inventory._Str_6956();
                this._inventory._Str_2834._Str_22285();
                this._inventory._Str_4524._Str_2491();
                this._inventory._Str_8302._Str_2491();
            }
            this._Str_12141();
        }

        private function _Str_12141():void
        {
            var _local_3:int;
            var _local_4:int;
            var k:HabboUnseenItemsUpdatedEvent = new HabboUnseenItemsUpdatedEvent();
            var _local_2:Array = UnseenItemCategoryEnum._Str_12463;
            for each (_local_3 in _local_2)
            {
                _local_4 = this._Str_5621(_local_3);
                k._Str_23396(_local_3, _local_4);
                if (UnseenItemCategoryEnum._Str_12463.indexOf(_local_3) >= 0)
                {
                    k._Str_13996 = (k._Str_13996 + _local_4);
                }
            }
            this._events.dispatchEvent(k);
        }

        private function _Str_18112(k:int, _arg_2:Array):void
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            if (_arg_2 == null)
            {
                return;
            }
            if (this._unseenItems[k] == null)
            {
                _local_3 = [];
                this._unseenItems[k] = _local_3;
            }
            _local_3 = this._unseenItems[k];
            for each (_local_4 in _arg_2)
            {
                _local_5 = _local_3.indexOf(_local_4);
                if (_local_5 != -1)
                {
                }
                else
                {
                    _local_3.push(_local_4);
                }
            }
        }

        private function _Str_20981(k:int):void
        {
            this._communication.connection.send(new _Str_10536(k));
        }

        private function _Str_23994(k:int, _arg_2:Array):void
        {
            this._communication.connection.send(new _Str_11812(k, _arg_2));
        }
    }
}
