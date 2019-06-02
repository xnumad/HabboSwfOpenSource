//com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListInvalidateEvent

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListInvalidateParser;

    [SecureSWF(rename="true")]
    public class FurniListInvalidateEvent extends MessageEvent implements IMessageEvent {

        public function FurniListInvalidateEvent(k:Function);

        public function getParser():FurniListInvalidateParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

