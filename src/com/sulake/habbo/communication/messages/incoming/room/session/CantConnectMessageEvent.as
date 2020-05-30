package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;

    public class CantConnectMessageEvent extends MessageEvent
    {
        public function CantConnectMessageEvent(k:Function)
        {
            super(k, CantConnectMessageParser);
        }

        public function getParser():CantConnectMessageParser
        {
            return _parser as CantConnectMessageParser;
        }
    }
}
