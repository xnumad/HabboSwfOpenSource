package com.sulake.habbo.communication.messages.incoming.campaign
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarDataMessageParser;

    public class CampaignCalendarDataMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CampaignCalendarDataMessageEvent(k:Function)
        {
            super(k, CampaignCalendarDataMessageParser);
        }

        public function getParser():CampaignCalendarDataMessageParser
        {
            return _parser as CampaignCalendarDataMessageParser;
        }
    }
}
