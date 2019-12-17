package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetExperienceParser;

    public class PetExperienceEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetExperienceEvent(k:Function)
        {
            super(k, PetExperienceParser);
        }

        public function getParser():PetExperienceParser
        {
            return _parser as PetExperienceParser;
        }
    }
}
