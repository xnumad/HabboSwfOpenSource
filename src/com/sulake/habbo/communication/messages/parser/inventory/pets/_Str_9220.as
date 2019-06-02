package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9220 implements IMessageParser 
    {
        private var _Str_5792:int;
        private var _Str_2388:int;


        public function flush():Boolean
        {
            this._Str_2388 = -1;
            this._Str_5792 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2388 = k.readInteger();
            this._Str_5792 = k.readInteger();
            return true;
        }

        public function get rarityCategory():int
        {
            return this._Str_5792;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }
    }
}
