package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser;

    public class MarketplaceCancelOfferResultEvent extends MessageEvent implements IMessageEvent
    {
        public function MarketplaceCancelOfferResultEvent(k:Function)
        {
            super(k, MarketplaceCancelOfferResultParser);
        }

        public function getParser():MarketplaceCancelOfferResultParser
        {
            return _parser as MarketplaceCancelOfferResultParser;
        }
    }
}
