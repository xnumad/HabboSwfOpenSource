package com.sulake.habbo.communication.messages.parser._Str_524
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7576 implements IMessageParser 
    {
        private var _Str_2914:int;


        public function get requestId():int
        {
            return this._Str_2914;
        }

        public function flush():Boolean
        {
            this._Str_2914 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2914 = k.readInteger();
            return true;
        }
    }
}
