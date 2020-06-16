package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;

    public class _Str_7169 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7169(k:Function)
        {
            super(k, MarketPlaceOwnOffersParser);
        }

        public function getParser():MarketPlaceOwnOffersParser
        {
            return _parser as MarketPlaceOwnOffersParser;
        }
    }
}
