package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9060 implements IMessageParser 
    {
        private var _Str_8999:Map;


        public function flush():Boolean
        {
            if (this._Str_8999)
            {
                this._Str_8999.dispose();
                this._Str_8999 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8999 = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_8999.add(k.readInteger(), k.readString());
                _local_3++;
            }
            return true;
        }

        public function get _Str_20644():Map
        {
            return this._Str_8999;
        }
    }
}
