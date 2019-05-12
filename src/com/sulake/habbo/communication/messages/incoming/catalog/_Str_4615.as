package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4615 
    {
        private var _Str_20535:int;
        private var _Str_19937:int;
        private var _Str_20951:int;
        private var _Str_20460:int;
        private var _Str_16144:Array;

        public function _Str_4615(k:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            this._Str_20535 = k.readInteger();
            this._Str_19937 = k.readInteger();
            this._Str_20951 = k.readInteger();
            this._Str_20460 = k.readInteger();
            this._Str_16144 = new Array();
            var _local_2:int = k.readInteger();
            while (_local_3 < _local_2)
            {
                this._Str_16144.push(k.readInteger());
                _local_3++;
            }
        }

        public function get _Str_22802():int
        {
            return this._Str_20535;
        }

        public function get _Str_9227():int
        {
            return this._Str_19937;
        }

        public function get _Str_23802():int
        {
            return this._Str_20951;
        }

        public function get _Str_21500():int
        {
            return this._Str_20460;
        }

        public function get _Str_25155():Array
        {
            return this._Str_16144;
        }
    }
}
