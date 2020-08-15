package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventMessageParser;

    public class RoomEventEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomEventEvent(k:Function)
        {
            super(k, RoomEventMessageParser);
        }

        public function getParser():RoomEventMessageParser
        {
            return this._parser as RoomEventMessageParser;
        }
    }
}
