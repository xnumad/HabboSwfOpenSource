//com.sulake.habbo.communication.messages.incoming.room.pets.PetLevelUpdateEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetLevelUpdateMessageParser;

    public class PetLevelUpdateEvent extends MessageEvent implements IMessageEvent {

        public function PetLevelUpdateEvent(k:Function);

        public function getParser():PetLevelUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

