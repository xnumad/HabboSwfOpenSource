package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetScratchFailedMessageParser;

    public class PetScratchFailedEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetScratchFailedEvent(k:Function)
        {
            super(k, PetScratchFailedMessageParser);
        }

        public function getParser():PetScratchFailedMessageParser
        {
            return _parser as PetScratchFailedMessageParser;
        }
    }
}
