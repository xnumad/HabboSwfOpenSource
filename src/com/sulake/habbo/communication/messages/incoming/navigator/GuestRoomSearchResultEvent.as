package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.GuestRoomSearchResultMessageParser;

    public class GuestRoomSearchResultEvent extends MessageEvent implements IMessageEvent
    {
        public function GuestRoomSearchResultEvent(k:Function)
        {
            super(k, GuestRoomSearchResultMessageParser);
        }

        public function getParser():GuestRoomSearchResultMessageParser
        {
            return this._parser as GuestRoomSearchResultMessageParser;
        }
    }
}
