package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideTicketCreationResultMessageParser;

    public class GuideTicketCreationResultMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideTicketCreationResultMessageEvent(k:Function)
        {
            super(k, GuideTicketCreationResultMessageParser);
        }

        public function getParser():GuideTicketCreationResultMessageParser
        {
            return _parser as GuideTicketCreationResultMessageParser;
        }
    }
}
