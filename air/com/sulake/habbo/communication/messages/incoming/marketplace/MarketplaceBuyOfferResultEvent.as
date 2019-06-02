//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;

    [SecureSWF(rename="true")]
    public class MarketplaceBuyOfferResultEvent extends MessageEvent implements IMessageEvent {

        public function MarketplaceBuyOfferResultEvent(k:Function);

        public function getParser():MarketplaceBuyOfferResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

