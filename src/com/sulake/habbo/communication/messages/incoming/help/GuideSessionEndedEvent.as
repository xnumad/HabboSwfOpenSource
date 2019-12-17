package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionEndedMessageParser;

    public class GuideSessionEndedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionEndedEvent(k:Function)
        {
            super(k, GuideSessionEndedMessageParser);
        }

        public function getParser():GuideSessionEndedMessageParser
        {
            return _parser as GuideSessionEndedMessageParser;
        }
    }
}
