//com.sulake.habbo.communication.messages.incoming.catalog.SeasonalCalendarDailyOfferMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class SeasonalCalendarDailyOfferMessageEvent extends MessageEvent implements IMessageEvent {

        public function SeasonalCalendarDailyOfferMessageEvent(k:Function);

        public function get offer():CatalogPageMessageOfferData;

        public function get pageId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

