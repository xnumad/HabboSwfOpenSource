//com.sulake.habbo.communication.messages.incoming.room.pets.PetCommandsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetCommandsMessageParser;

    [SecureSWF(rename="true")]
    public class PetCommandsMessageEvent extends MessageEvent implements IMessageEvent {

        public function PetCommandsMessageEvent(k:Function);

        public function getParser():PetCommandsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

