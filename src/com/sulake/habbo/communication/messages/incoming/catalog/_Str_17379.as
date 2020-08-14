package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageExpirationParser;

    public class _Str_17379 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17379(k:Function)
        {
            super(k, CatalogPageExpirationParser);
        }

        public function getParser():CatalogPageExpirationParser
        {
            return this._parser as CatalogPageExpirationParser;
        }
    }
}
