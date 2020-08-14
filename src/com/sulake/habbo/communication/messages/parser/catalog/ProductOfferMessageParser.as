package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ProductOfferMessageParser implements IMessageParser
    {
        private var offerData:CatalogPageMessageOfferData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this.offerData = new CatalogPageMessageOfferData(k);
            return true;
        }

        public function get _Str_17889():CatalogPageMessageOfferData
        {
            return this.offerData;
        }
    }
}
