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
            var _local_4:String;
            var _local_5:int;
            this._data = new Map();
            var _local_6:int = k.readInteger();
            var _local_7:int;
            while (_local_7 < _local_6)
            {
                _local_2 = new Map();
                _local_3 = k.readInteger();
                _local_4 = k.readString();
                _local_5 = k.readInteger();
                _local_2.add("name", _local_4);
                _local_2.add("count", _local_5);
                this._data.add(_local_3, _local_2);
                _local_7++;
            }
            return true;
        }
    }
}
