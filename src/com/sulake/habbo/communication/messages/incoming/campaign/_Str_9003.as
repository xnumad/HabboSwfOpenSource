package com.sulake.habbo.communication.messages.incoming.campaign
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarDataMessageParser;

    public class _Str_9003 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9003(k:Function)
        {
            super(k, CampaignCalendarDataMessageParser);
        }

        public function getParser():CampaignCalendarDataMessageParser
        {
            return _parser as CampaignCalendarDataMessageParser;
        }
    }
}
