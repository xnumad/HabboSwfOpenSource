package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4393 implements IMessageParser 
    {
        public static const _Str_14199:int = 0;
        public static const _Str_18915:int = 1;
        public static const _Str_16095:int = 2;
        public static const _Str_16785:int = 3;
        public static const _Str_17026:int = 4;
        public static const _Str_17414:int = 5;

        private var _status:Array;


        public function flush():Boolean
        {
            this._status = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._status.push(k.readInteger());
                _local_3++;
            }
            return true;
        }

        public function get status():Array
        {
            return this._status;
        }
    }
}
