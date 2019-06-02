//com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetRespectFailedParser;

    [SecureSWF(rename="true")]
    public class PetRespectFailedEvent extends MessageEvent implements IMessageEvent {

        public function PetRespectFailedEvent(k:Function);

        public function getParser():PetRespectFailedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

