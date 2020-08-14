package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentFailedMessageParser;

    public class _Str_7746 extends MessageEvent 
    {
        public function _Str_7746(k:Function)
        {
            super(k, RentableSpaceRentFailedMessageParser);
        }

        public function getParser():RentableSpaceRentFailedMessageParser
        {
            return parser as RentableSpaceRentFailedMessageParser;
        }
    }
}
