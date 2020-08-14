package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideTicketResolutionMessageParser;

    public class _Str_9538 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9538(k:Function)
        {
            super(k, GuideTicketResolutionMessageParser);
        }

        public function getParser():GuideTicketResolutionMessageParser
        {
            return _parser as GuideTicketResolutionMessageParser;
        }
    }
}
