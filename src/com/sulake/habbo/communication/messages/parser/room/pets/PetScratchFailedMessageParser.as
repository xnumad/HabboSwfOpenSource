package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetScratchFailedMessageParser implements IMessageParser 
    {
        private var _currentAge:int;
        private var _requiredAge:int;


        public function get currentAge():int
        {
            return this._currentAge;
        }

        public function get requiredAge():int
        {
            return this._requiredAge;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._currentAge = k.readInteger();
            this._requiredAge = k.readInteger();
            return true;
        }
    }
}
