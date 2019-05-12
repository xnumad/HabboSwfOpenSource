package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.InventoryItemParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7941 implements IMessageParser 
    {
        protected var _Str_6580:int;
        protected var _Str_6945:int;
        private var _Str_8344:Map;


        public function get _Str_7430():int
        {
            return this._Str_6580;
        }

        public function get _Str_9600():int
        {
            return this._Str_6945;
        }

        public function get _Str_22320():Map
        {
            return this._Str_8344;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:InventoryItemParser;
            this._Str_6580 = k.readInteger();
            this._Str_6945 = k.readInteger();
            this._Str_8344 = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new InventoryItemParser(k);
                this._Str_8344.add(_local_4.itemId, _local_4);
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            if (this._Str_8344)
            {
                this._Str_8344.dispose();
                this._Str_8344 = null;
            }
            return true;
        }
    }
}
