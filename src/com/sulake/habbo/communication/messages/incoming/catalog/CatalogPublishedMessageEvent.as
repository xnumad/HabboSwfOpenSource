package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.CatalogPublishedMessageParser;

    public class CatalogPublishedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CatalogPublishedMessageEvent(k:Function)
        {
            super(k, CatalogPublishedMessageParser);
        }

        public function getParser():CatalogPublishedMessageParser
        {
            return this._parser as CatalogPublishedMessageParser;
        }

        public function get _Str_17070():Boolean
        {
            return this.getParser()._Str_17070;
        }

        public function get _Str_12669():String
        {
            return this.getParser()._Str_12669;
        }
    }
}
