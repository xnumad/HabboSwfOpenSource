//com.sulake.habbo.communication.messages.incoming.room.pets.PetInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetInfoMessageParser;

    [SecureSWF(rename="true")]
    public class PetInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function PetInfoMessageEvent(k:Function);

        public function getParser():PetInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

