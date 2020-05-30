package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetReceivedMessageParser implements IMessageParser
    {
        private var _gift:Boolean;
        private var _pet:Pet;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gift = k.readBoolean();
            this._pet = new Pet(k);
            return true;
        }

        public function get gift():Boolean
        {
            return this._gift;
        }

        public function get pet():Pet
        {
            return this._pet;
        }
    }
}
