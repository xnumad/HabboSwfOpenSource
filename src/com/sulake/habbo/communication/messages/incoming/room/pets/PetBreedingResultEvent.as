package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetBreedingResultParser;

    public class PetBreedingResultEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetBreedingResultEvent(k:Function)
        {
            super(k, PetBreedingResultParser);
        }

        public function getParser():PetBreedingResultParser
        {
            return _parser as PetBreedingResultParser;
        }
    }
}
