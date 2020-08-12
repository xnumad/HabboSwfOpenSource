package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentOkMessageParser;

    public class RentableSpaceRentOkMessageEvent extends MessageEvent
    {
        public function RentableSpaceRentOkMessageEvent(k:Function)
        {
            super(k, RentableSpaceRentOkMessageParser);
        }

        public function getParser():RentableSpaceRentOkMessageParser
        {
            return parser as RentableSpaceRentOkMessageParser;
        }
    }
}
