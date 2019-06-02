//com.sulake.habbo.communication.messages.incoming.inventory.pets.PetInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser;

    [SecureSWF(rename="true")]
    public class PetInventoryEvent extends MessageEvent implements IMessageEvent {

        public function PetInventoryEvent(k:Function);

        public function getParser():PetInventoryMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

