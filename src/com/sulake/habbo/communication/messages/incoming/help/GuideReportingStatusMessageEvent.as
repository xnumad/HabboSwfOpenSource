package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideReportingStatusMessageParser;

    public class GuideReportingStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideReportingStatusMessageEvent(k:Function)
        {
            super(k, GuideReportingStatusMessageParser);
        }

        public function getParser():GuideReportingStatusMessageParser
        {
            return _parser as GuideReportingStatusMessageParser;
        }
    }
}
