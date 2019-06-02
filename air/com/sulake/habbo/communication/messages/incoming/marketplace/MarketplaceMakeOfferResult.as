//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceMakeOfferResult

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;

    [SecureSWF(rename="true")]
    public class MarketplaceMakeOfferResult extends MessageEvent implements IMessageEvent {

        public function MarketplaceMakeOfferResult(k:Function);

        public function getParser():MarketplaceMakeOfferResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

