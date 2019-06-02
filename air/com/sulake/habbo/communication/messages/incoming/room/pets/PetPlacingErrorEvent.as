//com.sulake.habbo.communication.messages.incoming.room.pets.PetPlacingErrorEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetPlacingErrorParser;

    [SecureSWF(rename="true")]
    public class PetPlacingErrorEvent extends MessageEvent implements IMessageEvent {

        public function PetPlacingErrorEvent(k:Function);

        public function getParser():PetPlacingErrorParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

