package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6513 implements IMessageParser 
    {
        private var _Str_14708:Map;
        private var _Str_18029:int;

        public function _Str_6513()
        {
            this._Str_14708 = new Map();
        }

        public function get _Str_14484():Map
        {
            return this._Str_14708;
        }

        public function get _Str_26156():int
        {
            return this._Str_18029;
        }

        public function flush():Boolean
        {
            this._Str_14708.reset();
            this._Str_18029 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18029 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int = -1;
            var _local_4:int = -1;
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_3 = k.readInteger();
                _local_4 = k.readInteger();
                this._Str_14708.add(_local_3, _local_4);
                _local_5++;
            }
            return true;
        }
    }
}
