package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentOkMessageParser;

    public class _Str_8033 extends MessageEvent 
    {
        public function _Str_8033(k:Function)
        {
            super(k, RentableSpaceRentOkMessageParser);
        }

        public function getParser():RentableSpaceRentOkMessageParser
        {
            return parser as RentableSpaceRentOkMessageParser;
        }
    }
}
