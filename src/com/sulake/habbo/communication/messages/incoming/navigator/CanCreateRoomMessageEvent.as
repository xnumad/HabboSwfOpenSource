package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomMessageParser;

    public class CanCreateRoomMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CanCreateRoomMessageEvent(k:Function)
        {
            super(k, CanCreateRoomMessageParser);
        }

        public function getParser():CanCreateRoomMessageParser
        {
            return this._parser as CanCreateRoomMessageParser;
        }
    }
}
