//com.sulake.habbo.communication.messages.incoming.inventory.furni.PostItPlacedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.PostItPlacedParser;

    [SecureSWF(rename="true")]
    public class PostItPlacedEvent extends MessageEvent implements IMessageEvent {

        public function PostItPlacedEvent(k:Function);

        public function getParser():PostItPlacedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

