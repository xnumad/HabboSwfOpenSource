package org.openvideoads.vast.model
{
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.overlay.VPAIDWrapper;
    import flash.utils.Timer;
    import org.openvideoads.vast.overlay.OverlayView;
    import org.openvideoads.vpaid._Str_5844;
    import org.openvideoads.vpaid._Str_2291;
    import org.openvideoads.util.BrowserUtils;
    import flash.events.TimerEvent;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.UserAgentUtils;

    public class VPAIDMediaFile extends MediaFile implements _Str_5226, _Str_4027 
    {
        protected var _Str_2339:VPAIDWrapper = null;
        protected var _Str_7754:Function;
        protected var _Str_7072:Function;
        protected var _Str_7045:Function;
        protected var _Str_7602:Function;
        protected var _Str_7990:Function;
        protected var _Str_8113:Function;
        protected var _Str_7608:Function;
        protected var _Str_7129:Function;
        protected var _Str_7909:Function;
        protected var _Str_7622:Function;
        protected var _Str_7604:Function;
        protected var _Str_7855:Function;
        protected var _Str_7158:Function;
        protected var _Str_7650:Function;
        protected var _Str_7403:Function;
        protected var _Str_7714:Function;
        protected var _Str_7275:Function;
        protected var _Str_8111:Function;
        protected var _Str_7026:Function;
        protected var _Str_7354:Function;
        protected var _Str_8096:Function;
        protected var _Str_7259:Function;
        protected var _Str_7958:Function;
        protected var _Str_7927:Function;
        protected var _Str_8201:Function;
        protected var _Str_7299:Function;
        protected var _Str_7764:Function = null;
        protected var _Str_2850:Timer = null;
        protected var _Str_12307:int = 65;
        protected var _Str_9374:Boolean = false;
        protected var _Str_4442:OverlayView = null;
        protected var _running:Boolean = false;
        protected var _Str_9771:Boolean = false;
        protected var _Str_7538:Boolean = false;
        protected var _Str_18032:Boolean = false;


        public function signalLoadError(k:String):void
        {
            this._Str_4213(k);
        }

        public function get recommendedWidth():int
        {
            if (_width != null)
            {
                return parseInt(_width);
            }
            return -1;
        }

        public function get recommendedHeight():int
        {
            if (_height != null)
            {
                return parseInt(_height);
            }
            return -1;
        }

        public function set enforceRecommendedSizing(k:Boolean):void
        {
            this._Str_9771 = k;
        }

        public function get enforceRecommendedSizing():Boolean
        {
            return this._Str_9771;
        }

        public function _Str_3654():void
        {
            this._Str_18032 = false;
        }

        public function _Str_3144():void
        {
            this._Str_18032 = true;
        }

        public function get loaded():Boolean
        {
            return this._Str_18032;
        }

        public function _Str_10362(k:OverlayView):void
        {
            this._Str_4442 = k;
        }

        public function _Str_4668():OverlayView
        {
            return this._Str_4442;
        }

        public function _Str_7544():Boolean
        {
            return !(this._Str_4442 == null);
        }

        public function _Str_13233():void
        {
            if (this._Str_7544())
            {
                this._Str_4442.hide();
                this._Str_4442 = null;
            }
        }

        override public function unload():void
        {
            if (this.isRunning())
            {
                this._Str_7538 = true;
                this._Str_2339.stopAd();
            }
            this.removeListeners();
            if (this._Str_7544())
            {
                this._Str_4442._Str_13579();
                this._Str_13233();
            }
            this._Str_2339 = null;
        }

        public function getVPAID():_Str_5844
        {
            if (this._Str_2339 != null)
            {
                return this._Str_2339;
            }
            return null;
        }

        public function isRunning():Boolean
        {
            return (!(this._Str_2339 == null)) && (this._running);
        }

        public function _Str_25919():Boolean
        {
            if (this.isRunning())
            {
                return (this._Str_2339.adLinear == false) && (this._Str_2339.adExpanded == false);
            }
            return false;
        }

        public function _Str_18023(k:Function):void
        {
            this._Str_7602 = k;
        }

        public function _Str_16112(k:Function):void
        {
            this._Str_7072 = k;
        }

        public function _Str_17667(k:Function):void
        {
            this._Str_7045 = k;
        }

        public function _Str_18005(k:Function):void
        {
            this._Str_7754 = k;
        }

        public function _Str_18994(k:Function):void
        {
            this._Str_8113 = k;
        }

        public function _Str_16180(k:Function):void
        {
            this._Str_7990 = k;
        }

        public function _Str_16053(k:Function):void
        {
            this._Str_7129 = k;
        }

        public function _Str_16310(k:Function):void
        {
            this._Str_7608 = k;
        }

        public function _Str_17326(k:Function):void
        {
            this._Str_7909 = k;
        }

        public function _Str_17214(k:Function):void
        {
            this._Str_7622 = k;
        }

        public function _Str_18109(k:Function):void
        {
            this._Str_7604 = k;
        }

        public function _Str_17380(k:Function):void
        {
            this._Str_7855 = k;
        }

        public function _Str_18263(k:Function):void
        {
            this._Str_7158 = k;
        }

        public function _Str_16234(k:Function):void
        {
            this._Str_7650 = k;
        }

        public function _Str_17367(k:Function):void
        {
            this._Str_7403 = k;
        }

        public function _Str_16574(k:Function):void
        {
            this._Str_7714 = k;
        }

        public function _Str_15911(k:Function):void
        {
            this._Str_7275 = k;
        }

        public function _Str_17407(k:Function):void
        {
            this._Str_8111 = k;
        }

        public function _Str_16669(k:Function):void
        {
            this._Str_7026 = k;
        }

        public function _Str_22363(k:Function):void
        {
            this._Str_7354 = k;
        }

        public function _Str_24124(k:Function):void
        {
            this._Str_8096 = k;
        }

        public function _Str_17018(k:Function):void
        {
            this._Str_7259 = k;
        }

        public function _Str_18631(k:Function):void
        {
            this._Str_7927 = k;
        }

        public function _Str_18205(k:Function):void
        {
            this._Str_7958 = k;
        }

        public function _Str_17427(k:Function):void
        {
            this._Str_8201 = k;
        }

        public function _Str_18144(k:Function):void
        {
            this._Str_7299 = k;
        }

        public function _Str_18688(k:Function):void
        {
            this._Str_7764 = k;
        }

        public function _Str_17184(k:int):void
        {
            this._Str_12307 = k;
        }

        public function enableMaxDurationTimeout():void
        {
            this._Str_9374 = true;
        }

        public function _Str_18747():void
        {
            this._Str_9374 = false;
        }

        protected function _Str_2763(k:String, _arg_2:Object=null):void
        {
            if (this._Str_7764 != null)
            {
                this._Str_7764(new _Str_2291(k, _arg_2));
            }
        }

        protected function _Str_16122():void
        {
            this._running = true;
            if (this._Str_7602 != null)
            {
                this._Str_7602(new _Str_2291(_Str_2291.AdStarted));
            }
        }

        protected function _Str_4213(k:String):void
        {
            this._running = false;
            if (this._Str_7072 != null)
            {
                this._Str_7072(new _Str_2291(_Str_2291.AdError, k));
            }
        }

        protected function _Str_7676(k:*=null):void
        {
            if (this._Str_7045 != null)
            {
                this._Str_7045(new _Str_2291(_Str_2291.AdLog, k));
            }
        }

        protected function _Str_18050(k:String):void
        {
            this._running = false;
            if (this._Str_7754 != null)
            {
                this._Str_7754(new _Str_2291(k, {"terminated":this._Str_7538}));
            }
        }

        protected function _Str_19655():void
        {
            if (this._Str_7909 != null)
            {
                this._Str_7909(new _Str_2291(_Str_2291.AdLoaded));
            }
        }

        protected function _Str_17620():void
        {
            if (this._Str_7622 != null)
            {
                this._Str_7622(new _Str_2291(_Str_2291.AdImpression));
            }
        }

        protected function _Str_18457():void
        {
            if (this._Str_7604 != null)
            {
                this._Str_7604(new _Str_2291(_Str_2291.AdClickThru));
            }
        }

        protected function _Str_16595():void
        {
            if (this._Str_7855 != null)
            {
                this._Str_7855(new _Str_2291(_Str_2291.AdUserAcceptInvitation));
            }
        }

        protected function _Str_16009():void
        {
            if (this._Str_7608 != null)
            {
                this._Str_7608(new _Str_2291(_Str_2291.AdVolumeChange, ((this._Str_2339 != null) ? this._Str_2339.adVolume : null)));
            }
        }

        protected function _Str_17450():void
        {
            if (this._Str_7158 != null)
            {
                this._Str_7158(new _Str_2291(_Str_2291.AdUserMinimize));
            }
        }

        protected function _Str_15930():void
        {
            if (this._Str_7650 != null)
            {
                this._Str_7650(new _Str_2291(_Str_2291.AdUserClose));
            }
        }

        protected function _Str_17749():void
        {
            if (this._Str_7403 != null)
            {
                this._Str_7403(new _Str_2291(_Str_2291.AdVideoStart));
            }
        }

        protected function _Str_17930():void
        {
            if (this._Str_7714 != null)
            {
                this._Str_7714(new _Str_2291(_Str_2291.AdVideoFirstQuartile));
            }
        }

        protected function _Str_17794():void
        {
            if (this._Str_7275 != null)
            {
                this._Str_7275(new _Str_2291(_Str_2291.AdVideoMidpoint));
            }
        }

        protected function _Str_17525():void
        {
            if (this._Str_8111 != null)
            {
                this._Str_8111(new _Str_2291(_Str_2291.AdVideoThirdQuartile));
            }
        }

        protected function _Str_17016():void
        {
            if (this._Str_7026 != null)
            {
                this._Str_7026(new _Str_2291(_Str_2291.AdVideoComplete));
            }
        }

        protected function _Str_17824():void
        {
            if (this._Str_7354 != null)
            {
                this._Str_7354(new _Str_2291(_Str_2291.AdPaused));
            }
        }

        protected function _Str_17645():void
        {
            if (this._Str_8096 != null)
            {
                this._Str_8096(new _Str_2291(_Str_2291.AdPlaying));
            }
        }

        protected function _Str_24742():void
        {
            if (this._Str_7259 != null)
            {
                this._Str_7259(new _Str_2291(_Str_2291.AdSkipped));
            }
        }

        protected function _Str_25653():void
        {
            if (this._Str_7958 != null)
            {
                this._Str_7958(new _Str_2291(_Str_2291.AdSizeChange));
            }
        }

        protected function _Str_22852():void
        {
            if (this._Str_7927 != null)
            {
                this._Str_7927(new _Str_2291(_Str_2291.AdSkippableStateChange));
            }
        }

        protected function _Str_22369():void
        {
            if (this._Str_8201 != null)
            {
                this._Str_8201(new _Str_2291(_Str_2291.AdDurationChange));
            }
        }

        protected function _Str_22458():void
        {
            if (this._Str_7299 != null)
            {
                this._Str_7299(new _Str_2291(_Str_2291.AdInteraction));
            }
        }

        public function get _Str_12737():String
        {
            if (_Str_577 != null)
            {
                return _Str_577.url;
            }
            return null;
        }

        protected function removeListeners():void
        {
            if (this._Str_2339 != null)
            {
                this._Str_2339.removeEventListener(_Str_2291.AdLoaded, this._Str_11953);
                this._Str_2339.removeEventListener(_Str_2291.AdStarted, this._Str_11923);
                this._Str_2339.removeEventListener(_Str_2291.AdStopped, this._Str_9919);
                this._Str_2339.removeEventListener(_Str_2291.AdLinearChange, this._Str_11331);
                this._Str_2339.removeEventListener(_Str_2291.AdExpandedChange, this._Str_11651);
                this._Str_2339.removeEventListener(_Str_2291.AdRemainingTimeChange, this._Str_11403);
                this._Str_2339.removeEventListener(_Str_2291.AdVolumeChange, this._Str_11628);
                this._Str_2339.removeEventListener(_Str_2291.AdImpression, this._Str_10917);
                this._Str_2339.removeEventListener(_Str_2291.AdVideoStart, this._Str_9960);
                this._Str_2339.removeEventListener(_Str_2291.AdVideoFirstQuartile, this._Str_12481);
                this._Str_2339.removeEventListener(_Str_2291.AdVideoMidpoint, this._Str_12116);
                this._Str_2339.removeEventListener(_Str_2291.AdVideoThirdQuartile, this._Str_10350);
                this._Str_2339.removeEventListener(_Str_2291.AdVideoComplete, this._Str_10996);
                this._Str_2339.removeEventListener(_Str_2291.AdClickThru, this._Str_10046);
                this._Str_2339.removeEventListener(_Str_2291.AdUserAcceptInvitation, this._Str_11250);
                this._Str_2339.removeEventListener(_Str_2291.AdUserClose, this._Str_10425);
                this._Str_2339.removeEventListener(_Str_2291.AdPaused, this._Str_12292);
                this._Str_2339.removeEventListener(_Str_2291.AdPlaying, this._Str_10670);
                this._Str_2339.removeEventListener(_Str_2291.AdLog, this._Str_11557);
                this._Str_2339.removeEventListener(_Str_2291.AdError, this._Str_11902);
                this._Str_2339.removeEventListener(_Str_2291.AdSkipped, this.onVPAIDAdSkipped);
                this._Str_2339.removeEventListener(_Str_2291.AdSkippableStateChange, this.onVPAIDAdSkippableStateChange);
                this._Str_2339.removeEventListener(_Str_2291.AdSizeChange, this.onVPAIDAdSizeChange);
                this._Str_2339.removeEventListener(_Str_2291.AdDurationChange, this.onVPAIDAdDurationChange);
                this._Str_2339.removeEventListener(_Str_2291.AdInteraction, this.onVPAIDAdInteraction);
            }
        }

        public function registerAsVPAID(k:VPAIDWrapper):Boolean
        {
            var _local_2:String;
            if (k != null)
            {
                this._Str_2339 = k;
                _local_2 = null;
                if (this._Str_2339.isV100())
                {
                    _local_2 = this._Str_2339.initVPAIDVersion("1.0.0");
                }
                else
                {
                    if (this._Str_2339.isV110())
                    {
                        _local_2 = this._Str_2339.handshakeVersion("2.0");
                        this._Str_2339.addEventListener(_Str_2291.AdLoaded, this._Str_11953);
                        this._Str_2339.addEventListener(_Str_2291.AdStarted, this._Str_11923);
                        this._Str_2339.addEventListener(_Str_2291.AdStopped, this._Str_9919);
                        this._Str_2339.addEventListener(_Str_2291.AdLinearChange, this._Str_11331);
                        this._Str_2339.addEventListener(_Str_2291.AdExpandedChange, this._Str_11651);
                        this._Str_2339.addEventListener(_Str_2291.AdRemainingTimeChange, this._Str_11403);
                        this._Str_2339.addEventListener(_Str_2291.AdVolumeChange, this._Str_11628);
                        this._Str_2339.addEventListener(_Str_2291.AdImpression, this._Str_10917);
                        this._Str_2339.addEventListener(_Str_2291.AdVideoStart, this._Str_9960);
                        this._Str_2339.addEventListener(_Str_2291.AdVideoFirstQuartile, this._Str_12481);
                        this._Str_2339.addEventListener(_Str_2291.AdVideoMidpoint, this._Str_12116);
                        this._Str_2339.addEventListener(_Str_2291.AdVideoThirdQuartile, this._Str_10350);
                        this._Str_2339.addEventListener(_Str_2291.AdVideoComplete, this._Str_10996);
                        this._Str_2339.addEventListener(_Str_2291.AdClickThru, this._Str_10046);
                        this._Str_2339.addEventListener(_Str_2291.AdUserAcceptInvitation, this._Str_11250);
                        this._Str_2339.addEventListener(_Str_2291.AdUserClose, this._Str_10425);
                        this._Str_2339.addEventListener(_Str_2291.AdPaused, this._Str_12292);
                        this._Str_2339.addEventListener(_Str_2291.AdPlaying, this._Str_10670);
                        this._Str_2339.addEventListener(_Str_2291.AdLog, this._Str_11557);
                        this._Str_2339.addEventListener(_Str_2291.AdError, this._Str_11902);
                        if (((_local_2 == "2.0") || (_local_2 == "2.0.0")))
                        {
                            this._Str_2339.addEventListener(_Str_2291.AdSkipped, this.onVPAIDAdSkipped);
                            this._Str_2339.addEventListener(_Str_2291.AdSkippableStateChange, this.onVPAIDAdSkippableStateChange);
                            this._Str_2339.addEventListener(_Str_2291.AdSizeChange, this.onVPAIDAdSizeChange);
                            this._Str_2339.addEventListener(_Str_2291.AdDurationChange, this.onVPAIDAdDurationChange);
                            this._Str_2339.addEventListener(_Str_2291.AdInteraction, this.onVPAIDAdInteraction);
                        }
                        return true;
                    }
                }
            }
            return false;
        }

        public function startVPAID(width:Number=-1, height:Number=-1, mode:String="normal", passReferrer:Boolean=false, referrer:String=null):void
        {
            var environmentVars:String;
            if (this._Str_2339 != null)
            {
                this._Str_7538 = false;
                environmentVars = "";
                if (passReferrer)
                {
                    if (referrer != null)
                    {
                        environmentVars = ("referrer=" + referrer);
                    }
                    else
                    {
                        try
                        {
                            referrer = BrowserUtils._Str_18507(true);
                            environmentVars = ("referrer=" + referrer);
                        }
                        catch(e:Error)
                        {
                        }
                    }
                }
                try
                {
                    this._Str_2339.initAd(Math.floor(width), Math.floor(height), mode, 400, ((adParameters == null) ? "" : (adParameters)), ((environmentVars == null) ? "" : environmentVars));
                    this._Str_8612();
                }
                catch(e:Error)
                {
                    _Str_4213(("Exception generated in VPAID.initAd() - aborting - " + e.message));
                }
            }
        }

        public function resize(k:Number, _arg_2:Number, _arg_3:String):void
        {
            if (this._Str_2339 != null)
            {
                this._Str_2339.resizeAd(k, _arg_2, _arg_3);
            }
        }

        public function pause():void
        {
            if (this._Str_2339 != null)
            {
                this._Str_2339.pauseAd();
            }
        }

        public function resume():void
        {
            if (this._Str_2339 != null)
            {
                this._Str_2339.resumeAd();
            }
        }

        protected function _Str_8612():void
        {
            var k:int;
            if (this._Str_9374)
            {
                if (this._Str_2850 == null)
                {
                    k = ((_Str_3543 != null) ? ((_Str_3543.getDurationAsInt() > 0) ? _Str_3543.getDurationAsInt() : this._Str_12307) : this._Str_12307);
                    if (k > 0)
                    {
                        if (this._Str_2850 != null)
                        {
                            this._Str_4743();
                        }
                        this._Str_2850 = new Timer((k * 1000), 2);
                        this._Str_2850.addEventListener(TimerEvent.TIMER, this._Str_4743);
                        this._Str_2850.start();
                    }
                }
            }
        }

        public function _Str_4743(e:TimerEvent=null):void
        {
            if (this._Str_2850 != null)
            {
                this._Str_2850.stop();
                this._Str_2850 = null;
                if (e != null)
                {
                    try
                    {
                        this._Str_2339.stopAd();
                        this._Str_4213("Timeout triggered on VPAID Ad startup - also for safety, tried to forcibly stop the VPAID ad before firing this error");
                    }
                    catch(e:Error)
                    {
                        _Str_4213(("Timeout timer triggered - forcing stop on exception generated from VPAID.stopAd() - " + e.message));
                    }
                }
            }
        }

        override public function isInteractive():Boolean
        {
            return true;
        }

        protected function triggerTrackingEvent(k:String):void
        {
            if (_Str_3543 != null)
            {
                if (_Str_3543.parentAdContainer != null)
                {
                    if (_Str_3543.parentAdContainer.hasWrapper())
                    {
                        _Str_3543.parentAdContainer.wrapper.triggerTrackingEvent(k);
                    }
                    else
                    {
                        _Str_3543.parentAdContainer.triggerTrackingEvent(k);
                    }
                }
            }
        }

        protected function triggerImpressionConfirmations():void
        {
            if (_Str_3543 != null)
            {
                if (_Str_3543.parentAdContainer != null)
                {
                    if (_Str_3543.parentAdContainer.hasWrapper())
                    {
                        _Str_3543.parentAdContainer.wrapper.triggerImpressionConfirmations();
                    }
                    _Str_3543.parentAdContainer.triggerImpressionConfirmations();
                }
            }
        }

        protected function _Str_17523():void
        {
            if (_Str_3543 != null)
            {
                _Str_3543.fireClickTracking();
            }
        }

        protected function _Str_11953(event:*):void
        {
            try
            {
                this._Str_2763(_Str_2291.AdLoaded);
                this._Str_2339.startAd();
                this._Str_19655();
            }
            catch(e:Error)
            {
                _Str_4213(("Exception generated in VPAID.startAd() - aborting - " + e.message));
            }
        }

        protected function _Str_11923(k:*):void
        {
            this._Str_16122();
            this.triggerTrackingEvent(TrackingEvent.START);
            this._Str_2763(_Str_2291.AdStarted);
        }

        protected function _Str_9919(k:*):void
        {
            this._Str_4743();
            this.triggerTrackingEvent(TrackingEvent.STOP);
            this._Str_18050(_Str_2291.AdStopped);
        }

        protected function _Str_11331(k:*):void
        {
            if (this._Str_7990 != null)
            {
                this._Str_7990(new _Str_2291(_Str_2291.AdLinearChange, this._Str_2339.adLinear));
            }
        }

        protected function _Str_11651(k:*):void
        {
            if (this._Str_2339.adExpanded)
            {
                this.triggerTrackingEvent(TrackingEvent.EXPAND);
            }
            else
            {
                this.triggerTrackingEvent(TrackingEvent.COLLAPSE);
            }
            if (this._Str_8113 != null)
            {
                this._Str_8113(new _Str_2291(_Str_2291.AdExpandedChange, {
                    "expanded":this._Str_2339.adExpanded,
                    "linearPlayback":this._Str_2339.adLinear
                }));
            }
        }

        protected function _Str_11403(k:*):void
        {
            var _local_2:Number = this._Str_2339.adRemainingTime;
            if (this._Str_7129 != null)
            {
                this._Str_7129(new _Str_2291(_Str_2291.AdRemainingTimeChange, _local_2));
            }
        }

        protected function _Str_11628(k:*):void
        {
            this._Str_16009();
        }

        protected function _Str_10917(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.CREATIVEVIEW);
            this.triggerImpressionConfirmations();
            this._Str_2763(_Str_2291.AdImpression);
            this._Str_17620();
        }

        protected function _Str_9960(k:*):void
        {
            this._Str_2763(_Str_2291.AdVideoStart);
            this._Str_17749();
        }

        protected function _Str_12481(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.EVENT_1STQUARTILE);
            this._Str_2763(_Str_2291.AdVideoFirstQuartile);
            this._Str_17930();
        }

        protected function _Str_12116(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.MIDPOINT);
            this._Str_2763(_Str_2291.AdVideoMidpoint);
            this._Str_17794();
        }

        protected function _Str_10350(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.EVENT_3RDQUARTILE);
            this._Str_2763(_Str_2291.AdVideoThirdQuartile);
            this._Str_17525();
        }

        protected function _Str_10996(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.COMPLETE);
            this._Str_2763(_Str_2291.AdVideoComplete);
            this._Str_17016();
        }

        protected function _Str_10046(k:*):void
        {
            try
            {
                if (((!(k.data == undefined)) && (!(k.data == null))))
                {
                    if (((k.data.playerHandles) && (!(StringUtils.isEmpty(k.data.url)))))
                    {
                        UserAgentUtils._Str_2826(k.data.url, "_blank");
                    }
                }
            }
            catch(e:Error)
            {
            }
            this._Str_17523();
            this._Str_2763(_Str_2291.AdClickThru);
            this._Str_18457();
        }

        protected function _Str_11250(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.ACCEPTINVITATION);
            this._Str_2763(_Str_2291.AdUserAcceptInvitation);
            this._Str_16595();
        }

        protected function _Str_22288(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.COLLAPSE);
            this._Str_2763(_Str_2291.AdUserMinimize);
            this._Str_17450();
        }

        protected function _Str_10425(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.CLOSE);
            this._Str_2763(_Str_2291.AdUserClose);
            this._Str_15930();
        }

        protected function _Str_12292(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.PAUSE);
            this._Str_4743();
            this._Str_2763(_Str_2291.AdPaused);
            this._Str_17824();
        }

        protected function _Str_10670(k:*):void
        {
            this.triggerTrackingEvent(TrackingEvent.RESUME);
            this._Str_8612();
            this._Str_2763(_Str_2291.AdPlaying);
            this._Str_17645();
        }

        protected function _Str_11557(k:*):void
        {
            if (k != null)
            {
                if (k.data != null)
                {
                    if ((k.data is String))
                    {
                        this._Str_7676(k.data);
                        return;
                    }
                    if ((k.data is Object))
                    {
                        this._Str_7676(k.data.message);
                        return;
                    }
                }
            }
            this._Str_7676();
        }

        protected function _Str_11902(k:*):void
        {
            this._Str_4743();
            var _local_2:String = ((k.data != null) ? ((k.data.message != undefined) ? k.data.message : k.data) : "no error message provided");
            this._Str_4213(_local_2);
        }

        protected function onVPAIDAdSkipped(k:*):void
        {
            this._Str_2763(_Str_2291.AdSkipped, k.data);
        }

        protected function onVPAIDAdSkippableStateChange(k:*):void
        {
            this._Str_2763(_Str_2291.AdSkippableStateChange, k.data);
        }

        protected function onVPAIDAdSizeChange(k:*):void
        {
            this._Str_2763(_Str_2291.AdSizeChange, k.data);
        }

        protected function onVPAIDAdDurationChange(k:*):void
        {
            this._Str_2763(_Str_2291.AdDurationChange, k.data);
        }

        protected function onVPAIDAdInteraction(k:*):void
        {
            this._Str_2763(_Str_2291.AdInteraction, k.data);
        }

        public function _Str_12035():Object
        {
            if (this._Str_2339 != null)
            {
                return this._Str_2339._Str_12035();
            }
            return new Object();
        }
    }
}
