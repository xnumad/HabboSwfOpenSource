//com.sulake.habbo.communication.messages.incoming.room.pets.PetExperienceEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetExperienceParser;

    [SecureSWF(rename="true")]
    public class PetExperienceEvent extends MessageEvent implements IMessageEvent {

        public function PetExperienceEvent(k:Function);

        public function getParser():PetExperienceParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

