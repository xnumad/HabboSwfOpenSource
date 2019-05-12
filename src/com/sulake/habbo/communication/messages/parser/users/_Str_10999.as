package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_10999 implements IMessageParser 
    {
        protected var _Str_2516:Map;


        public function flush():Boolean
        {
            if (this._Str_2516)
            {
                this._Str_2516.dispose();
                this._Str_2516 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:String;
            var _local_2:int = k.readInteger();
            this._Str_2516 = new Map();
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_3 = k.readInteger();
                _local_4 = k.readString();
                this._Str_2516.add(_local_3, _local_4);
                _local_5++;
            }
            return true;
        }

        public function get badges():Map
        {
            var k:Map = new Map();
            var _local_2:int;
            while (_local_2 < this._Str_2516.length)
            {
                k.add(this._Str_2516.getKey(_local_2), this._Str_2516.getWithIndex(_local_2));
                _local_2++;
            }
            return k;
        }
    }
}
