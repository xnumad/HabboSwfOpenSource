package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6256 implements IMessageParser 
    {
        private var _Str_6143:int;
        private var _result:int;


        public function flush():Boolean
        {
            this._Str_6143 = 0;
            this._result = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6143 = k.readInteger();
            this._result = k.readInteger();
            return true;
        }

        public function get breedingNestStuffId():int
        {
            return this._Str_6143;
        }

        public function get result():int
        {
            return this._result;
        }
    }
}
