package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosedAndOpensMessageParser;

    public class HotelClosedAndOpensEvent extends MessageEvent implements IMessageEvent 
    {
        public function HotelClosedAndOpensEvent(k:Function)
        {
            super(k, HotelClosedAndOpensMessageParser);
        }

        public function getParser():HotelClosedAndOpensMessageParser
        {
            return _parser as HotelClosedAndOpensMessageParser;
        }
    }
}
