package com.sulake.habbo.communication.messages.parser._Str_449
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TryPhoneNumberResultParser implements IMessageParser 
    {
        private var _resultCode:int;
        private var _Str_21295:int;


        public function get _Str_3278():int
        {
            return this._resultCode;
        }

        public function get _Str_24596():int
        {
            return this._Str_21295;
        }

        public function flush():Boolean
        {
            this._resultCode = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultCode = k.readInteger();
            this._Str_21295 = k.readInteger();
            return true;
        }
    }
}
