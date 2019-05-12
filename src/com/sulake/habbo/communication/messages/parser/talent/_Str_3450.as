package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3450 
    {
        private var _Str_21367:String;

        public function _Str_3450(k:IMessageDataWrapper)
        {
            this._Str_21367 = k.readString();
        }

        public function get _Str_10964():String
        {
            return this._Str_21367;
        }
    }
}
