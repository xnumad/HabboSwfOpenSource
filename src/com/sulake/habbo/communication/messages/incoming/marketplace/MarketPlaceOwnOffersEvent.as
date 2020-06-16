package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;

    public class MarketPlaceOwnOffersEvent extends MessageEvent implements IMessageEvent
    {
        public function MarketPlaceOwnOffersEvent(k:Function)
        {
            super(k, MarketPlaceOwnOffersParser);
        }

        public function getParser():MarketPlaceOwnOffersParser
        {
            return _parser as MarketPlaceOwnOffersParser;
        }
    }
}
