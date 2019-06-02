package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;
    import __AS3__.vec.*;

    public class VideoOfferManager implements IVideoOfferManager, IDisposable 
    {
        private static const CAMPAIGNS_READY:String = "supersaverAdsOnCampaignsReady";
        private static const CAMPAIGN_COMPLETED:String = "supersaverAdsOnCampaignCompleted";
        private static const CAMPAIGN_OPEN:String = "supersaverAdsOnCampaignOpen";
        private static const CAMPAIGN_CLOSE:String = "supersaverAdsOnCampaignClose";
        private static const LOAD_CAMPAIGNS:String = "supersaverAdsLoadCampaigns";
        private static const CAMPAIGN_ENGAGE:String = "supersaverAdsCamapaignEngage";

        private var _disposed:Boolean;
        private var _catalog:HabboCatalog;
        private var _enabled:Boolean;
        private var _offersAvailable:int;
        private var _offersViewed:int = 0;
        private var _offersRequested:Boolean;
        private var _offersReceived:Boolean;
        private var _launchers:Vector.<IVideoOfferLauncher>;
        private var _callbacksAdded:Boolean;

        public function VideoOfferManager(k:HabboCatalog)
        {
            this._catalog = k;
            this._launchers = new Vector.<IVideoOfferLauncher>();
            this._enabled = false;
            this._catalog.connection.addMessageEvent(new UserRightsMessageEvent(this._Str_4297));
            this._Str_21648();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get enabled():Boolean
        {
            return this._enabled;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._catalog = null;
            this._launchers = null;
            this._enabled = false;
            if (((this._callbacksAdded) && (ExternalInterface.available)))
            {
                ExternalInterface.addCallback(CAMPAIGNS_READY, null);
                ExternalInterface.addCallback(CAMPAIGN_COMPLETED, null);
                ExternalInterface.addCallback(CAMPAIGN_OPEN, null);
                ExternalInterface.addCallback(CAMPAIGN_CLOSE, null);
                this._callbacksAdded = false;
            }
            this._disposed = true;
        }

        private function _Str_21648():void
        {
            if ((((this._enabled) && (!(this._callbacksAdded))) && (ExternalInterface.available)))
            {
                ExternalInterface.addCallback(CAMPAIGNS_READY, this._Str_18543);
                ExternalInterface.addCallback(CAMPAIGN_COMPLETED, this._Str_22666);
                ExternalInterface.addCallback(CAMPAIGN_OPEN, this._Str_18305);
                ExternalInterface.addCallback(CAMPAIGN_CLOSE, this._Str_18245);
                this._callbacksAdded = true;
            }
        }

        private function _Str_4297(k:UserRightsMessageEvent):void
        {
            if (k.securityLevel >= SecurityLevelEnum._Str_18829)
            {
                this._enabled = false;
                this._Str_21648();
            }
        }

        public function load(k:IVideoOfferLauncher):void
        {
            if (!this._enabled)
            {
                return;
            }
            if (((this._offersRequested) && (this._offersReceived)))
            {
                k.offersAvailable(this._offersAvailable);
            }
            else
            {
                if (((!(this._offersRequested)) && (ExternalInterface.available)))
                {
                    ExternalInterface.call(LOAD_CAMPAIGNS);
                    this._offersRequested = true;
                }
                this._launchers.push(k);
            }
        }

        public function launch(k:VideoOfferTypeEnum):Boolean
        {
            if (((!(this._enabled)) || (this._offersAvailable < 1)))
            {
                return false;
            }
            if (ExternalInterface.available)
            {
                this._offersViewed = (this._offersViewed + 1);
                ExternalInterface.call(CAMPAIGN_ENGAGE);
                this._Str_24888();
                if (this._catalog.connection)
                {
                    this._catalog.connection.send(new EventLogMessageComposer("SuperSaverAds", "client_action", "supersaverads.video.promo.launched"));
                }
                return this._offersAvailable > this._offersViewed;
            }
            return false;
        }

        private function _Str_18543(k:String):void
        {
            this._offersReceived = true;
            this._offersAvailable = parseInt(k);
            if (isNaN(this._offersAvailable))
            {
                this._offersAvailable = 0;
            }
            while (this._launchers.length > 0)
            {
                this._launchers.pop().offersAvailable(this._offersAvailable);
            }
        }

        private function _Str_18305():void
        {
        }

        private function _Str_18245():void
        {
            this._Str_19586();
            if (this._catalog.connection)
            {
                this._catalog.connection.send(new EventLogMessageComposer("SuperSaverAds", "client_action", "supersaverads.video.promo.close"));
            }
        }

        private function _Str_22666():void
        {
            this._Str_19586();
            if (this._catalog.connection)
            {
                this._catalog.connection.send(new EventLogMessageComposer("SuperSaverAds", "client_action", "supersaverads.video.promo.complete"));
            }
        }

        private function _Str_24888():void
        {
            if (this._catalog.soundManager)
            {
                this._catalog.soundManager.mute(true);
            }
        }

        private function _Str_19586():void
        {
            if (this._catalog.soundManager)
            {
                this._catalog.soundManager.mute(false);
            }
        }
    }
}
