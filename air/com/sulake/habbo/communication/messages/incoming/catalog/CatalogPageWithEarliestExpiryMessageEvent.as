//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageWithEarliestExpiryMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageWithEarliestExpiryMessageParser;

    public class CatalogPageWithEarliestExpiryMessageEvent extends MessageEvent implements IMessageEvent {

        public function CatalogPageWithEarliestExpiryMessageEvent(k:Function);

        public function getParser():CatalogPageWithEarliestExpiryMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

