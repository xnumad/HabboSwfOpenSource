package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8691 
    {
        private var _Str_6714:int;
        private var _Str_19614:int;
        private var _prizes:Array;

        public function _Str_8691(k:IMessageDataWrapper)
        {
            this._Str_6714 = k.readInteger();
            this._Str_19614 = k.readInteger();
            this._prizes = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._prizes.push(new _Str_7352(k));
                _local_3++;
            }
        }

        public function get _Str_16418():int
        {
            return this._Str_6714;
        }

        public function get _Str_24405():int
        {
            return this._Str_19614;
        }

        public function get prizes():Array
        {
            return this._prizes;
        }
    }
}
