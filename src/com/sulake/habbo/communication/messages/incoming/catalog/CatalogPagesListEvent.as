package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPagesListMessageParser;

    public class CatalogPagesListEvent extends MessageEvent implements IMessageEvent 
    {
        public function CatalogPagesListEvent(k:Function)
        {
            super(k, CatalogPagesListMessageParser);
        }

        public function _Str_2273():CatalogPagesListMessageParser
        {
            return this._parser as CatalogPagesListMessageParser;
        }

        public function get root():NodeData
        {
            return this._Str_2273().root;
        }

        public function get _Str_16264():Boolean
        {
            return this._Str_2273().unknownBoolean;
        }

        public function get catalogType():String
        {
            return this._Str_2273().catalogType;
        }
    }
}
