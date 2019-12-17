package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.HotelClosesAndWillOpenAtMessageParser;

    public class HotelClosesAndWillOpenAtEvent extends MessageEvent implements IMessageEvent 
    {
        public function HotelClosesAndWillOpenAtEvent(k:Function)
        {
            super(k, HotelClosesAndWillOpenAtMessageParser);
        }

        public function getParser():HotelClosesAndWillOpenAtMessageParser
        {
            return _parser as HotelClosesAndWillOpenAtMessageParser;
        }
    }
}
