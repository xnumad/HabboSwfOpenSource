package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7183 implements IMessageParser 
    {
        private var _Str_2388:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2388 = k.readInteger();
            return true;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }
    }
}
