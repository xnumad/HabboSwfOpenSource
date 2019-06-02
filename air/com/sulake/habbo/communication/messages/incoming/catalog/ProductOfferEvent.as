//com.sulake.habbo.communication.messages.incoming.catalog.ProductOfferEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ProductOfferMessageParser;

    [SecureSWF(rename="true")]
    public class ProductOfferEvent extends MessageEvent implements IMessageEvent {

        public function ProductOfferEvent(k:Function);

        public function getParser():ProductOfferMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

