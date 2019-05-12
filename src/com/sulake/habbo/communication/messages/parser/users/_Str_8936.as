package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8936 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_7278:int = 0;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._Str_7278 = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_10295():int
        {
            return this._Str_7278;
        }
    }
}
