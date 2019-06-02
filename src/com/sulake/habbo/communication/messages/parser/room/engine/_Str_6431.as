package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6431 implements IMessageParser 
    {
        private var _Str_1040:Map = null;

        public function _Str_6431()
        {
            this._Str_1040 = new Map();
        }

        public function get _Str_17132():int
        {
            return this._Str_1040.length;
        }

        public function getName(k:int):String
        {
            if (((k < 0) || (k >= this._Str_17132)))
            {
                return null;
            }
            return this._Str_1040.getKey(k);
        }

        public function _Str_24465(k:int):String
        {
            if (((k < 0) || (k >= this._Str_17132)))
            {
                return null;
            }
            return this._Str_1040.getWithIndex(k);
        }

        public function flush():Boolean
        {
            this._Str_1040.reset();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:String;
            var _local_5:String;
            this._Str_1040.reset();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readString();
                _local_5 = k.readString();
                this._Str_1040.remove(_local_4);
                this._Str_1040.add(_local_4, _local_5);
                _local_3++;
            }
            return true;
        }
    }
}
