package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateParser;

    public class PetFigureUpdateEvent extends MessageEvent implements IMessageEvent 
    {
        public function PetFigureUpdateEvent(k:Function)
        {
            super(k, PetFigureUpdateParser);
        }

        public function getParser():PetFigureUpdateParser
        {
            return _parser as PetFigureUpdateParser;
        }
    }
}
