//com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListRemoveEvent

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListRemoveParser;

    [SecureSWF(rename="true")]
    public class FurniListRemoveEvent extends MessageEvent implements IMessageEvent {

        public function FurniListRemoveEvent(k:Function);

        public function getParser():FurniListRemoveParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

