package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9101 implements IMessageParser 
    {
        private var _data:Map;


        public function get data():Map
        {
            return this._data;
        }

        public function flush():Boolean
        {
            if (this._data != null)
            {
                this._data.dispose();
            }
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:Map;
            var _local_3:int;
            var name:String;
            var count:int;
            this._data = new Map();
            var _local_6:int = k.readInteger();
            var _local_7:int;
            while (_local_7 < _local_6)
            {
                _local_2 = new Map();
                _local_3 = k.readInteger();
                name = k.readString();
                count = k.readInteger();
                _local_2.add("name", name);
                _local_2.add("count", count);
                this._data.add(_local_3, _local_2);
                _local_7++;
            }
            return true;
        }
    }
}
