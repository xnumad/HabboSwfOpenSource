package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventCancelMessageParser;

    public class RoomEventCancelEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomEventCancelEvent(k:Function)
        {
            super(k, RoomEventCancelMessageParser);
        }
    }
}
