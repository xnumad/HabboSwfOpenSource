//com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListEvent

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListParser;

    [SecureSWF(rename="true")]
    public class FurniListEvent extends MessageEvent implements IMessageEvent {

        public function FurniListEvent(k:Function);

        public function getParser():FurniListParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

