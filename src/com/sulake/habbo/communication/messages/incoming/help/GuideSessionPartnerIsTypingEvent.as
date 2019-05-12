package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionPartnerIsTypingMessageParser;

    public class GuideSessionPartnerIsTypingEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionPartnerIsTypingEvent(k:Function)
        {
            super(k, GuideSessionPartnerIsTypingMessageParser);
        }

        public function _Str_2273():GuideSessionPartnerIsTypingMessageParser
        {
            return _parser as GuideSessionPartnerIsTypingMessageParser;
        }
    }
}
