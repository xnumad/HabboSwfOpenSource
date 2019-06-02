//com.sulake.habbo.communication.messages.parser.catalog.ProductOfferMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ProductOfferMessageParser implements IMessageParser {

        private var _offerData:CatalogPageMessageOfferData;

        public function ProductOfferMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get offerData():CatalogPageMessageOfferData;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

