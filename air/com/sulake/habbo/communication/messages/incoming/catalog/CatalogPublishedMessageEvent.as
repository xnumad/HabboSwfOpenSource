//com.sulake.habbo.communication.messages.incoming.catalog.CatalogPublishedMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPublishedMessageParser;

    [SecureSWF(rename="true")]
    public class CatalogPublishedMessageEvent extends MessageEvent implements IMessageEvent {

        public function CatalogPublishedMessageEvent(k:Function);

        public function getParser():CatalogPublishedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

