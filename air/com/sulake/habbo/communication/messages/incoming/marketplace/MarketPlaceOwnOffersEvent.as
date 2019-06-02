//com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;

    [SecureSWF(rename="true")]
    public class MarketPlaceOwnOffersEvent extends MessageEvent implements IMessageEvent {

        public function MarketPlaceOwnOffersEvent(k:Function);

        public function getParser():MarketPlaceOwnOffersParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

