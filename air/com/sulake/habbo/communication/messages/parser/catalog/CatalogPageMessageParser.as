//com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogLocalizationData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CatalogPageMessageParser implements IMessageParser {

        private var _pageId:int;
        private var _catalogType:String;
        private var _layoutCode:String;
        private var _localization:CatalogLocalizationData;
        private var _offers:Vector.<CatalogPageMessageOfferData>;
        private var _offerId:int;
        private var _acceptSeasonCurrencyAsCredits:Boolean;

        public function CatalogPageMessageParser();

        public function get pageId():int;

        public function get catalogType():String;

        public function get layoutCode():String;

        public function get localization():CatalogLocalizationData;

        public function get offers():Vector.<CatalogPageMessageOfferData>;

        public function get offerId():int;

        public function get acceptSeasonCurrencyAsCredits():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

