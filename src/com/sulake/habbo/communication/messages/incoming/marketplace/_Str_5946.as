package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;

    public class _Str_5946 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5946(k:Function)
        {
            super(k, MarketplaceItemStatsParser);
        }

        public function getParser():MarketplaceItemStatsParser
        {
            return _parser as MarketplaceItemStatsParser;
        }
    }
}
