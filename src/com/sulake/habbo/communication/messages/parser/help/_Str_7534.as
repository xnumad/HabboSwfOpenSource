package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7534 implements IMessageParser 
    {
        private var _Str_16293:int;
        private var _Str_16057:int;
        private var _Str_15073:Array;


        public function flush():Boolean
        {
            this._Str_16293 = -1;
            this._Str_16057 = -1;
            this._Str_15073 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16293 = k.readInteger();
            this._Str_16057 = k.readInteger();
            this._Str_15073 = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_15073.push(k.readInteger());
                _local_3++;
            }
            return true;
        }

        public function get _Str_22263():int
        {
            return this._Str_16293;
        }

        public function get _Str_25395():int
        {
            return this._Str_16057;
        }

        public function get _Str_24620():Array
        {
            return this._Str_15073;
        }
    }
}
