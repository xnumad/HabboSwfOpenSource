package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetRespectFailedParser;

    public class PetRespectFailedEvent extends MessageEvent implements IMessageEvent
    {
        public function PetRespectFailedEvent(k:Function)
        {
            super(k, PetRespectFailedParser);
        }

        public function getParser():PetRespectFailedParser
        {
            return _parser as PetRespectFailedParser;
        }
    }
}
