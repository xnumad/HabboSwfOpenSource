//com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListAddOrUpdateEvent

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListAddOrUpdateParser;

    [SecureSWF(rename="true")]
    public class FurniListAddOrUpdateEvent extends MessageEvent implements IMessageEvent {

        public function FurniListAddOrUpdateEvent(k:Function);

        public function getParser():FurniListAddOrUpdateParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

