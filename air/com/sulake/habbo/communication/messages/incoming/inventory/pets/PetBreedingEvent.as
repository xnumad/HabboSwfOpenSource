//com.sulake.habbo.communication.messages.incoming.inventory.pets.PetBreedingEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetBreedingMessageParser;

    [SecureSWF(rename="true")]
    public class PetBreedingEvent extends MessageEvent implements IMessageEvent {

        public function PetBreedingEvent(k:Function);

        public function getParser():PetBreedingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

