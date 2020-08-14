package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideReportingStatusMessageParser;

    public class _Str_9074 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9074(k:Function)
        {
            super(k, GuideReportingStatusMessageParser);
        }

        public function getParser():GuideReportingStatusMessageParser
        {
            return _parser as GuideReportingStatusMessageParser;
        }
    }
}
