//com.sulake.habbo.communication.messages.incoming.catalog.PurchaseNotAllowedMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;

    [SecureSWF(rename="true")]
    public class PurchaseNotAllowedMessageEvent extends MessageEvent implements IMessageEvent {

        public function PurchaseNotAllowedMessageEvent(k:Function);

        public function getParser():PurchaseNotAllowedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

