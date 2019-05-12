package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class _Str_8180 
    {
        private var _Str_1659:String;
        private var _Str_1638:String;

        public function _Str_8180(k:String, _arg_2:String)
        {
            this._Str_1659 = k;
            this._Str_1638 = _arg_2;
        }

        public function get _Str_695():String
        {
            return this._Str_1659;
        }

        public function get _Str_727():String
        {
            return this._Str_1638;
        }

        public function toString():String
        {
            return (this._Str_1659 + ":") + this._Str_1638;
        }
    }
}
