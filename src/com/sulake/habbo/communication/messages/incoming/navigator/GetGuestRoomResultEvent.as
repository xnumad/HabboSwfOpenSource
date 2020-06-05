package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;

    public class GetGuestRoomResultEvent extends MessageEvent implements IMessageEvent
    {
        public function GetGuestRoomResultEvent(k:Function)
        {
            super(k, GetGuestRoomResultMessageParser);
        }

        public function getParser():GetGuestRoomResultMessageParser
        {
            return this._parser as GetGuestRoomResultMessageParser;
        }
    }
}
