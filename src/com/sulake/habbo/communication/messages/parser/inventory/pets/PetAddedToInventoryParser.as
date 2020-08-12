package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetAddedToInventoryParser implements IMessageParser
    {
        private var _pet:Pet;
        private var _Str_12302:Boolean;


        public function flush():Boolean
        {
            this._pet = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._pet = new Pet(k);
            this._Str_12302 = k.readBoolean();
            return true;
        }

        public function get pet():Pet
        {
            return this._pet;
        }

        public function _Str_19947():Boolean
        {
            return this._Str_12302;
        }
    }
}
