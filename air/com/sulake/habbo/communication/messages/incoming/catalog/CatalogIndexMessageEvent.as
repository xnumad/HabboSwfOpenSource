//com.sulake.habbo.communication.messages.incoming.catalog.CatalogIndexMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogIndexMessageParser;

    [SecureSWF(rename="true")]
    public class CatalogIndexMessageEvent extends MessageEvent implements IMessageEvent {

        public function CatalogIndexMessageEvent(k:Function);

        public function getParser():CatalogIndexMessageParser;

        public function get root():NodeData;

        public function get newAdditionsAvailable():Boolean;

        public function get catalogType():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

