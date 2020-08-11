package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;

    public class _Str_6344 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6344(k:Function)
        {
            super(k, MarketplaceBuyOfferResultParser);
        }

        public function getParser():MarketplaceBuyOfferResultParser
        {
            return _parser as MarketplaceBuyOfferResultParser;
        }
    }
}
