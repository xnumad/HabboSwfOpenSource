package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7276 implements IMessageParser 
    {
        private var _Str_19500:int;
        private var _errorCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19500 = k.readInteger();
            this._errorCode = k.readInteger();
            return true;
        }

        public function get _Str_23408():int
        {
            return this._Str_19500;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}
