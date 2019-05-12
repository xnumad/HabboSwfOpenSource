package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9277 implements IMessageParser 
    {
        protected var _Str_2698:Array;
        protected var _Str_2306:int = 0;

        public function _Str_9277()
        {
            this._Str_2698 = [];
            super();
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2698 = [];
            this._Str_2306 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_2698.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get tags():Array
        {
            return this._Str_2698.slice();
        }

        public function get userId():int
        {
            return this._Str_2306;
        }
    }
}
