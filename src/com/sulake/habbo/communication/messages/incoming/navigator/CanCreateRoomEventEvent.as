package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser;

    public class CanCreateRoomEventEvent extends MessageEvent implements IMessageEvent
    {
        public function CanCreateRoomEventEvent(k:Function)
        {
            super(k, CanCreateRoomEventMessageParser);
        }

        public function getParser():CanCreateRoomEventMessageParser
        {
            return this._parser as CanCreateRoomEventMessageParser;
        }
    }
}
