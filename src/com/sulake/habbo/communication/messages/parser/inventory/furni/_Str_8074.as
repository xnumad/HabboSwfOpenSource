package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8074 implements IMessageParser 
    {
        private var _Str_2926:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2926 = k.readInteger();
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get _Str_17550():int
        {
            return this._Str_2926;
        }
    }
}
