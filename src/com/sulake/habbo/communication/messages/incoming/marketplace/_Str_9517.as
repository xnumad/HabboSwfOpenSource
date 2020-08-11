package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser;

    public class _Str_9517 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9517(k:Function)
        {
            super(k, MarketplaceCanMakeOfferResultParser);
        }

        public function getParser():MarketplaceCanMakeOfferResultParser
        {
            return _parser as MarketplaceCanMakeOfferResultParser;
        }
    }
}
