//com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceItemStatsEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;

    [SecureSWF(rename="true")]
    public class MarketplaceItemStatsEvent extends MessageEvent implements IMessageEvent {

        public function MarketplaceItemStatsEvent(k:Function);

        public function getParser():MarketplaceItemStatsParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

