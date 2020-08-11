package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;

    public class _Str_6022 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6022(k:Function)
        {
            super(k, MarketplaceMakeOfferResultParser);
        }

        public function getParser():MarketplaceMakeOfferResultParser
        {
            return _parser as MarketplaceMakeOfferResultParser;
        }
    }
}
