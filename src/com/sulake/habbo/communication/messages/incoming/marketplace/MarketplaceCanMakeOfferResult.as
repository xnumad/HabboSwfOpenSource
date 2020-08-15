package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser;

    public class MarketplaceCanMakeOfferResult extends MessageEvent implements IMessageEvent
    {
        public function MarketplaceCanMakeOfferResult(k:Function)
        {
            super(k, MarketplaceCanMakeOfferResultParser);
        }

        public function getParser():MarketplaceCanMakeOfferResultParser
        {
            return _parser as MarketplaceCanMakeOfferResultParser;
        }
    }
}
