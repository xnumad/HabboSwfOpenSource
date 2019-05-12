package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7305 implements IMessageParser 
    {
        private var _data:Array;


        public function flush():Boolean
        {
            this._data = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readString();
                _local_5 = k.readInteger();
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    this._data.push(new _Str_7446(_local_4, k));
                    _local_6++;
                }
                _local_3++;
            }
            return true;
        }

        public function get data():Array
        {
            return this._data;
        }
    }
}
