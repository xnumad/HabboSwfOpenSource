package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.FurniRentOrBuyoutOfferMessageParser;

    public class FurniRentOrBuyoutOfferMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FurniRentOrBuyoutOfferMessageEvent(k:Function)
        {
            super(k, FurniRentOrBuyoutOfferMessageParser);
        }

        public function getParser():FurniRentOrBuyoutOfferMessageParser
        {
            return _parser as FurniRentOrBuyoutOfferMessageParser;
        }
    }
}
