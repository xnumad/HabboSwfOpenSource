//com.sulake.habbo.communication.messages.incoming.inventory.pets.ConfirmBreedingRequestEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingRequestParser;

    [SecureSWF(rename="true")]
    public class ConfirmBreedingRequestEvent extends MessageEvent implements IMessageEvent {

        public function ConfirmBreedingRequestEvent(k:Function);

        public function getParser():ConfirmBreedingRequestParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

