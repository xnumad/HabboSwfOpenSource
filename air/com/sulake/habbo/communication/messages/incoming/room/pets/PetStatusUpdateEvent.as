//com.sulake.habbo.communication.messages.incoming.room.pets.PetStatusUpdateEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetStatusUpdateMessageParser;

    public class PetStatusUpdateEvent extends MessageEvent implements IMessageEvent {

        public function PetStatusUpdateEvent(k:Function);

        public function getParser():PetStatusUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

