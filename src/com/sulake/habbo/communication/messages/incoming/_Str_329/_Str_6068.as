package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6068 
    {
        private var _Str_6780:String;
        private var _Str_6222:int;

        public function _Str_6068(k:IMessageDataWrapper)
        {
            this._Str_6780 = k.readString();
            this._Str_6222 = k.readInteger();
        }

        public function get _Str_7585():String
        {
            return this._Str_6780;
        }

        public function get _Str_6270():int
        {
            return this._Str_6222;
        }
    }
}
