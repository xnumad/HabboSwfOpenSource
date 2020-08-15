package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.SecondsUntilMessageParser;

    public class SecondsUntilMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function SecondsUntilMessageEvent(k:Function)
        {
            super(k, SecondsUntilMessageParser);
        }

        public function getParser():SecondsUntilMessageParser
        {
            return _parser as SecondsUntilMessageParser;
        }
    }
}
