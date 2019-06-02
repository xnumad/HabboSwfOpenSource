package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7523 implements IMessageParser 
    {
        public static const _Str_8664:int = 1;
        public static const _Str_9186:int = 2;
        public static const _Str_22195:int = 3;

        private var _state:int;
        private var _Str_6614:int;
        private var _Str_6649:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._state = k.readInteger();
            this._Str_6614 = k.readInteger();
            this._Str_6649 = k.readInteger();
            return true;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get ownPetId():int
        {
            return this._Str_6614;
        }

        public function get otherPetId():int
        {
            return this._Str_6649;
        }
    }
}
