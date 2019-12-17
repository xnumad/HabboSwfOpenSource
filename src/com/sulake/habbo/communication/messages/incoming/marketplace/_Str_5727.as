package com.sulake.habbo.communication.messages.incoming.marketplace
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;

    public class _Str_5727 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5727(k:Function)
        {
            super(k, MarketplaceConfigurationMessageParser);
        }

        public function getParser():MarketplaceConfigurationMessageParser
        {
            return _parser as MarketplaceConfigurationMessageParser;
        }
    }
}
