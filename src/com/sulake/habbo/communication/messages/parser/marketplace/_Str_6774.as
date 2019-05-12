package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6774 implements IMessageParser 
    {
        private var _Str_5049:int;
        private var _Str_10039:int;
        private var _Str_10803:int;
        private var _Str_8270:Array;
        private var _Str_9670:Array;
        private var _Str_8961:Array;
        private var _Str_10894:int;
        private var _Str_10644:int;


        public function get _Str_3925():int
        {
            return this._Str_5049;
        }

        public function get _Str_4121():int
        {
            return this._Str_10039;
        }

        public function get _Str_10461():int
        {
            return this._Str_10803;
        }

        public function get _Str_9174():Array
        {
            return this._Str_8270;
        }

        public function get _Str_11365():Array
        {
            return this._Str_9670;
        }

        public function get _Str_11956():Array
        {
            return this._Str_8961;
        }

        public function get _Str_8798():int
        {
            return this._Str_10894;
        }

        public function get _Str_9431():int
        {
            return this._Str_10644;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_5049 = k.readInteger();
            this._Str_10039 = k.readInteger();
            this._Str_10803 = k.readInteger();
            var _local_2:int = k.readInteger();
            this._Str_8270 = [];
            this._Str_9670 = [];
            this._Str_8961 = [];
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_8270.push(k.readInteger());
                this._Str_9670.push(k.readInteger());
                this._Str_8961.push(k.readInteger());
                _local_3++;
            }
            this._Str_10644 = k.readInteger();
            this._Str_10894 = k.readInteger();
            return true;
        }
    }
}
