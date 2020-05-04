package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogSearchResultParser;

    public class _Str_9560 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9560(k:Function)
        {
            super(k, CatalogSearchResultParser);
        }

        public function getParser():CatalogSearchResultParser
        {
            return this._parser as CatalogSearchResultParser;
        }
    }
}
