package com.sulake.habbo.communication.messages.incoming.campaign
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarDoorOpenedMessageParser;

    public class _Str_9045 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9045(k:Function)
        {
            super(k, CampaignCalendarDoorOpenedMessageParser);
        }

        public function getParser():CampaignCalendarDoorOpenedMessageParser
        {
            return _parser as CampaignCalendarDoorOpenedMessageParser;
        }
    }
}
