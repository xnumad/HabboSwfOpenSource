//com.sulake.habbo.communication.messages.incoming.inventory.pets.ConfirmBreedingResultEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingResultParser;

    [SecureSWF(rename="true")]
    public class ConfirmBreedingResultEvent extends MessageEvent implements IMessageEvent {

        public function ConfirmBreedingResultEvent(k:Function);

        public function getParser():ConfirmBreedingResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

