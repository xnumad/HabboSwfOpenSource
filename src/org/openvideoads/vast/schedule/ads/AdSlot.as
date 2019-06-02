package org.openvideoads.vast.schedule.ads
{
    import org.openvideoads.vast.schedule.Stream;
    import org.openvideoads.vast.server.response._Str_3802;
    import org.openvideoads.vast.model.VideoAd;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.request.AdServerRequestProcessor;
    import org.openvideoads.vast.server.response.AdServerTemplate;
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.VASTController;
    import org.openvideoads.vast.schedule.ads.templates._Str_5080;
    import org.openvideoads.vast.schedule.ads.templates._Str_4426;
    import org.openvideoads.vast.schedule.ads.templates._Str_4962;
    import org.openvideoads.vast.schedule.ads.templates._Str_3048;
    import org.openvideoads.vast.schedule.ads.templates._Str_5816;
    import org.openvideoads.vast.schedule.ads.templates._Str_5713;
    import org.openvideoads.vast.schedule.ads.templates._Str_5981;
    import org.openvideoads.vast.config.groupings.AdSlotRegionConfig;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.vast.tracking.TrackingTable;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.vast.model.AdNetworkResource;
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.model.LinearVideoAd;
    import org.openvideoads.vast.model.NonLinearVideoAd;
    import org.openvideoads.vast.tracking._Str_2460;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.vast.events._Str_3019;
    import org.openvideoads.vast.events._Str_3525;
    import org.openvideoads.vast.tracking._Str_4278;
    import org.openvideoads.vast.events._Str_3250;
    import flash.events.Event;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.vast.schedule.ads.templates.*;

    public class AdSlot extends Stream implements _Str_3802 
    {
        public static const LINEAR:String = "linear";
        public static const _Str_6723:String = "non-linear";
        public static const COMPANION:String = "companion";
        public static const UNKNOWN:String = "unknown";
        public static const _Str_18341:String = "pre-roll";
        public static const _Str_17124:String = "mid-roll";
        public static const _Str_17383:String = "post-roll";
        public static const _Str_17477:String = "companion";
        public static const _Str_19951:String = "auto:bottom";

        private const _Str_26133:int = 500;

        protected var _Str_15246:String;
        protected var _Str_2539:String = null;
        protected var _Str_2384:VideoAd = null;
        protected var _Str_3124:Object = null;
        protected var _Str_13174:Boolean = false;
        protected var _Str_6910:Array;
        protected var _Str_15880:Object = null;
        protected var _Str_12489:int = 0;
        protected var _Str_18297:int = 0;
        protected var _Str_20735:AdSlot = null;
        protected var _owner:AdSchedule = null;
        protected var _Str_15504:Boolean = true;
        protected var _Str_3384:AdServerConfig = null;
        protected var _Str_3426:Boolean = false;
        protected var _Str_18270:Boolean = false;
        protected var _Str_5596:Boolean = false;
        protected var _Str_19666:Boolean = false;
        protected var _Str_5097:Boolean = false;
        protected var _Str_8738:Boolean = false;
        protected var _Str_13169:Boolean = false;
        protected var _Str_6833:AdServerRequestProcessor = null;
        protected var _Str_3720:_Str_8118 = null;
        protected var _Str_3908:Object = null;
        protected var _Str_13841:int = -1;
        protected var _Str_2620:AdServerTemplate = null;

        public function AdSlot(k:StreamSequence, _arg_2:AdSchedule, _arg_3:VASTController, _arg_4:int=0, _arg_5:int=0, _arg_6:String=null, _arg_7:String=null, _arg_8:String=null, _arg_9:Object=null, _arg_10:String=null, _arg_11:String=null, _arg_12:String="00:00:00", _arg_13:Object=null, _arg_14:Boolean=true, _arg_15:Array=null, _arg_16:Array=null, _arg_17:String="any", _arg_18:String="streaming", _arg_19:*=-1, _arg_20:Boolean=false, _arg_21:Boolean=true, _arg_22:Boolean=true, _arg_23:Object=null, _arg_24:Object=null, _arg_25:Boolean=true, _arg_26:AdServerConfig=null, _arg_27:String=null, _arg_28:Boolean=false, _arg_29:Boolean=false, _arg_30:int=-1)
        {
            this._Str_6910 = new Array({
                "id":"companion",
                "width":300,
                "height":250
            });
            super(k, _arg_3, _arg_4, _arg_6, null, _arg_12, _arg_10, _arg_11, false, null, _arg_17, _arg_18, _arg_19, _arg_20, _arg_21, _arg_22, null, _arg_24, _arg_27, _arg_5);
            this._owner = _arg_2;
            _Str_7240 = _arg_5;
            this._Str_12489 = _arg_5;
            this._Str_15246 = _arg_7;
            this._Str_2539 = _arg_8;
            this._Str_3908 = this._Str_23755(_arg_23);
            this._Str_15880 = _arg_9;
            if (_arg_13 != null)
            {
                this._Str_3124 = _arg_13;
            }
            this._Str_13174 = _arg_14;
            if (_arg_16 != null)
            {
                this._Str_6910 = _arg_16;
            }
            this._Str_15504 = _arg_25;
            if (_arg_26 != null)
            {
                this._Str_3384 = _arg_26;
            }
            this._Str_5097 = _arg_28;
            this._Str_8738 = _arg_29;
            this._Str_13841 = _arg_30;
        }

        override public function unload():void
        {
            if (this._Str_6833 != null)
            {
                this._Str_6833.unload();
            }
            if (this.hasVideoAd())
            {
                this._Str_2384.unload();
            }
        }

        protected function _Str_23755(k:Object):Object
        {
            return ({
                "preferred":((k != null) ? ((k.hasOwnProperty("preferred")) ? k.preferred : "flash") : "flash"),
                "flash":this._Str_19924("flash", ((k != null) ? k.flash : null), {
                    "enable":true,
                    "width":-1,
                    "height":-1,
                    "acceptedAdTypes":["image", "html", "text", "swf", "vpaid"],
                    "enableScaling":false,
                    "enforceRecommendedSizing":true,
                    "keepVisibleAfterClick":false,
                    "overlay":true,
                    "region":{
                        "text":"reserved-bottom-w100pct-h78px-000000-o50",
                        "html":"reserved-bottom-w100pct-h50px-000000-o50",
                        "image":"auto:bottom",
                        "swf":"auto:bottom",
                        "vpaid":null,
                        "iframe":null,
                        "script":null
                    },
                    "templates":{
                        "text":new _Str_5080(),
                        "html":new _Str_4426(),
                        "image":new _Str_4962(),
                        "script":null,
                        "iframe":null,
                        "swf":null,
                        "vpaid":null
                    }
                }),
                "html5":this._Str_19924("html5", ((k != null) ? k.html5 : null), {
                    "enable":false,
                    "width":-1,
                    "height":-1,
                    "acceptedAdTypes":["image", "html", "text", "swf", "iframe", "script"],
                    "overlay":true,
                    "region":{
                        "text":"bottom",
                        "html":"bottom",
                        "image":"bottom",
                        "swf":"bottom",
                        "vpaid":null,
                        "iframe":"bottom",
                        "script":"bottom"
                    },
                    "templates":{
                        "text":new _Str_5080(_Str_3048._Str_6497),
                        "html":new _Str_4426(_Str_3048._Str_6497),
                        "image":new _Str_4962(_Str_3048._Str_6497),
                        "swf":new _Str_5816(_Str_3048._Str_6497),
                        "script":new _Str_5713(_Str_3048._Str_6497),
                        "iframe":new _Str_5981(_Str_3048._Str_6497),
                        "vpaid":null
                    }
                })
            });
        }

        public function _Str_25997(k:String):Boolean
        {
            if (this._Str_3384 != null)
            {
                if (this._Str_3384.failoverConditions != null)
                {
                    if (this._Str_3384.failoverConditions.hasFailoverConditionOnVPAIDError())
                    {
                        return this._Str_3384.failoverConditions.onVPAIDError.shouldFailover(k);
                    }
                }
            }
            return false;
        }

        public function _Str_26071(k:String):Boolean
        {
            if (this._Str_3384 != null)
            {
                if (this._Str_3384.failoverConditions != null)
                {
                    if (this._Str_3384.failoverConditions.hasFailoverConditionOnStreamError())
                    {
                        return this._Str_3384.failoverConditions.onStreamError.shouldFailover(k);
                    }
                }
            }
            return false;
        }

        protected function _Str_19924(k:String, _arg_2:Array, _arg_3:Object):Array
        {
            var _local_4:Array;
            var _local_5:int;
            if (_arg_2 == null)
            {
                return [new AdSlotRegionConfig(k, _arg_3)];
            }
            if (_arg_2.length == 0)
            {
                return [new AdSlotRegionConfig(k, _arg_3)];
            }
            _local_4 = new Array();
            _local_5 = 0;
            while (_local_5 < _arg_2.length)
            {
                _local_4.push(new AdSlotRegionConfig(k, _arg_3, _arg_2[_local_5]));
                _local_5++;
            }
            return _local_4;
        }

        public function hasRegions(k:String):Boolean
        {
            if (this._Str_3908 != null)
            {
                if (this._Str_3908.hasOwnProperty(k))
                {
                    return this._Str_3908[k].length > 0;
                }
            }
            return false;
        }

        public function get regions():Object
        {
            return this._Str_3908;
        }

        public function get preferredDisplayMode():String
        {
            if (this._Str_3908 != null)
            {
                if (this._Str_3908.hasOwnProperty("preferred"))
                {
                    if (StringUtils._Str_2576(this._Str_3908.preferred, "HTML5"))
                    {
                        return "html5";
                    }
                }
            }
            return "flash";
        }

        override public function get streamID():String
        {
            return _id;
        }

        public function get adSlotID():String
        {
            return (id + "-") + associatedStreamIndex;
        }

        public function load(k:_Str_8118):Boolean
        {
            var _local_2:Array;
            if (this.loadOnDemand == true)
            {
                this._Str_13169 = false;
                this._Str_3720 = k;
                _local_2 = new Array();
                _local_2.push(this);
                this._Str_6833 = new AdServerRequestProcessor(this, _local_2, true, true);
                this._Str_6833.start();
                return true;
            }
            this._Str_3720 = null;
            this._Str_6833 = null;
            return false;
        }

        public function _Str_24052(k:_Str_8118):Boolean
        {
            if (((this.loadOnDemand == true) && (!(this._Str_6833 == null))))
            {
                this._Str_13169 = false;
                return this._Str_6833._Str_25262();
            }
            this._Str_3720 = null;
            this._Str_6833 = null;
            return false;
        }

        override public function resetAllTrackingPoints():void
        {
            super.resetAllTrackingPoints();
            if (this.hasVideoAd())
            {
                this._Str_2384._Str_23204();
            }
        }

        public function set loadOnDemand(k:Boolean):void
        {
            this._Str_5097 = k;
        }

        public function get loadOnDemand():Boolean
        {
            return this._Str_5097;
        }

        public function _Str_19603():Boolean
        {
            return this._Str_13841 > -1;
        }

        public function set maxDisplayCount(k:int):void
        {
            this._Str_13841 = k;
        }

        public function get maxDisplayCount():int
        {
            return this._Str_13841;
        }

        public function _Str_25264():Boolean
        {
            return false;
        }

        public function set refreshOnReplay(k:Boolean):void
        {
            this._Str_8738 = k;
        }

        public function get refreshOnReplay():Boolean
        {
            return this._Str_8738;
        }

        public function _Str_21240():Boolean
        {
            return !(this._Str_2539 == null);
        }

        public function _Str_26024():Boolean
        {
            return false;
        }

        public function _Str_26105():Boolean
        {
            if (this._Str_21240())
            {
                return this._Str_2539.toUpperCase().indexOf("AUTO") > -1;
            }
            return false;
        }

        public function _Str_26000():String
        {
            var k:String;
            if (this._Str_21240())
            {
                if (((this._Str_2539.toUpperCase().indexOf("AUTO:") > -1) && (this._Str_2539.length > 5)))
                {
                    k = this._Str_2539.substr((this._Str_2539.toUpperCase().indexOf("AUTO:") + 5));
                    if (k != null)
                    {
                        k = StringUtils.trim(k).toUpperCase();
                        if ("BOTTOM CENTER TOP LEFT RIGHT".indexOf(k) > -1)
                        {
                            return k;
                        }
                    }
                }
            }
            return "BOTTOM";
        }

        override public function get title():String
        {
            if (this.hasVideoAd())
            {
                return this._Str_2384.adTitle;
            }
            return _Str_2495;
        }

        public function get adServerType():String
        {
            if (this.adServerConfig != null)
            {
                return this.adServerConfig.type;
            }
            return "undefined";
        }

        public function get _Str_26065():String
        {
            if (this.adServerConfig != null)
            {
                if (this.adServerConfig.tag == null)
                {
                    return this.adServerConfig.apiAddress;
                }
                return this.adServerConfig.tag;
            }
            return "undefined";
        }

        public function _Str_25769(k:Number, _arg_2:Number):Boolean
        {
            var _local_3:int = getStartTimeAsSeconds();
            if (_local_3 > 0)
            {
                return (k <= _local_3) && (_local_3 <= _arg_2);
            }
            return false;
        }

        override protected function clearTrackingTable(k:Boolean=false):void
        {
            _Str_3649 = new TrackingTable(id, key, originatingStreamIndex);
        }

        override public function isLoaded():Boolean
        {
            return true;
        }

        override public function getStreamToPlay():NetworkResource
        {
            if (((this.hasLinearAd()) && (this.hasVideoAd())))
            {
                return this._Str_2384.getStreamToPlay();
            }
            return null;
        }

        override protected function cleanseStreamName(k:String):String
        {
            return super.cleanseStreamName(k);
        }

        override public function get baseURL():String
        {
            var k:AdNetworkResource = (this.getStreamToPlay() as AdNetworkResource);
            if (k != null)
            {
                if (((k.isRTMP()) && (k._Str_19279() == false)))
                {
                    if (_Str_2335 != null)
                    {
                        if (_Str_2335.config.adsConfig.hasStreamers())
                        {
                            k.streamers = _Str_2335.config.adsConfig.streamers;
                        }
                    }
                }
                return k.netConnectionAddress;
            }
            return super.baseURL;
        }

        override public function get streamName():String
        {
            var _local_1:AdNetworkResource;
            if (this.isInteractive())
            {
                return null;
            }
            _local_1 = (this.getStreamToPlay() as AdNetworkResource);
            if (_local_1 != null)
            {
                if (((_local_1.isRTMP()) && (_local_1._Str_19279() == false)))
                {
                    if (_Str_2335 != null)
                    {
                        if (_Str_2335.config.adsConfig.hasStreamers())
                        {
                            _local_1.streamers = _Str_2335.config.adsConfig.streamers;
                        }
                    }
                    return _local_1._Str_25224();
                }
                return this.cleanseStreamName(_local_1._Str_5059((streamType + ":")));
            }
            return null;
        }

        public function _Str_25599():Boolean
        {
            return _Str_2335.config.adsConfig.replayOverlays;
        }

        override public function shouldMaintainAspectRatio():Boolean
        {
            if (this.hasVideoAd())
            {
                return this._Str_2384.shouldMaintainAspectRatio();
            }
            return false;
        }

        public function _Str_11204():void
        {
            this._Str_13169 = true;
        }

        public function _Str_10174():Boolean
        {
            if (this._Str_5097)
            {
                if (this._Str_2384 != null)
                {
                    if (this._Str_8738)
                    {
                        return this._Str_13169;
                    }
                    return this._Str_2384.isEmpty();
                }
                return true;
            }
            return false;
        }

        override public function isInteractive():Boolean
        {
            if (this.hasVideoAd())
            {
                return this._Str_2384.isInteractive();
            }
            return false;
        }

        public function set zone(k:String):void
        {
            this._Str_15246 = k;
        }

        public function get zone():String
        {
            return this._Str_15246;
        }

        public function set adServerConfig(k:AdServerConfig):void
        {
            this._Str_3384 = k;
        }

        public function get adServerConfig():AdServerConfig
        {
            return this._Str_3384;
        }

        public function hasAdServerConfigured():Boolean
        {
            if (this._Str_3384 != null)
            {
                return !(this._Str_3384.serverType == null);
            }
            return false;
        }

        public function set position(k:String):void
        {
            this._Str_2539 = k;
        }

        public function get position():String
        {
            return this._Str_2539;
        }

        override public function isSlicedStream():Boolean
        {
            return false;
        }

        override public function set duration(k:*):void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.setLinearAdDurationFromSeconds(int(k));
            }
            super.duration = k;
        }

        override public function get duration():String
        {
            if (this._Str_2384 != null)
            {
                if (_Str_2467 == null)
                {
                    return new String(this._Str_2384.duration);
                }
                if (((_Str_2467.toUpperCase().indexOf("RECOMMENDED:") > -1) && (_Str_2467.length > 12)))
                {
                    return new String(this._Str_2384._Str_25515(parseInt(_Str_2467.substr((_Str_2467.toUpperCase().indexOf("RECOMMENDED:") + 12)))));
                }
            }
            return super.duration;
        }

        public function set _Str_20694(k:int):void
        {
            this._Str_12489 = k;
        }

        public function get _Str_20694():int
        {
            return this._Str_12489;
        }

        public function set applyToParts(k:Object):void
        {
            this._Str_15880 = k;
        }

        public function get applyToParts():Object
        {
            return this._Str_15880;
        }

        public function set associatedStreamStartTime(k:int):void
        {
            this._Str_18297 = k;
        }

        public function get associatedStreamStartTime():int
        {
            return this._Str_18297;
        }

        public function get slotType():String
        {
            if ((((this.isPreRoll()) || (this.isMidRoll())) || (this._Str_8643())))
            {
                return LINEAR;
            }
            if (this._Str_9554())
            {
                return COMPANION;
            }
            return _Str_6723;
        }

        public function isPreRoll():Boolean
        {
            if (this._Str_2539 == null)
            {
                return false;
            }
            return this._Str_2539.toLowerCase() == _Str_18341;
        }

        public function isMidRoll():Boolean
        {
            if (this._Str_2539 == null)
            {
                return false;
            }
            return this._Str_2539.toLowerCase() == _Str_17124;
        }

        public function _Str_8643():Boolean
        {
            if (this._Str_2539 == null)
            {
                return false;
            }
            return this._Str_2539.toLowerCase() == _Str_17383;
        }

        public function _Str_9554():Boolean
        {
            if (this._Str_2539 == null)
            {
                return false;
            }
            return this._Str_2539.toLowerCase() == _Str_17477;
        }

        public function isActive():Boolean
        {
            if (this._Str_5097)
            {
                return true;
            }
            if (this._Str_2384 != null)
            {
                return (this._Str_2384._Str_15398() == false) || (this._Str_2384._Str_13487() == false);
            }
            return false;
        }

        public function get _Str_6097():Boolean
        {
            return this._Str_5596;
        }

        public function set _Str_6097(k:Boolean):void
        {
            this._Str_5596 = k;
        }

        public function _Str_21616():void
        {
            this._Str_3426 = true;
            this._Str_5596 = true;
        }

        public function isPlaying():Boolean
        {
            return this._Str_3426;
        }

        public function canPlay():Boolean
        {
            return this.isInteractive();
        }

        public function markAsPlayed():void
        {
            this._Str_5596 = true;
            this._Str_3426 = false;
        }

        public function shouldBePlaying(k:Number):Boolean
        {
            return (_Str_3649.timeBetweenTwoPoints(k, "NS", "NE")) && ((this._Str_6097 == false) || (this._Str_25599()));
        }

        public function _Str_23971():Boolean
        {
            return ((!(hasDuration())) || (getDurationAsInt() == -1)) || (_Str_20238());
        }

        public function _Str_23719():Boolean
        {
            return this._Str_18270;
        }

        public function set _Str_23103(k:Boolean):void
        {
            this._Str_19666 = k;
        }

        public function _Str_21756():Boolean
        {
            return this._Str_19666;
        }

        public function isEmpty():Boolean
        {
            return (!(this.hasNonLinearAds())) && (!(this.hasLinearAd()));
        }

        public function getFlashMediaToPlay(k:Number, _arg_2:Number, _arg_3:Boolean=false):_Str_4027
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.getFlashMediaToPlay(k, _arg_2, _arg_3);
            }
            return null;
        }

        public function hasNonLinearAds():Boolean
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.hasNonLinearAds();
            }
            return false;
        }

        public function hasLinearAd():Boolean
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.hasLinearAd();
            }
            return false;
        }

        public function _Str_23430():Boolean
        {
            if (this.hasLinearAd())
            {
                return this._Str_16720()._Str_5569();
            }
            return false;
        }

        public function _Str_16720():LinearVideoAd
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.linearVideoAd;
            }
            return null;
        }

        public function _Str_14530():NonLinearVideoAd
        {
            if (this._Str_2384 != null)
            {
                if (this._Str_2384.nonLinearVideoAds != null)
                {
                    return this._Str_2384.nonLinearVideoAds[0];
                }
            }
            return null;
        }

        public function _Str_19793():int
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.duration;
            }
            return 0;
        }

        public function hasCompanionAds():Boolean
        {
            if (this._Str_2384 != null)
            {
                return this._Str_2384.hasCompanionAds();
            }
            return false;
        }

        public function set videoAd(k:VideoAd):void
        {
            if (k != null)
            {
                k.setPreferredSelectionCriteria({
                    "deliveryType":_Str_4101,
                    "mimeType":_Str_2230,
                    "bitrate":_Str_4980,
                    "width":_width,
                    "height":_height
                });
            }
            this._Str_2384 = k;
        }

        public function get videoAd():VideoAd
        {
            return this._Str_2384;
        }

        public function hasVideoAd():Boolean
        {
            return !(this._Str_2384 == null);
        }

        public function _Str_26062():Boolean
        {
            if ((((this.isPreRoll()) || (this._Str_8643())) || (this.isMidRoll())))
            {
                if (this._Str_2384 != null)
                {
                    return this._Str_2384.isEmpty();
                }
            }
            return false;
        }

        override public function isLinear():Boolean
        {
            if (this._Str_2384 != null)
            {
                return (((this.isPreRoll()) || (this._Str_8643())) || (this.isMidRoll())) && (this._Str_2384.isLinear());
            }
            if (this._Str_5097)
            {
                return ((this.isPreRoll()) || (this._Str_8643())) || (this.isMidRoll());
            }
            return false;
        }

        public function isNonLinear():Boolean
        {
            if (this._Str_2384 != null)
            {
                return ((((!(this.isPreRoll())) && (!(this._Str_8643()))) && (!(this.isMidRoll()))) && (!(this._Str_2384 == null))) && (this._Str_2384.hasNonLinearAds());
            }
            if (this._Str_5097)
            {
                return ((!(this.isPreRoll())) && (!(this._Str_8643()))) && (!(this.isMidRoll()));
            }
            return false;
        }

        public function _Str_22554():String
        {
            if (this.isLinear())
            {
                if (this.isInteractive())
                {
                    return "Linear interactive";
                }
                return "Linear";
            }
            if (this.isNonLinear())
            {
                if (this.isInteractive())
                {
                    return "Non-linear Interactive";
                }
                return "Non-linear";
            }
            if (this._Str_9554())
            {
                return "Companion";
            }
            return "Unknown";
        }

        public function set _Str_26136(k:Boolean):void
        {
            this._Str_13174 = k;
        }

        public function get disableControls():Boolean
        {
            return this._Str_13174;
        }

        override public function declareTrackingPoints(k:int=0, _arg_2:Boolean=false):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            if (_Str_8898 == false)
            {
                if (getDurationAsInt() > 0)
                {
                    this.clearTrackingTable();
                    if (((this.isLinear()) && (this.isInteractive() == false)))
                    {
                        _local_3 = 1000;
                        _local_4 = getDurationAsInt();
                        if (config.adsConfig.shortenLinearAdDurationPercentage > 0)
                        {
                            _local_4 = (_local_4 - ((config.adsConfig.shortenLinearAdDurationPercentage / 100) * _local_4));
                        }
                        _local_5 = (k + streamStartTime);
                        _local_6 = (Math.round((((_local_5 * _local_3) + ((_local_4 * _local_3) / 2)) / 100)) * 100);
                        _local_7 = (Math.round((((_local_5 * _local_3) + ((_local_4 * _local_3) / 4)) / 100)) * 100);
                        _local_8 = (Math.round((((_local_5 * _local_3) + (((_local_4 * _local_3) / 4) * 3)) / 100)) * 100);
                        _Str_2606(new _Str_2460(((_local_5 * _local_3) + _Str_2335.startStreamSafetyMargin), "BA"));
                        _Str_2606(new _Str_2460(_local_7, "1Q"));
                        _Str_2606(new _Str_2460(_local_6, "HW"));
                        _Str_2606(new _Str_2460(_local_8, "3Q"));
                        _Str_2606(new _Str_2460(((_local_5 * _local_3) + _Str_2335.startStreamSafetyMargin), "SN"));
                        if (_Str_2335.config.adsConfig.isSkipAdButtonEnabled())
                        {
                            _local_9 = 0;
                            if (_Str_2335.config.adsConfig.skipAdConfig.isTimeDelayed())
                            {
                                _local_9 = _Str_2335.config.adsConfig.skipAdConfig.showAfterSeconds;
                                _Str_2606(new _Str_2460(((_local_5 * _local_3) + (_local_9 * _local_3)), "DS"));
                            }
                            if (_Str_2335.config.adsConfig.skipAdConfig.isTimeRestricted())
                            {
                                _Str_2606(new _Str_2460(((_local_5 * _local_3) + ((_local_9 + _Str_2335.config.adsConfig.skipAdConfig.showForSeconds) * _local_3)), "HS"));
                            }
                        }
                        _Str_2606(new _Str_2460((((_local_5 + _local_4) * _local_3) - _Str_2335.endStreamSafetyMargin), "HN"));
                        _Str_2606(new _Str_2460((((_local_5 + _local_4) * _local_3) - _Str_2335.endStreamSafetyMargin), "EA"));
                        if (this._Str_19083())
                        {
                            this._Str_20680(_local_4, false);
                        }
                    }
                    if (this.hasNonLinearAds())
                    {
                        this.addNonLinearAdTrackingPoints(key, true, false);
                    }
                    if (this.hasCompanionAds())
                    {
                        this._Str_17853(key, k, getDurationAsInt());
                    }
                    _Str_18576();
                }
            }
        }

        protected function _Str_17853(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=true, _arg_6:Boolean=false):void
        {
            _Str_2606(new _Str_2460(((_arg_2 * 1000) + _Str_2335.startStreamSafetyMargin), "CS", new String(k)), _arg_4, _arg_5, _arg_6);
            if (_arg_3 > 0)
            {
                _Str_2606(new _Str_2460((((_arg_2 + _arg_3) * 1000) - _Str_2335.endStreamSafetyMargin), "CE", new String(k)), _arg_4, _arg_5, _arg_6);
            }
            else
            {
                _Str_2606(new _Str_2460(((_arg_2 + ((60 * 60) * 4)) * 1000), "CE", new String(k)), _arg_4, _arg_5, _arg_6);
            }
        }

        public function addNonLinearAdTrackingPoints(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:Boolean=false):void
        {
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_5:int = (((_arg_2) ? 0 : this.associatedStreamStartTime) + getStartTimeAsSeconds());
            var _local_6:int = getDurationAsInt();
            _Str_2606(new _Str_2460((_local_5 * 1000), "NS", new String(k)), _arg_4);
            if (_local_6 > 0)
            {
                _Str_2606(new _Str_2460((((_local_5 + _local_6) * 1000) - _Str_2335.endStreamSafetyMargin), "NE", new String(k)), _arg_4);
            }
            else
            {
                _Str_2606(new _Str_2460(((_local_5 + ((60 * 60) * 4)) * 1000), "NE", new String(k)), _arg_4);
            }
            if (((_arg_3) && (this.hasCompanionAds())))
            {
                this._Str_17853(k, _local_5, _local_6);
            }
            if (this.hasLinearAd())
            {
                _local_7 = 1000;
                _local_8 = this._Str_19793();
                _local_9 = 0;
                _local_10 = (Math.round((((_local_9 * _local_7) + ((_local_8 * _local_7) / 2)) / 100)) * 100);
                _local_11 = (Math.round((((_local_9 * _local_7) + ((_local_8 * _local_7) / 4)) / 100)) * 100);
                _local_12 = (Math.round((((_local_9 * _local_7) + (((_local_8 * _local_7) / 4) * 3)) / 100)) * 100);
                _Str_2606(new _Str_2460(((_local_9 * _local_7) + _Str_2335.startStreamSafetyMargin), "BA"), false, false, true);
                _Str_2606(new _Str_2460(_local_11, "1Q"), false, false, true);
                _Str_2606(new _Str_2460(_local_10, "HW"), false, false, true);
                _Str_2606(new _Str_2460(_local_12, "3Q"), false, false, true);
                _Str_2606(new _Str_2460(((_local_9 * _local_7) + _Str_2335.startStreamSafetyMargin), "SN"), false, false, true);
                _Str_2606(new _Str_2460((((_local_9 + _local_8) * _local_7) - _Str_2335.endStreamSafetyMargin), "HN"), false, false, true);
                _Str_2606(new _Str_2460((((_local_9 + _local_8) * _local_7) - _Str_2335.endStreamSafetyMargin), "EA"), false, false, true);
                if (this._Str_19083())
                {
                    this._Str_20680(_local_8, true);
                }
                if (this.hasCompanionAds())
                {
                    this._Str_17853(key, 0, _local_8, false, false, true);
                }
            }
        }

        public function triggerTrackingEvent(k:String):void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.triggerTrackingEvent(k);
            }
        }

        protected function _Str_20680(k:int, _arg_2:Boolean=false):void
        {
            var _local_3:* = 1000;
            var _local_4:int = 1;
            while (_local_4 < k)
            {
                _Str_2606(new _Str_2460((_local_4 * _local_3), "TN"), false, false, _arg_2);
                _local_4++;
            }
        }

        public function _Str_16176():Boolean
        {
            if (this._Str_3384 != null)
            {
                return this._Str_3384.forceImpressionServing;
            }
            return false;
        }

        public function processForcedImpression(k:Boolean=false):void
        {
            if (this._Str_2384 != null)
            {
                if (this._Str_16176())
                {
                    this._Str_2384.triggerForcedImpressionConfirmations(k);
                }
            }
        }

        override public function processStartStream():void
        {
            this._Str_21616();
            this._Str_11204();
            if (this._Str_2384 != null)
            {
                this._Str_2384.processStartAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.START, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processStreamComplete():void
        {
            this.markAsPlayed();
            if (this._Str_2384 != null)
            {
                this._Str_2384.processAdCompleteEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.COMPLETE, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processStopStream():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processStopAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.STOP, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processPauseStream():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processPauseAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.PAUSE, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processResumeStream():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processResumeAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.RESUME, this, this._Str_2384.linearVideoAd);
            }
        }

        protected function _Str_24925():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processHitMidpointAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.MIDPOINT, this, this._Str_2384.linearVideoAd);
            }
        }

        protected function _Str_22613():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processFirstQuartileCompleteAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.FIRSTQUARTILE, this, this._Str_2384.linearVideoAd);
            }
        }

        protected function _Str_23180():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processThirdQuartileCompleteAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.THIRDQUARTILE, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processFullScreenEvent():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processFullScreenAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.FULLSCREEN, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processFullScreenExitEvent():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384._Str_22336();
            }
        }

        override public function processMuteEvent():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processMuteAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.MUTE, this, this._Str_2384.linearVideoAd);
            }
        }

        override public function processUnmuteEvent():void
        {
            if (this._Str_2384 != null)
            {
                this._Str_2384.processUnmuteAdEvent();
                _Str_2335.fireAdPlaybackAnalytics(_Str_2408.UNMUTE, this, this._Str_2384.linearVideoAd);
            }
        }

        protected function _Str_19086():_Str_3019
        {
            var k:_Str_3019 = new _Str_3019(_Str_2335);
            k._Str_3073.adSlot = this;
            return k;
        }

        protected function _Str_20811():void
        {
            this._Str_21616();
            if (this.isLinear())
            {
            }
            else
            {
                if (this._Str_2384 != null)
                {
                    if (this._Str_10174())
                    {
                        this.load(_Str_2335);
                    }
                    else
                    {
                        this._Str_2384.processStartNonLinearAdEvent(this._Str_19086());
                        this._Str_11204();
                    }
                }
                else
                {
                    if (this.loadOnDemand)
                    {
                        this.load(_Str_2335);
                    }
                }
            }
        }

        protected function _Str_18335(k:Boolean=false):void
        {
            this.markAsPlayed();
            if (this.isLinear())
            {
            }
            else
            {
                if (this._Str_2384 != null)
                {
                    this._Str_2384.processStopNonLinearAdEvent(this._Str_19086());
                    if (k)
                    {
                        this.resetAllTrackingPoints();
                    }
                    else
                    {
                        resetRepeatableTrackingPoints();
                    }
                }
            }
        }

        public function actionCompanionAdStart():void
        {
            var k:_Str_3019;
            this._Str_18270 = true;
            if (this._Str_2384 != null)
            {
                k = new _Str_3019(_Str_2335, _width, _height);
                this._Str_2384.processStartCompanionAdEvent(k);
            }
        }

        public function actionCompanionAdEnd():void
        {
            var k:_Str_3019;
            this._Str_18270 = false;
            if (this._Str_2384 != null)
            {
                k = new _Str_3019(_Str_2335, _width, _height);
                this._Str_2384.processStopCompanionAdEvent(k);
            }
        }

        protected function _Str_25205(k:int):void
        {
            var _local_2:int;
            if (this._Str_3124 != null)
            {
                if (this._Str_3124.region != undefined)
                {
                    if (((!(this._Str_3124.region == null)) && (!(this._Str_2384 == null))))
                    {
                        _local_2 = Math.round((this._Str_2384.duration - (k / 1000)));
                        _Str_2335.onTickAdNotice(new _Str_3525(_Str_3525._Str_18470, this._Str_3124, _local_2));
                    }
                }
            }
        }

        protected function _Str_21828():void
        {
            if (this._Str_2384 != null)
            {
                if (this._Str_2384._Str_20690())
                {
                    _Str_2335.onSurveyDisplay(this._Str_2384.survey);
                }
            }
        }

        protected function _Str_18255():void
        {
            if (this._Str_2384 != null)
            {
                if (this._Str_2384._Str_20690())
                {
                    _Str_2335.onSurveyHide();
                }
            }
        }

        public function _Str_23019():Boolean
        {
            return this._Str_11665();
        }

        public function _Str_19083():Boolean
        {
            if (this._Str_3124 != null)
            {
                if (this._Str_3124.message != undefined)
                {
                    return this._Str_3124.message.indexOf("_countdown_") > -1;
                }
            }
            return false;
        }

        protected function _Str_11665():Boolean
        {
            if (this._Str_3124 != null)
            {
                if (this._Str_3124.show)
                {
                    return this._Str_3124.show;
                }
            }
            return false;
        }

        protected function _Str_22527():Boolean
        {
            if (this.canSkipOnLinearAd())
            {
                return !(_Str_2335.config.adsConfig.skipAdConfig.isTimeDelayed());
            }
            return false;
        }

        protected function canSkipOnLinearAd():Boolean
        {
            if (_Str_2335.config.adsConfig.skipAdConfig.hasMinimumAdDuration())
            {
                if (_Str_2335.canSkipOnLinearAd())
                {
                    return this.getDurationAsInt() >= _Str_2335.config.adsConfig.skipAdConfig.minimumAdDuration;
                }
                return false;
            }
            return _Str_2335.canSkipOnLinearAd();
        }

        protected function _Str_12288():void
        {
            var adSlot:AdSlot;
            if (this.disableControls)
            {
                _Str_21885();
            }
            if (_Str_2335 != null)
            {
                if (this._Str_15504)
                {
                    _Str_2335.enableVisualLinearAdClickThroughCue(this);
                }
                if (this._Str_11665())
                {
                    if (((!(this._Str_3124.region == undefined)) && (!(this._Str_3124.region == null))))
                    {
                        if (((!(this._Str_3124.message == undefined)) && (!(this._Str_3124.region == null))))
                        {
                            _Str_2335.onShowAdNotice(new _Str_3525(_Str_3525._Str_3831, this._Str_3124, ((this._Str_2384) ? this._Str_2384.duration : 0)));
                        }
                    }
                }
                if (this._Str_22527())
                {
                    adSlot = this;
                    _Str_2335.activateLinearAdSkipButton(function ():void
                    {
                        _Str_5888();
                        _Str_2335._Str_22191(adSlot);
                    });
                }
            }
        }

        protected function _Str_5888():void
        {
            if (this.disableControls)
            {
                _Str_19894();
            }
            if (_Str_2335 != null)
            {
                if (this._Str_15504)
                {
                    _Str_2335.disableVisualLinearAdClickThroughCue(this);
                }
                if (this._Str_11665())
                {
                    if (((!(this._Str_3124.region == undefined)) && (!(this._Str_3124.region == null))))
                    {
                        _Str_2335.onHideAdNotice(new _Str_3525(_Str_3525._Str_2703, this._Str_3124));
                    }
                }
                if (this.canSkipOnLinearAd())
                {
                    _Str_2335.deactivateLinearAdSkipButton();
                }
            }
        }

        override public function processTimeEvent(timeEvent:_Str_4278, includeChildLinear:Boolean=true, resetTrackingOnReplay:Boolean=false):void
        {
            var trackingPoints:Array;
            var i:int;
            var trackingPoint:_Str_2460;
            var description:String;
            var adSlot:AdSlot;
            if (((((((this.isNonLinear()) && (!(this._Str_23971()))) && (this.isPlaying())) && (!(this._Str_21756()))) && ((this.isNonLinear()) && (timeEvent._Str_23283() == false))) && ((!(_Str_3649.isTimeInBaseRange(timeEvent.milliseconds))) || (timeEvent.label == "NE"))))
            {
                this._Str_18335(resetTrackingOnReplay);
                this.actionCompanionAdEnd();
                _Str_2335.onProcessTrackingPoint(_Str_3649.getTrackingPointOfType("NE", false, true));
                _Str_2335.onProcessTrackingPoint(_Str_3649.getTrackingPointOfType("CE", false, true));
            }
            else
            {
                trackingPoints = _Str_3649.activeTrackingPoints(timeEvent, includeChildLinear);
                i = 0;
                while (i < trackingPoints.length)
                {
                    trackingPoint = trackingPoints[i];
                    if (trackingPoint != null)
                    {
                        switch (trackingPoint.label)
                        {
                            case "BA":
                                description = "Begin linear video advertisement event";
                                this.processStartStream();
                                this._Str_21828();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                _Str_2335.onLinearAdStart(this);
                                break;
                            case "EA":
                                description = "End linear video advertisement event";
                                this.processStreamComplete();
                                this._Str_18255();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                _Str_2335.onLinearAdComplete(this);
                                break;
                            case "SS":
                                description = "Stop stream event";
                                this.processStopStream();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "PS":
                                description = "Pause stream event";
                                this.processPauseStream();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "RS":
                                description = "Resume stream event";
                                this.processResumeStream();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "HW":
                                description = "Halfway point tracking event";
                                this._Str_24925();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "1Q":
                                description = "1st quartile tracking event";
                                this._Str_22613();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "3Q":
                                description = "3rd quartile tracking event";
                                this._Str_23180();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "DS":
                                if (this.canSkipOnLinearAd())
                                {
                                    adSlot = this;
                                    _Str_2335.activateLinearAdSkipButton(function ():void
                                    {
                                        _Str_5888();
                                        _Str_2335._Str_22191(adSlot);
                                    });
                                }
                                break;
                            case "HS":
                                if (this.canSkipOnLinearAd())
                                {
                                    _Str_2335.deactivateLinearAdSkipButton();
                                }
                                break;
                            case "SN":
                                description = "Show ad notice event";
                                this._Str_12288();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "HN":
                                description = "Hide ad notice event";
                                this._Str_5888();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "NS":
                                if (((_Str_2335.config.adsConfig.replayOverlays) || ((_Str_2335.config.adsConfig.replayOverlays == false) && (this._Str_6097 == false))))
                                {
                                    if (!this.isPlaying())
                                    {
                                        description = "Start non-linear ad event";
                                        this._Str_20811();
                                        this._Str_21828();
                                        _Str_2335.onProcessTrackingPoint(trackingPoint);
                                    }
                                }
                                break;
                            case "NE":
                                description = "End non-linear ad event";
                                this._Str_18335(resetTrackingOnReplay);
                                this._Str_18255();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "CS":
                                if (!this._Str_23719())
                                {
                                    description = "Companion start event";
                                    this.actionCompanionAdStart();
                                    _Str_2335.onProcessTrackingPoint(trackingPoint);
                                }
                                break;
                            case "CE":
                                description = "Companion end event";
                                this.actionCompanionAdEnd();
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                                break;
                            case "TN":
                                description = "Timed ad notice";
                                this._Str_25205(trackingPoint.milliseconds);
                                _Str_2335.onProcessTrackingPoint(trackingPoint);
                        }
                    }
                    i = (i + 1);
                }
            }
        }

        public function closeActiveOverlaysAndCompanions(k:Boolean=false):void
        {
            this._Str_18335(k);
            this.actionCompanionAdEnd();
            this._Str_18255();
        }

        public function onTemplateLoaded(k:AdServerTemplate):void
        {
            this._Str_2620 = k;
            if (k != null)
            {
                if (k.hasAds(this._Str_16176()))
                {
                    this._Str_2384 = k._Str_22948(0);
                    if (this._Str_2384 != null)
                    {
                        if (this._Str_2384.isNonLinear())
                        {
                            if (this._Str_2384._Str_13487() == false)
                            {
                                if (this.isNonLinear())
                                {
                                    this._Str_20811();
                                    this.actionCompanionAdStart();
                                    _Str_2335.onProcessTrackingPoint(_Str_3649.getTrackingPointOfType("NS", false, true));
                                    _Str_2335.onProcessTrackingPoint(_Str_3649.getTrackingPointOfType("CS", false, true));
                                }
                            }
                        }
                        else
                        {
                            if (this._Str_2384._Str_15398() == false)
                            {
                                _Str_21236();
                                this.declareTrackingPoints();
                            }
                        }
                    }
                }
            }
            if (this._Str_3720 != null)
            {
                this._Str_3720._Str_22061(new _Str_3250(_Str_3250._Str_3592, this));
            }
        }

        public function onTemplateLoadError(k:Event):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720._Str_16628(new _Str_3250(_Str_3250._Str_18922, this, k));
            }
        }

        public function _Str_5807(k:Event):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720._Str_16628(new _Str_3250(_Str_3250._Str_6699, this, k));
            }
        }

        public function _Str_5916(k:Event):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720._Str_20322(new _Str_3250(_Str_3250._Str_6462, this, k));
            }
        }

        public function onAdCallStarted(k:AdServerRequest):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720.onAdCallStarted(k);
            }
        }

        public function onAdCallFailover(k:AdServerRequest, _arg_2:AdServerRequest):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720.onAdCallFailover(k, _arg_2);
            }
        }

        public function onAdCallComplete(k:AdServerRequest, _arg_2:Boolean):void
        {
            if (this._Str_3720 != null)
            {
                this._Str_3720.onAdCallComplete(k, _arg_2);
            }
        }

        public function get analyticsProcessor():_Str_2408
        {
            if (_Str_2335 != null)
            {
                return _Str_2335.analyticsProcessor;
            }
            return null;
        }

        public function get _Str_23197():AdServerConfig
        {
            if (this._Str_3384 != null)
            {
                return this._Str_3384;
            }
            return null;
        }

        public function _Str_25791(k:AdSlot):void
        {
            this._Str_20735 = k;
        }

        public function isCopy():Boolean
        {
            return !(this._Str_20735 == null);
        }

        public function clone(k:int=0):AdSlot
        {
            var _local_2:AdSlot = new AdSlot(_parent, this._owner, _Str_2335, _Str_2987, _Str_7240, (_id + "-c"), this._Str_15246, this._Str_2539, this._Str_15880, _Str_2467, _Str_10178, _Str_990, this._Str_3124, this._Str_13174, null, this._Str_6910, _Str_4718, _Str_4101, _Str_4980, _Str_4538, _Str_3744, _Str_3869, this._Str_3908, _Str_4797, this._Str_15504, this._Str_23197, _Str_2466, this._Str_5097, this._Str_8738);
            _local_2._Str_20694 = this._Str_12489;
            _local_2._Str_6097 = this._Str_5596;
            _local_2._Str_25791(this);
            return _local_2;
        }

        override public function toJSObject():Object
        {
            var k:Object = new Object();
            k = {
                "id":_id,
                "uid":_Str_2995,
                "type":this._Str_22554(),
                "position":this._Str_2539,
                "loadOnDemand":this._Str_5097,
                "refreshOnReplay":this._Str_8738,
                "associatedStreamIndex":_Str_7240,
                "showNotice":this._Str_11665(),
                "regions":this._Str_3908
            }
            return k;
        }

        override public function toShortString():String
        {
            return ((("position: " + this._Str_2539) + ((this._Str_5097) ? " (ON DEMAND)" : "")) + ", ") + super.toShortString();
        }

        override public function toString():String
        {
            return (((((((((((((((super.toString() + ", adSlotId: ") + this.adSlotID) + ", position: ") + this._Str_2539) + ", loadOnDemand: ") + this._Str_5097) + ", originatingAssociatedStreamIndex: ") + this._Str_12489) + ", associatedStreamIndex: ") + _Str_7240) + ", associatedStreamStartTime: ") + this._Str_18297) + ", showNotice: ") + this._Str_11665()) + ", metaData: ") + _Str_3744;
        }
    }
}
