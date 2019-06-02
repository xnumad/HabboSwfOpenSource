//com.sulake.habbo.communication.messages.incoming.inventory.pets.PetRemovedFromInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser;

    [SecureSWF(rename="true")]
    public class PetRemovedFromInventoryEvent extends MessageEvent implements IMessageEvent {

        public function PetRemovedFromInventoryEvent(k:Function);

        public function getParser():PetRemovedFromInventoryParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

