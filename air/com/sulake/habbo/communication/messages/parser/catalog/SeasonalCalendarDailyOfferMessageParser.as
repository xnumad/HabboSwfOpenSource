//com.sulake.habbo.communication.messages.parser.catalog.SeasonalCalendarDailyOfferMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SeasonalCalendarDailyOfferMessageParser implements IMessageParser {

        private var _pageId:int;
        private var _offerData:CatalogPageMessageOfferData;

        public function SeasonalCalendarDailyOfferMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get pageId():int;

        public function get offerData():CatalogPageMessageOfferData;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

