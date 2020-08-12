package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetRemovedFromInventoryParser implements IMessageParser
    {
        private var _petId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._petId = k.readInteger();
            return true;
        }

        public function get petId():int
        {
            return this._petId;
        }
    }
}
