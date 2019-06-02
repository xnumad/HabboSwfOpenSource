//com.sulake.habbo.communication.messages.incoming.inventory.pets.PetAddedToInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser;

    [SecureSWF(rename="true")]
    public class PetAddedToInventoryEvent extends MessageEvent implements IMessageEvent {

        public function PetAddedToInventoryEvent(k:Function);

        public function getParser():PetAddedToInventoryParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

