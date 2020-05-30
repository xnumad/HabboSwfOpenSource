package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetReceivedMessageParser implements IMessageParser
    {
        private var _boughtAsGift:Boolean;
        private var _pet:Pet;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._boughtAsGift = k.readBoolean();
            this._pet = new Pet(k);
            return true;
        }

        public function get boughtAsGift():Boolean
        {
            return this._boughtAsGift;
        }

        public function get pet():Pet
        {
            return this._pet;
        }
    }
}
