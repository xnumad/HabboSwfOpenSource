package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionPartnerIsTypingMessageParser;

    public class GuideSessionPartnerIsTypingMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionPartnerIsTypingMessageEvent(k:Function)
        {
            super(k, GuideSessionPartnerIsTypingMessageParser);
        }

        public function getParser():GuideSessionPartnerIsTypingMessageParser
        {
            return _parser as GuideSessionPartnerIsTypingMessageParser;
        }
    }
}
