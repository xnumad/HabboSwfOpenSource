package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7352 
    {
        private var _Str_18365:int = 1;
        private var _Str_2570:String;
        private var _Str_7699:Array;
        private var _Str_6780:String;
        private var _Str_6222:int;

        public function _Str_7352(k:IMessageDataWrapper)
        {
            var _local_2:int;
            this._Str_7699 = [];
            super();
            this._Str_2570 = k.readString();
            this._Str_18365 = k.readInteger();
            if (!this._Str_19070)
            {
                this._Str_6780 = k.readString();
                this._Str_6222 = k.readInteger();
            }
            else
            {
                while (_local_2 < this._Str_18365)
                {
                    this._Str_7699.push(new _Str_6068(k));
                    _local_2++;
                }
            }
        }

        public function get _Str_7585():String
        {
            return this._Str_6780;
        }

        public function get _Str_6270():int
        {
            return this._Str_6222;
        }

        public function get _Str_19070():Boolean
        {
            return this._Str_18365 > 1;
        }

        public function get _Str_9475():Array
        {
            return this._Str_7699;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }
    }
}
