//com.sulake.habbo.communication.messages.incoming.catalog.GiftReceiverNotFoundEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.GiftReceiverNotFoundParser;

    [SecureSWF(rename="true")]
    public class GiftReceiverNotFoundEvent extends MessageEvent implements IMessageEvent {

        public function GiftReceiverNotFoundEvent(k:Function);

        public function getParser():GiftReceiverNotFoundParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

