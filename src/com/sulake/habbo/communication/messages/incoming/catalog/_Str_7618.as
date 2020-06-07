package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageWithEarliestExpiryMessageParser;

    public class _Str_7618 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7618(k:Function)
        {
            super(k, CatalogPageWithEarliestExpiryMessageParser);
        }

        public function getParser():CatalogPageWithEarliestExpiryMessageParser
        {
            return this._parser as CatalogPageWithEarliestExpiryMessageParser;
        }
    }
}
