//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageExpirationEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageExpirationParser;

    [SecureSWF(rename="true")]
    public class CatalogPageExpirationEvent extends MessageEvent implements IMessageEvent {

        public function CatalogPageExpirationEvent(k:Function);

        public function getParser():CatalogPageExpirationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

