package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideOnDutyStatusMessageParser;

    public class _Str_8903 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8903(k:Function)
        {
            super(k, GuideOnDutyStatusMessageParser);
        }

        public function getParser():GuideOnDutyStatusMessageParser
        {
            return _parser as GuideOnDutyStatusMessageParser;
        }
    }
}
