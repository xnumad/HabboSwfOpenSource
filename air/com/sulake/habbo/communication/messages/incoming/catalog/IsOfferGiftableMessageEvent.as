//com.sulake.habbo.communication.messages.incoming.catalog.IsOfferGiftableMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;

    [SecureSWF(rename="true")]
    public class IsOfferGiftableMessageEvent extends MessageEvent implements IMessageEvent {

        public function IsOfferGiftableMessageEvent(k:Function);

        public function getParser():IsOfferGiftableMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

