package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3457 
    {
        private var _Str_2570:String;
        private var _Str_22129:int;

        public function _Str_3457(k:IMessageDataWrapper)
        {
            this._Str_2570 = k.readString();
            this._Str_22129 = k.readInteger();
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get _Str_13965():int
        {
            return this._Str_22129;
        }
    }
}
