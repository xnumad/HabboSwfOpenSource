//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceConfigurationEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationParser;

    [SecureSWF(rename="true")]
    public class MarketplaceConfigurationEvent extends MessageEvent implements IMessageEvent {

        public function MarketplaceConfigurationEvent(k:Function);

        public function getParser():MarketplaceConfigurationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

