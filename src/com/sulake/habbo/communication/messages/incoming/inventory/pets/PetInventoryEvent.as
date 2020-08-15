package com.sulake.habbo.communication.messages.incoming.inventory.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser;

    public class PetInventoryEvent extends MessageEvent implements IMessageEvent
    {
        public function PetInventoryEvent(k:Function)
        {
            super(k, PetInventoryMessageParser);
        }

        public function getParser():PetInventoryMessageParser
        {
            return _parser as PetInventoryMessageParser;
        }
    }
}
