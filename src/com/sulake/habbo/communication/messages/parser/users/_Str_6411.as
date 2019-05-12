package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6411 implements IMessageParser 
    {
        private var _userId:int;
        private var _Str_11781:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._Str_11781 = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_10882():int
        {
            return this._Str_11781;
        }
    }
}
