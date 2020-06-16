package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser;

    public class _Str_7697 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7697(k:Function)
        {
            super(k, MarketPlaceOffersParser);
        }

        public function getParser():MarketPlaceOffersParser
        {
            return _parser as MarketPlaceOffersParser;
        }
    }
}
