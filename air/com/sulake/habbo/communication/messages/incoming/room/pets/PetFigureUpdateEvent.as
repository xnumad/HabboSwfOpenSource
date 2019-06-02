//com.sulake.habbo.communication.messages.incoming.room.pets.PetFigureUpdateEvent

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class PetFigureUpdateEvent extends MessageEvent implements IMessageEvent {

        public function PetFigureUpdateEvent(k:Function);

        public function getParser():PetFigureUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

