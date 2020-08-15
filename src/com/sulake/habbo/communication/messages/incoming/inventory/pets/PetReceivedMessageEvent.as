package com.sulake.habbo.communication.messages.incoming.inventory.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetReceivedMessageParser;

    public class PetReceivedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function PetReceivedMessageEvent(k:Function)
        {
            super(k, PetReceivedMessageParser);
        }

        public function getParser():PetReceivedMessageParser
        {
            return _parser as PetReceivedMessageParser;
        }
    }
}
