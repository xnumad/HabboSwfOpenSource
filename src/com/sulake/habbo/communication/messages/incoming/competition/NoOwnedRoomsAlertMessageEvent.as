package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.NoOwnedRoomsAlertMessageParser;

    public class NoOwnedRoomsAlertMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function NoOwnedRoomsAlertMessageEvent(k:Function)
        {
            super(k, NoOwnedRoomsAlertMessageParser);
        }

        public function getParser():NoOwnedRoomsAlertMessageParser
        {
            return _parser as NoOwnedRoomsAlertMessageParser;
        }
    }
}
