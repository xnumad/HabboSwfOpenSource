package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionEndedMessageParser;

    public class GuideSessionEndedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionEndedMessageEvent(k:Function)
        {
            super(k, GuideSessionEndedMessageParser);
        }

        public function getParser():GuideSessionEndedMessageParser
        {
            return _parser as GuideSessionEndedMessageParser;
        }
    }
}
