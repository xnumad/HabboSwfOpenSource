package org.openvideoads.vast.model
{
    import org.openvideoads.vast.server.response._Str_3802;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.vast.server.request.wrapped._Str_6140;
    import org.openvideoads.vast.server.response.AdServerTemplate;
    import flash.events.Event;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.events._Str_3019;

    public class WrappedVideoAdV1 extends VideoAd implements _Str_3802 
    {
        protected var _Str_5185:String = null;
        protected var _Str_2620:VideoAdServingTemplate = null;
        protected var _Str_8143:Object = null;
        protected var _Str_4845:VideoAdServingTemplate = null;
        protected var _Str_2611:VideoAd = null;
        protected var _Str_15129:Array;
        protected var _Str_17653:Array;
        protected var _Str_19298:AdServerConfig = null;

        public function WrappedVideoAdV1(k:Object, _arg_2:XML=null, _arg_3:VideoAdServingTemplate=null, _arg_4:AdServerConfig=null)
        {
            this._Str_15129 = new Array();
            this._Str_17653 = new Array();
            super();
            this._Str_8143 = k;
            this._Str_4845 = _arg_3;
            this._Str_19298 = _arg_4;
            if (_arg_2 != null)
            {
                this.initialise(_arg_2);
            }
        }

        protected function initialise(k:XML):void
        {
            this.id = k.adId;
            adSystem = k.AdSystem;
            if (k.VASTAdTagURL.URL != undefined)
            {
                this._Str_6281 = k.VASTAdTagURL.URL.text();
            }
            _Str_16323(k);
            _Str_18315(k);
            this._Str_22331(k);
            if (this._Str_17688())
            {
                this._Str_24923();
            }
        }

        override public function setPreferredSelectionCriteria(k:Object):void
        {
            _Str_3562 = k;
            if (this._Str_2611 != null)
            {
                this._Str_2611.setPreferredSelectionCriteria(k);
            }
        }

        public function _Str_22331(k:XML):void
        {
            var _local_2:XMLList;
            var _local_3:XML;
            var _local_4:int;
            if (k.VideoClicks != undefined)
            {
                if (k.VideoClicks.ClickTracking != undefined)
                {
                    _local_4 = 0;
                    if (k.VideoClicks.ClickTracking.children().length() > 0)
                    {
                        _local_2 = k.VideoClicks.ClickTracking.children();
                        _local_4 = 0;
                        while (_local_4 < _local_2.length())
                        {
                            _local_3 = _local_2[_local_4];
                            if (!StringUtils.isEmpty(_local_3.text()))
                            {
                                this._Str_10053(new NetworkResource(_local_3.@id, _local_3.text()));
                            }
                            _local_4++;
                        }
                    }
                }
                if (k.VideoClicks.CustomClick != undefined)
                {
                    if (k.VideoClicks.CustomClick.children().length() > 0)
                    {
                        _local_2 = k.CustomClick.ClickTracking.children();
                        _local_4 = 0;
                        while (_local_4 < _local_2.length())
                        {
                            _local_3 = _local_2[_local_4];
                            if (!StringUtils.isEmpty(_local_3.text()))
                            {
                                this._Str_10085(new NetworkResource(_local_3.@id, _local_3.text()));
                            }
                            _local_4++;
                        }
                    }
                }
            }
        }

        public function _Str_10053(k:NetworkResource):void
        {
            this._Str_15129.push(k);
        }

        public function _Str_26348():Array
        {
            return this._Str_15129;
        }

        override public function addClickTrackingItems(k:Array):void
        {
            if (this._Str_2717())
            {
                return this._Str_2611.addClickTrackingItems(k);
            }
        }

        public function _Str_10085(k:NetworkResource):void
        {
            this._Str_17653.push(k);
        }

        override public function addCustomClickTrackingItems(k:Array):void
        {
            if (this._Str_2717())
            {
                return this._Str_2611.addCustomClickTrackingItems(k);
            }
        }

        override public function getImpressionList():Array
        {
            if (this._Str_2717())
            {
                return this._Str_2611.getImpressionList();
            }
            return new Array();
        }

        override public function canFireAPICalls():Boolean
        {
            return false;
        }

        override public function canFireEventAPICalls():Boolean
        {
            return false;
        }

        override public function get useV2APICalls():Boolean
        {
            return false;
        }

        override public function get jsCallbackScopingPrefix():String
        {
            return "";
        }

        public function get analyticsProcessor():_Str_2408
        {
            if (this._Str_4845 != null)
            {
                return this._Str_4845.analyticsProcessor;
            }
            return null;
        }

        override public function set id(k:String):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.id = k;
            }
            _id = k;
        }

        override public function get id():String
        {
            if (this._Str_2717())
            {
                return this._Str_2611.id;
            }
            if (this._Str_8143 != null)
            {
                if (this._Str_8143.hasOwnProperty("id"))
                {
                    return this._Str_8143.id;
                }
            }
            return _id;
        }

        public function set _Str_6281(k:String):void
        {
            this._Str_5185 = k;
        }

        public function get _Str_6281():String
        {
            return this._Str_5185;
        }

        public function _Str_17688():Boolean
        {
            return (!(this._Str_5185 == null)) && (StringUtils.isEmpty(this._Str_5185) == false);
        }

        public function _Str_24923():void
        {
            var k:_Str_6140;
            var _local_2:Array;
            if (this._Str_5185 != null)
            {
                if (this._Str_4845 != null)
                {
                    this._Str_4845._Str_15107(_Str_2995);
                }
                k = new _Str_6140(this._Str_5185, this._Str_19298);
                _local_2 = new Array();
                _local_2.push(this._Str_8143);
                this._Str_2620 = new VideoAdServingTemplate(this, k, true, _local_2);
            }
        }

        public function onTemplateLoaded(k:AdServerTemplate):void
        {
            this._Str_2611 = this._Str_2620._Str_24138();
            if (this._Str_2611 != null)
            {
                this._Str_2611.addClickTrackingItems(this._Str_15129);
                this._Str_2611.addCustomClickTrackingItems(this._Str_17653);
                this._Str_2611.wrapper = this;
            }
            this._Str_4845._Str_6919(_Str_2995);
        }

        public function onTemplateLoadError(k:Event):void
        {
            this._Str_4845._Str_6067(_Str_2995, k);
        }

        public function _Str_5807(k:Event):void
        {
            this._Str_4845._Str_8677(uid, k);
        }

        public function _Str_5916(k:Event):void
        {
            this._Str_4845._Str_16343(uid, k);
        }

        public function onAdCallStarted(k:AdServerRequest):void
        {
            this._Str_4845.onAdCallStarted(k);
        }

        public function onAdCallFailover(k:AdServerRequest, _arg_2:AdServerRequest):void
        {
            this._Str_4845.onAdCallFailover(k, _arg_2);
        }

        public function onAdCallComplete(k:AdServerRequest, _arg_2:Boolean):void
        {
            this._Str_4845.onAdCallComplete(k, _arg_2);
        }

        public function _Str_2717():Boolean
        {
            return !(this._Str_2611 == null);
        }

        override public function setLinearAdDurationFromSeconds(k:int):void
        {
            if (this._Str_2717())
            {
                return this._Str_2611.setLinearAdDurationFromSeconds(k);
            }
            return super.setLinearAdDurationFromSeconds(k);
        }

        override public function get duration():int
        {
            if (this._Str_2717())
            {
                return this._Str_2611.duration;
            }
            return super.duration;
        }

        override public function get error():String
        {
            if (this._Str_2717())
            {
                return this._Str_2611.error;
            }
            return super.error;
        }

        override public function get linearVideoAd():LinearVideoAd
        {
            if (this._Str_2717())
            {
                return this._Str_2611.linearVideoAd;
            }
            return super.linearVideoAd;
        }

        override public function get nonLinearVideoAds():Array
        {
            if (this._Str_2717())
            {
                return this._Str_2611.nonLinearVideoAds;
            }
            return super.nonLinearVideoAds;
        }

        override public function get firstNonLinearVideoAd():NonLinearVideoAd
        {
            if (this._Str_2717())
            {
                if (this.hasNonLinearAds())
                {
                    return this._Str_2611.firstNonLinearVideoAd;
                }
                return null;
            }
            return super.firstNonLinearVideoAd;
        }

        override public function hasNonLinearAds():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.hasNonLinearAds();
            }
            return super.hasNonLinearAds();
        }

        override public function hasLinearAd():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.hasLinearAd();
            }
            return super.hasLinearAd();
        }

        override public function isInteractive():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.isInteractive();
            }
            return super.isInteractive();
        }

        override public function canScale():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.canScale();
            }
            return super.canScale();
        }

        override public function shouldMaintainAspectRatio():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.shouldMaintainAspectRatio();
            }
            return super.shouldMaintainAspectRatio();
        }

        override public function get companionAds():Array
        {
            if (this._Str_2717())
            {
                return this._Str_2611.companionAds;
            }
            return super.companionAds;
        }

        override public function hasCompanionAds():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.hasCompanionAds();
            }
            return super.hasCompanionAds();
        }

        override public function isLinear():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.isLinear();
            }
            return super.isLinear();
        }

        override public function isNonLinear():Boolean
        {
            if (this._Str_2717())
            {
                return this._Str_2611.isNonLinear();
            }
            return super.isNonLinear();
        }

        override public function getStreamToPlay():AdNetworkResource
        {
            if (this._Str_2717())
            {
                return this._Str_2611.getStreamToPlay();
            }
            return super.getStreamToPlay();
        }

        override public function getFlashMediaToPlay(k:Number, _arg_2:Number, _arg_3:Boolean=false):_Str_4027
        {
            if (this._Str_2717())
            {
                return this._Str_2611.getFlashMediaToPlay(k, _arg_2, _arg_3);
            }
            return super.getFlashMediaToPlay(k, _arg_2, _arg_3);
        }

        override public function triggerTrackingEvent(k:String, _arg_2:String=null):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.triggerTrackingEvent(k);
            }
            super.triggerTrackingEvent(k);
        }

        override public function triggerForcedImpressionConfirmations(k:Boolean=false):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.triggerForcedImpressionConfirmations(k);
            }
            super.triggerForcedImpressionConfirmations();
        }

        override public function processStartAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStartAdEvent();
            }
            super.processStartAdEvent();
        }

        override public function processStopAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStopAdEvent();
            }
            super.processStopAdEvent();
        }

        override public function processPauseAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processPauseAdEvent();
            }
            super.processPauseAdEvent();
        }

        override public function processResumeAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processResumeAdEvent();
            }
            super.processResumeAdEvent();
        }

        override public function processFullScreenAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processFullScreenAdEvent();
            }
            super.processFullScreenAdEvent();
        }

        override public function processMuteAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processMuteAdEvent();
            }
            super.processMuteAdEvent();
        }

        override public function processUnmuteAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processUnmuteAdEvent();
            }
            super.processUnmuteAdEvent();
        }

        override public function processReplayAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processReplayAdEvent();
            }
            super.processReplayAdEvent();
        }

        override public function processHitMidpointAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processHitMidpointAdEvent();
            }
            super.processHitMidpointAdEvent();
        }

        override public function processFirstQuartileCompleteAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processFirstQuartileCompleteAdEvent();
            }
            super.processFirstQuartileCompleteAdEvent();
        }

        override public function processThirdQuartileCompleteAdEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processThirdQuartileCompleteAdEvent();
            }
            super.processThirdQuartileCompleteAdEvent();
        }

        override public function processAdCompleteEvent():void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processAdCompleteEvent();
            }
            super.processAdCompleteEvent();
        }

        override public function processStartNonLinearAdEvent(k:_Str_3019):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStartNonLinearAdEvent(k);
            }
            super.triggerImpressionConfirmations();
        }

        override public function processStopNonLinearAdEvent(k:_Str_3019):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStopNonLinearAdEvent(k);
            }
            super.processStopNonLinearAdEvent(k);
        }

        override public function processStartCompanionAdEvent(k:_Str_3019):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStartCompanionAdEvent(k);
            }
            super.processStartCompanionAdEvent(k);
        }

        override public function processStopCompanionAdEvent(k:_Str_3019):void
        {
            if (this._Str_2717())
            {
                this._Str_2611.processStopCompanionAdEvent(k);
            }
            super.processStopCompanionAdEvent(k);
        }

        override public function toJSObject():Object
        {
            if (this._Str_2717())
            {
                return this._Str_2611.toJSObject();
            }
            return super.toJSObject();
        }
    }
}
