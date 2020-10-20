package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CurrentTimingCodeMessageParser;

    public class CurrentTimingCodeMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CurrentTimingCodeMessageEvent(k:Function)
        {
            super(k, CurrentTimingCodeMessageParser);
        }

        public function getParser():CurrentTimingCodeMessageParser
        {
            return _parser as CurrentTimingCodeMessageParser;
        }
    }
}
