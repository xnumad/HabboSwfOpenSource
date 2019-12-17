package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability.HotelWillCloseInMinutesMessageParser;

    public class HotelWillCloseInMinutesEvent extends MessageEvent implements IMessageEvent 
    {
        public function HotelWillCloseInMinutesEvent(k:Function)
        {
            super(k, HotelWillCloseInMinutesMessageParser);
        }

        public function getParser():HotelWillCloseInMinutesMessageParser
        {
            return _parser as HotelWillCloseInMinutesMessageParser;
        }
    }
}
