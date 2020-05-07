package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.callforhelp.SanctionStatusMessageParser;

    public class SanctionStatusEvent extends MessageEvent implements IMessageEvent
    {
        public function SanctionStatusEvent(k:Function)
        {
            super(k, SanctionStatusMessageParser);
        }

        public function getParser():SanctionStatusMessageParser
        {
            return _parser as SanctionStatusMessageParser;
        }
    }
}
