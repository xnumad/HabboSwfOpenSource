//com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent

package com.sulake.habbo.communication.messages.incoming.marketplace{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser;

    [SecureSWF(rename="true")]
    public class MarketPlaceOffersEvent extends MessageEvent implements IMessageEvent {

        public function MarketPlaceOffersEvent(k:Function);

        public function getParser():MarketPlaceOffersParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.marketplace

