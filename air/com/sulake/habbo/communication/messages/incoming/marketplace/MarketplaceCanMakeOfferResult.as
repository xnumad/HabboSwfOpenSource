//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCanMakeOfferResult

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser;

    [SecureSWF(rename="true")]
    public class MarketplaceCanMakeOfferResult extends MessageEvent implements IMessageEvent {

        public function MarketplaceCanMakeOfferResult(k:Function);

        public function getParser():MarketplaceCanMakeOfferResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

