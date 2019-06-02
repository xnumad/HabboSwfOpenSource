//com.sulake.habbo.communication.messages.incoming.inventory.pets.PetReceivedMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetReceivedMessageParser;

    [SecureSWF(rename="true")]
    public class PetReceivedMessageEvent extends MessageEvent implements IMessageEvent {

        public function PetReceivedMessageEvent(k:Function);

        public function getParser():PetReceivedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

