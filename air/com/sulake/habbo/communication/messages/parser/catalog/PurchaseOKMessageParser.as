//com.sulake.habbo.communication.messages.parser.catalog.PurchaseOKMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PurchaseOKMessageParser implements IMessageParser {

        private var _offer:CatalogPageMessageOfferData;

        public function PurchaseOKMessageParser();

        public function get offer():CatalogPageMessageOfferData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

