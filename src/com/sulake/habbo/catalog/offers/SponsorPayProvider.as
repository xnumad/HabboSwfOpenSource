package com.sulake.habbo.catalog.offers
{
    import flash.utils.Timer;
    import flash.external.ExternalInterface;
    import flash.events.TimerEvent;

    public class SponsorPayProvider implements IOfferProvider 
    {
        private static const SPONSORPAYLOADED:String = "sponsorPayLoaded";
        private static const SPONSORPAYONSTART:String = "sponsorPayOnStart";
        private static const SPONSORPAYNOOFFERS:String = "sponsorPayNoOffers";
        private static const SPONSORPAYONCLOSE:String = "sponsorPayOnClose";
        private static const SPONSORPAYONCONVERSION:String = "sponsorPayOnConversion";
        private static const SPONSORPAY_LOADINTEGRATION:String = "SponsorPay.loadIntegration";
        private static const SPONSORPAY_SHOWVIDEO:String = "SponsorPay.showVideo";
        private static const SPONSORPAY_BACKGROUNDLOAD:String = "SponsorPay.backgroundLoad";
        private static const _Str_17517:int = 150000;

        private var _disposed:Boolean;
        private var _offerCenter:OfferCenter;
        private var _loaded:Boolean;
        private var _available:Boolean;
        private var _showingPopup:Boolean;
        private var _resetTimer:Timer;

        public function SponsorPayProvider(k:OfferCenter):void
        {
            this._offerCenter = k;
            if (!this.enabled)
            {
                return;
            }
            ExternalInterface.addCallback(SPONSORPAYLOADED, this.sponsorPayLoaded);
            ExternalInterface.addCallback(SPONSORPAYONSTART, this.sponsorPayOnStart);
            ExternalInterface.addCallback(SPONSORPAYNOOFFERS, this.sponsorPayNoOffers);
            ExternalInterface.addCallback(SPONSORPAYONCLOSE, this.sponsorPayOnClose);
            ExternalInterface.addCallback(SPONSORPAYONCONVERSION, this.sponsorPayOnConversion);
            this._resetTimer = new Timer(_Str_17517, 1);
            this._resetTimer.addEventListener(TimerEvent.TIMER, this._Str_22037);
        }

        private function _Str_22037(k:TimerEvent):void
        {
            this.sponsorPayOnClose();
        }

        public function load():void
        {
            if (this._loaded)
            {
                this.sponsorPayLoaded();
                return;
            }
            if (this.enabled)
            {
                try
                {
                    ExternalInterface.call(SPONSORPAY_LOADINTEGRATION, this._Str_19717);
                    this._loaded = true;
                }
                catch(e:Error)
                {
                    Logger.log(((("External interface not working. Could not call " + SPONSORPAY_LOADINTEGRATION) + ": ") + e));
                }
            }
        }

        private function get _Str_19717():String
        {
            return this._offerCenter.configuration.getProperty("offers.sponsorpay.appid");
        }

        public function showVideo():void
        {
            if (((this._loaded) && (this.enabled)))
            {
                try
                {
                    ExternalInterface.call(SPONSORPAY_SHOWVIDEO);
                    this._showingPopup = true;
                    this._resetTimer.reset();
                    this._resetTimer.start();
                    this._Str_4988();
                }
                catch(e:Error)
                {
                    Logger.log(((("External interface not working. Could not call " + SPONSORPAY_SHOWVIDEO) + ": ") + e));
                }
            }
        }

        private function sponsorPayLoaded():void
        {
            if (this._showingPopup)
            {
                return;
            }
            this._available = false;
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call(SPONSORPAY_BACKGROUNDLOAD);
                }
                else
                {
                    Logger.log((("External interface not available. Could not call " + SPONSORPAY_BACKGROUNDLOAD) + "."));
                }
            }
            catch(e:Error)
            {
                Logger.log(((("External interface not working. Could not call " + SPONSORPAY_BACKGROUNDLOAD) + ": ") + e));
            }
        }

        private function sponsorPayOnStart(k:String):void
        {
            this._available = true;
            this._Str_4988();
        }

        private function sponsorPayNoOffers():void
        {
            this._available = false;
            this._Str_4988();
        }

        private function sponsorPayOnClose():void
        {
            this._showingPopup = false;
            if (this._resetTimer)
            {
                this._resetTimer.stop();
            }
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call(SPONSORPAY_BACKGROUNDLOAD);
                }
                else
                {
                    Logger.log((("External interface not available. Could not call " + SPONSORPAY_BACKGROUNDLOAD) + "."));
                }
            }
            catch(e:Error)
            {
                Logger.log(((("External interface not working. Could not call " + SPONSORPAY_BACKGROUNDLOAD) + ": ") + e));
            }
            finally
            {
                this._Str_4988();
            }
        }

        private function sponsorPayOnConversion():void
        {
            if (this._offerCenter != null)
            {
                this._offerCenter._Str_24469();
            }
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
                ExternalInterface.addCallback(SPONSORPAYLOADED, null);
                ExternalInterface.addCallback(SPONSORPAYONSTART, null);
                ExternalInterface.addCallback(SPONSORPAYNOOFFERS, null);
                ExternalInterface.addCallback(SPONSORPAYONCLOSE, null);
                ExternalInterface.addCallback(SPONSORPAYONCONVERSION, null);
            }
            if (this._resetTimer != null)
            {
                this._resetTimer.removeEventListener(TimerEvent.TIMER, this._Str_22037);
                this._resetTimer.stop();
                this._resetTimer = null;
            }
            this._offerCenter = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_15510():Boolean
        {
            return this._available;
        }

        public function get _Str_16897():Boolean
        {
            return this._showingPopup;
        }

        public function get enabled():Boolean
        {
            return (!(this._Str_19717 == "")) && (ExternalInterface.available);
        }
    }
}
