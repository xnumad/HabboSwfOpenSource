package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetStatusUpdateParser;

    public class PetStatusUpdateEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetStatusUpdateEvent(k:Function)
        {
            super(k, PetStatusUpdateParser);
        }

        public function getParser():PetStatusUpdateParser
        {
            return _parser as PetStatusUpdateParser;
        }
    }
}
