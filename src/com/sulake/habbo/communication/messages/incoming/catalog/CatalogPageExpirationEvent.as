package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageExpirationParser;

    public class CatalogPageExpirationEvent extends MessageEvent implements IMessageEvent
    {
        public function CatalogPageExpirationEvent(k:Function)
        {
            super(k, CatalogPageExpirationParser);
        }

        public function getParser():CatalogPageExpirationParser
        {
            return this._parser as CatalogPageExpirationParser;
        }
    }
}
