package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;

    public class GuideSessionStartedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionStartedMessageEvent(k:Function)
        {
            super(k, GuideSessionStartedMessageParser);
        }

        public function getParser():GuideSessionStartedMessageParser
        {
            return _parser as GuideSessionStartedMessageParser;
        }
    }
}
