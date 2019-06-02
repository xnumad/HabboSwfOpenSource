//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser;

    [SecureSWF(rename="true")]
    public class MarketplaceCancelOfferResultEvent extends MessageEvent implements IMessageEvent {

        public function MarketplaceCancelOfferResultEvent(k:Function);

        public function getParser():MarketplaceCancelOfferResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

