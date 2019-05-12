package com.sulake.habbo.communication.messages.parser.avatar
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_5988;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9423 implements IMessageParser 
    {
        private var _state:int;
        private var _Str_16827:Array;


        public function flush():Boolean
        {
            this._state = 0;
            this._Str_16827 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:_Str_5988;
            this._state = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_5988(k);
                this._Str_16827.push(_local_4);
                _local_3++;
            }
            return true;
        }

        public function get _Str_17746():Array
        {
            return this._Str_16827;
        }

        public function get state():int
        {
            return this._state;
        }
    }
}
