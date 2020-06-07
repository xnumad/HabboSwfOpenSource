package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.SeasonalCalendarDailyOfferMessageParser;

    public class SeasonalCalendarDailyOfferMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function SeasonalCalendarDailyOfferMessageEvent(k:Function)
        {
            super(k, SeasonalCalendarDailyOfferMessageParser);
        }

        public function get offer():CatalogPageMessageOfferData
        {
            return SeasonalCalendarDailyOfferMessageParser(parser)._Str_17889;
        }

        public function get pageId():int
        {
            return SeasonalCalendarDailyOfferMessageParser(parser).pageId;
        }
    }
}
