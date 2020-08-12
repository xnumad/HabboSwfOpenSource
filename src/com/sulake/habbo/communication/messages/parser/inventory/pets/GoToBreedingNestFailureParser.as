package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GoToBreedingNestFailureParser implements IMessageParser
    {
        public static const _Str_17785:int = 6;

        private var _reason:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            return true;
        }

        public function get reason():int
        {
            return this._reason;
        }
    }
}
