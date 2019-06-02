//com.sulake.habbo.communication.messages.incoming.inventory.pets.GoToBreedingNestFailureEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.GoToBreedingNestFailureParser;

    [SecureSWF(rename="true")]
    public class GoToBreedingNestFailureEvent extends MessageEvent implements IMessageEvent {

        public function GoToBreedingNestFailureEvent(k:Function);

        public function getParser():GoToBreedingNestFailureParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

