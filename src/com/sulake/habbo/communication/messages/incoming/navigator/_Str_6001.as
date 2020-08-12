package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomRatingMessageParser;

    public class _Str_6001 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6001(k:Function)
        {
            super(k, RoomRatingMessageParser);
        }

        public function getParser():RoomRatingMessageParser
        {
            return this._parser as RoomRatingMessageParser;
        }
    }
}
