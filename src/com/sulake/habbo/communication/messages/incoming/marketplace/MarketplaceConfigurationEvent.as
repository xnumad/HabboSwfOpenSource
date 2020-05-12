package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;

    public class MarketplaceConfigurationEvent extends MessageEvent implements IMessageEvent 
    {
        public function MarketplaceConfigurationEvent(k:Function)
        {
            super(k, MarketplaceConfigurationMessageParser);
        }

        public function getParser():MarketplaceConfigurationMessageParser
        {
            return _parser as MarketplaceConfigurationMessageParser;
        }
    }
}
