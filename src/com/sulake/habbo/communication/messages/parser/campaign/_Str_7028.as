package com.sulake.habbo.communication.messages.parser.campaign
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7028 implements IMessageParser 
    {
        private var _campaignCalendarData:CampaignCalendarData;

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._campaignCalendarData = new CampaignCalendarData();
            this._campaignCalendarData.parse(k);
            return true;
        }

        public function flush():Boolean
        {
            this._campaignCalendarData = null;
            return true;
        }

        public function getCampaignCalenderData():CampaignCalendarData
        {
            return (this._campaignCalendarData) ? this._campaignCalendarData.clone() : null;
        }
    }
}
