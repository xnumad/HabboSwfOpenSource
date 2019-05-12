package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7065 implements IMessageParser 
    {
        private var _Str_19825:int;
        private var _result:int;


        public function get _Str_24601():int
        {
            return this._Str_19825;
        }

        public function get _Str_3278():int
        {
            return this._result;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            this._Str_19825 = k.readInteger();
            return true;
        }
    }
}
