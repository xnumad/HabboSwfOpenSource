package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetTrainingPanelMessageParser;

    public class PetTrainingPanelEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetTrainingPanelEvent(k:Function)
        {
            super(k, PetTrainingPanelMessageParser);
        }

        public function getParser():PetTrainingPanelMessageParser
        {
            return _parser as PetTrainingPanelMessageParser;
        }
    }
}
