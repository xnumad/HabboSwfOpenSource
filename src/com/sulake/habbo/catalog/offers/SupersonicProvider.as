package com.sulake.habbo.catalog.offers
{
    import flash.external.ExternalInterface;

    public class SupersonicProvider implements IOfferProvider 
    {
        private static const SUPERSONICADSONCAMPAIGNSREADY:String = "supersonicAdsOnCampaignsReady";
        private static const SUPERSONICADSONCAMPAIGNCOMPLETED:String = "supersonicAdsOnCampaignCompleted";
        private static const SUPERSONICADSONCAMPAIGNOPEN:String = "supersonicAdsOnCampaignOpen";
        private static const SUPERSONICADSONCAMPAIGNCLOSE:String = "supersonicAdsOnCampaignClose";
        private static const SUPERSONICADSLOADCAMPAIGNS:String = "supersonicAdsLoadCampaigns";
        private static const SUPERSONICADSCAMAPAIGNENGAGE:String = "supersonicAdsCamapaignEngage";

        private var _disposed:Boolean;
        private var _offerCenter:OfferCenter;
        private var _offerCount:int;
        private var _showingPopup:Boolean;
        private var _loaded:Boolean;

        public function SupersonicProvider(k:OfferCenter)
        {
            this._offerCenter = k;
            if (this.enabled)
            {
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNSREADY, this._Str_18543);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNCOMPLETED, this._Str_24285);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNOPEN, this._Str_18305);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNCLOSE, this._Str_18245);
            }
        }

        private function _Str_18543(k:String):void
        {
            this._offerCount = int(k);
            this._Str_4988();
        }

        private function _Str_18305():void
        {
            this._showingPopup = true;
            this._Str_4988();
        }

        private function _Str_18245():void
        {
            this._showingPopup = false;
            this._Str_4988();
        }

        private function _Str_24285():void
        {
        }

        public function load():void
        {
            if (((this.enabled) && (!(this._loaded))))
            {
                try
                {
                    ExternalInterface.call(SUPERSONICADSLOADCAMPAIGNS);
                    this._loaded = true;
                }
                catch(e:Error)
                {
                    Logger.log(((("External interface not working. Could not call " + SUPERSONICADSLOADCAMPAIGNS) + ": ") + e));
                }
            }
        }

        public function showVideo():void
        {
            if (((this.enabled) && (this._offerCount > 0)))
            {
                try
                {
                    ExternalInterface.call(SUPERSONICADSCAMAPAIGNENGAGE);
                    this._offerCount--;
                }
                catch(e:Error)
                {
                    Logger.log(((("External interface not working. Could not call " + SUPERSONICADSCAMAPAIGNENGAGE) + ": ") + e));
                }
            }
        }

        public function get _Str_15510():Boolean
        {
            return this._offerCount > 0;
        }

        public function get _Str_16897():Boolean
        {
            return this._showingPopup;
        }

        private function _Str_4988():void
        {
            if (this._offerCenter != null)
            {
                this._offerCenter._Str_4988();
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNSREADY, null);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNCOMPLETED, null);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNOPEN, null);
                ExternalInterface.addCallback(SUPERSONICADSONCAMPAIGNCLOSE, null);
            }
            this._offerCenter = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get enabled():Boolean
        {
            return (this._offerCenter.configuration.getBoolean("offers.supersonic.enabled")) && (ExternalInterface.available);
        }
    }
}
