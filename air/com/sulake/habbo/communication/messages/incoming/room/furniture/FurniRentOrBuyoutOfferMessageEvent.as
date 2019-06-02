//com.sulake.habbo.communication.messages.incoming.room.furniture.FurniRentOrBuyoutOfferMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.FurniRentOrBuyoutOfferMessageParser;

    [SecureSWF(rename="true")]
    public class FurniRentOrBuyoutOfferMessageEvent extends MessageEvent implements IMessageEvent {

        public function FurniRentOrBuyoutOfferMessageEvent(k:Function);

        public function getParser():FurniRentOrBuyoutOfferMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

