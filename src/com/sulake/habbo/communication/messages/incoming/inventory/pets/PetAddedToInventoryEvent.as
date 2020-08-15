package com.sulake.habbo.communication.messages.incoming.inventory.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser;

    public class PetAddedToInventoryEvent extends MessageEvent implements IMessageEvent
    {
        public function PetAddedToInventoryEvent(k:Function)
        {
            super(k, PetAddedToInventoryParser);
        }

        public function getParser():PetAddedToInventoryParser
        {
            return _parser as PetAddedToInventoryParser;
        }
    }
}
