package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;

    public class MarketplaceBuyOfferResultEvent extends MessageEvent implements IMessageEvent
    {
        public function MarketplaceBuyOfferResultEvent(k:Function)
        {
            super(k, MarketplaceBuyOfferResultParser);
        }

        public function getParser():MarketplaceBuyOfferResultParser
        {
            return _parser as MarketplaceBuyOfferResultParser;
        }
    }
}
