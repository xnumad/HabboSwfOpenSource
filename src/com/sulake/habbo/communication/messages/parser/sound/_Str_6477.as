package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6477 implements IMessageParser 
    {
        private var _Str_3449:Map;

        public function _Str_6477()
        {
            this._Str_3449 = new Map();
        }

        public function get _Str_22284():int
        {
            return this._Str_3449.length;
        }

        public function _Str_23874(k:int):int
        {
            if (((k >= 0) && (k < this._Str_3449.length)))
            {
                return this._Str_3449.getKey(k);
            }
            return -1;
        }

        public function _Str_24056(k:int):int
        {
            if (((k >= 0) && (k < this._Str_3449.length)))
            {
                return this._Str_3449.getWithIndex(k);
            }
            return -1;
        }

        public function flush():Boolean
        {
            this._Str_3449.reset();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                this._Str_3449.add(_local_4, _local_5);
                _local_3++;
            }
            return true;
        }
    }
}
