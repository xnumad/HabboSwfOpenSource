package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8539 implements IMessageParser 
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
            var _local_2:int;
            var _local_3:String;
            this._data = new Map();
            var _local_4:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._data.add(_local_2, _local_3);
                _local_5++;
            }
            return true;
        }
    }
}
