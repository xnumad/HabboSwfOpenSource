package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideTicketCreationResultMessageParser;

    public class _Str_8429 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8429(k:Function)
        {
            super(k, GuideTicketCreationResultMessageParser);
        }

        public function getParser():GuideTicketCreationResultMessageParser
        {
            return _parser as GuideTicketCreationResultMessageParser;
        }
    }
}
