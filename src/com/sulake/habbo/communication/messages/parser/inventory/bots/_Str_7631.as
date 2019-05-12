package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7631 implements IMessageParser 
    {
        private var _items:Map;


        public function flush():Boolean
        {
            if (this._items)
            {
                this._items.dispose();
                this._items = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:_Str_3013;
            this._items = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_3013(k);
                this._items.add(_local_4.id, _local_4);
                _local_3++;
            }
            return true;
        }

        public function get items():Map
        {
            return this._items;
        }
    }
}
