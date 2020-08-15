package com.sulake.habbo.communication.messages.incoming.inventory.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser;

    public class PetRemovedFromInventoryEvent extends MessageEvent implements IMessageEvent
    {
        public function PetRemovedFromInventoryEvent(k:Function)
        {
            super(k, PetRemovedFromInventoryParser);
        }

        public function getParser():PetRemovedFromInventoryParser
        {
            return _parser as PetRemovedFromInventoryParser;
        }
    }
}
