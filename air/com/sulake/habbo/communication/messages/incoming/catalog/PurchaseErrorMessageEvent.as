//com.sulake.habbo.communication.messages.incoming.catalog.PurchaseErrorMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseErrorMessageParser;

    [SecureSWF(rename="true")]
    public class PurchaseErrorMessageEvent extends MessageEvent implements IMessageEvent {

        public function PurchaseErrorMessageEvent(k:Function);

        public function getParser():PurchaseErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

