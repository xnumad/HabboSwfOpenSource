package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;

    public class CatalogPageMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CatalogPageMessageEvent(k:Function)
        {
            super(k, CatalogPageMessageParser);
        }

        public function getParser():CatalogPageMessageParser
        {
            return this._parser as CatalogPageMessageParser;
        }
    }
}
