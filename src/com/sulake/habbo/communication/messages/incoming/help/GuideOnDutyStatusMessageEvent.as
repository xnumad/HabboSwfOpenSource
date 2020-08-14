package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideOnDutyStatusMessageParser;

    public class GuideOnDutyStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideOnDutyStatusMessageEvent(k:Function)
        {
            super(k, GuideOnDutyStatusMessageParser);
        }

        public function getParser():GuideOnDutyStatusMessageParser
        {
            return _parser as GuideOnDutyStatusMessageParser;
        }
    }
}
