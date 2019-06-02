//com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseOKMessageParser;

    [SecureSWF(rename="true")]
    public class PurchaseOKMessageEvent extends MessageEvent implements IMessageEvent {

        public function PurchaseOKMessageEvent(k:Function);

        public function getParser():PurchaseOKMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

