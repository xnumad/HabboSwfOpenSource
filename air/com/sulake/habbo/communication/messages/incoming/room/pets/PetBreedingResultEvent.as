//com.sulake.habbo.communication.messages.incoming.room.pets.PetBreedingResultEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetBreedingResultMessageParser;

    public class PetBreedingResultEvent extends MessageEvent implements IMessageEvent {

        public function PetBreedingResultEvent(k:Function);

        public function getParser():PetBreedingResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

