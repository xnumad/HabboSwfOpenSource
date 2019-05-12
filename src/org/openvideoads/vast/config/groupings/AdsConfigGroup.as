package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.util.ArrayUtils;
    import org.openvideoads.vast.server.config._Str_6024;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.util.StringUtils;

    public class AdsConfigGroup extends AbstractStreamsConfig implements _Str_2741 
    {
        protected var _Str_3384:AdServerConfig = null;
        protected var _Str_3204:Array = null;
        protected var _Str_2621:Array;
        protected var _Str_11226:AdNoticeConfig;
        protected var _Str_9996:ClickSignConfig;
        protected var _Str_17994:SurveyConfig;
        protected var _Str_6011:SkipAdConfig;
        protected var _Str_4936:CompanionsConfigGroup;
        protected var _Str_5258:VPAIDConfig;
        protected var _Str_13007:OverlaysConfig;
        protected var _Str_20654:String = "*";
        protected var _Str_21454:Boolean = true;
        protected var _Str_20374:Boolean = true;
        protected var _Str_20727:Boolean = true;
        protected var _Str_11973:Boolean = false;
        protected var _Str_4352:Array;
        protected var _Str_18821:String = null;
        protected var _Str_19748:Boolean = false;
        protected var _Str_20521:Boolean = false;
        protected var _Str_19263:Boolean = false;
        protected var _Str_4857:Object = null;
        protected var _Str_5061:Array = null;
        protected var _Str_7343:AdMetaDataConfigGroup;
        protected var _Str_22194:Boolean = true;
        protected var _Str_9470:int = -1;
        protected var _Str_10909:Boolean = true;
        protected var _Str_20228:Boolean = false;
        protected var _Str_21804:int = 0;

        public function AdsConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_2621 = new Array();
            this._Str_11226 = new AdNoticeConfig();
            this._Str_9996 = new ClickSignConfig();
            this._Str_17994 = new SurveyConfig();
            this._Str_6011 = new SkipAdConfig();
            this._Str_4936 = new CompanionsConfigGroup();
            this._Str_5258 = new VPAIDConfig();
            this._Str_13007 = new OverlaysConfig();
            this._Str_4352 = new Array();
            this._Str_7343 = new AdMetaDataConfigGroup();
            _Str_6569 = true;
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.activelySchedule != undefined)
                {
                    if ((k.activelySchedule is String))
                    {
                        this.activelySchedule = ((k.activelySchedule.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.activelySchedule = k.activelySchedule;
                    }
                }
                if (k.resetTrackingOnReplay != undefined)
                {
                    if ((k.resetTrackingOnReplay is String))
                    {
                        this.resetTrackingOnReplay = (k.resetTrackingOnReplay.toUpperCase() == "TRUE");
                    }
                    else
                    {
                        this.resetTrackingOnReplay = k.resetTrackingOnReplay;
                    }
                }
                if (k.hasOwnProperty("skipAd"))
                {
                    this.skipAd = new SkipAdConfig(k.skipAd);
                }
                if (k.hasOwnProperty("overlays"))
                {
                    this.overlays = k.overlays;
                }
                if (k.playOnce != undefined)
                {
                    if ((k.playOnce is String))
                    {
                        this.playOnce = ((k.playOnce.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.playOnce = k.playOnce;
                    }
                }
                if (k.hasOwnProperty("survey"))
                {
                    this._Str_5168 = new SurveyConfig(k.survey);
                }
                if (k.enforceMidRollPlayback != undefined)
                {
                    if ((k.enforceMidRollPlayback is String))
                    {
                        this.enforceMidRollPlayback = ((k.enforceMidRollPlayback.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enforceMidRollPlayback = k.enforceMidRollPlayback;
                    }
                }
                if (k.enforceLinearInteractiveAdScaling != undefined)
                {
                    if ((k.enforceLinearInteractiveAdScaling is String))
                    {
                        this.enforceLinearInteractiveAdScaling = ((k.enforceLinearInteractiveAdScaling.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enforceLinearInteractiveAdScaling = k.enforceLinearInteractiveAdScaling;
                    }
                }
                if (k.enforceLinearVideoAdScaling != undefined)
                {
                    if ((k.enforceLinearVideoAdScaling is String))
                    {
                        this.enforceLinearVideoAdScaling = ((k.enforceLinearVideoAdScaling.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enforceLinearVideoAdScaling = k.enforceLinearVideoAdScaling;
                    }
                }
                if (k.enforceLinearAdsOnPlaylistSelection != undefined)
                {
                    if ((k.enforceLinearAdsOnPlaylistSelection is String))
                    {
                        this.enforceLinearAdsOnPlaylistSelection = ((k.enforceLinearAdsOnPlaylistSelection.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enforceLinearAdsOnPlaylistSelection = k.enforceLinearAdsOnPlaylistSelection;
                    }
                }
                if (k.linearScaling != undefined)
                {
                    this.linearScaling = k.linearScaling;
                }
                if (k.notice != undefined)
                {
                    this.notice = k.notice;
                }
                if (k.visuallyCueLinearAdClickThrough != undefined)
                {
                    if ((k.visuallyCueLinearAdClickThrough is String))
                    {
                        this.visuallyCueLinearAdClickThrough = ((k.visuallyCueLinearAdClickThrough.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.visuallyCueLinearAdClickThrough = k.visuallyCueLinearAdClickThrough;
                    }
                }
                if (k.pauseOnClickThrough != undefined)
                {
                    if ((k.pauseOnClickThrough is String))
                    {
                        this.pauseOnClickThrough = ((k.pauseOnClickThrough.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.pauseOnClickThrough = k.pauseOnClickThrough;
                    }
                }
                if (k.nativeDisplay != undefined)
                {
                    if ((k.nativeDisplay is String))
                    {
                        this.nativeDisplay = ((k.nativeDisplay.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.nativeDisplay = k.nativeDisplay;
                    }
                }
                if (k.clickSign != undefined)
                {
                    this.clickSignConfig = new ClickSignConfig(k.clickSign);
                }
                if (k.companions != undefined)
                {
                    this._Str_21117 = new CompanionsConfigGroup(k.companions);
                }
                if (k.allowDomains != undefined)
                {
                    this.allowDomains = k.allowDomains;
                }
                if (k.schedule != undefined)
                {
                    if ((k.schedule is Array))
                    {
                        this.schedule = k.schedule;
                    }
                    else
                    {
                        this.schedule = ArrayUtils._Str_8734(k.schedule);
                    }
                }
                if (k.tagParams != undefined)
                {
                    this.tagParams = k.tagParams;
                }
                if (k.postMidRollSeekPosition != undefined)
                {
                    if ((k.postMidRollSeekPosition is String))
                    {
                        this._Str_9470 = parseInt(k.postMidRollSeekPosition);
                    }
                    else
                    {
                        this._Str_9470 = k.postMidRollSeekPosition;
                    }
                }
                if (k.tag != undefined)
                {
                    this.tag = k.tag;
                }
                if (k.vpaid != undefined)
                {
                    this.vpaid = k.vpaid;
                }
                if (k.holdingClipUrl != undefined)
                {
                    this.holdingClipUrl = k.holdingClipUrl;
                }
                if (k.metaData != undefined)
                {
                    this._Str_24147(k.metaData);
                }
                if (k.acceptedLinearAdMimeTypes != undefined)
                {
                    this.acceptedLinearAdMimeTypes = k.acceptedLinearAdMimeTypes;
                }
                if (k.filterOnLinearAdMimeTypes != undefined)
                {
                    if ((k.filterOnLinearAdMimeTypes is String))
                    {
                        this.filterOnLinearAdMimeTypes = ((k.filterOnLinearAdMimeTypes.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.filterOnLinearAdMimeTypes = k.filterOnLinearAdMimeTypes;
                    }
                }
                if (k.shortenLinearAdDurationPercentage != undefined)
                {
                    this.shortenLinearAdDurationPercentage = k.shortenLinearAdDurationPercentage;
                }
                if (k.streamers != undefined)
                {
                    if ((k.streamers is Array))
                    {
                        this.streamers = k.streamers;
                    }
                    else
                    {
                        this.streamers = ArrayUtils._Str_8734(k.streamers);
                    }
                }
                if (k.server != undefined)
                {
                    if (k.server.type != undefined)
                    {
                        this.adServerConfig = _Str_6024._Str_5664(k.server.type);
                        this.adServerConfig.initialise(k.server);
                    }
                }
                if (k.servers != undefined)
                {
                    this._Str_19290 = k.servers;
                }
                this._Str_19888();
            }
            _Str_3144();
        }

        public function set overlays(k:Object):void
        {
            this._Str_21384 = new OverlaysConfig(k);
        }

        public function set _Str_21384(k:OverlaysConfig):void
        {
            this._Str_13007 = k;
        }

        public function get _Str_21384():OverlaysConfig
        {
            return this._Str_13007;
        }

        public function set _Str_5168(k:SurveyConfig):void
        {
            this._Str_17994 = k;
        }

        public function get _Str_5168():SurveyConfig
        {
            return this._Str_17994;
        }

        public function set shortenLinearAdDurationPercentage(k:int):void
        {
            this._Str_21804 = k;
        }

        public function get shortenLinearAdDurationPercentage():int
        {
            return this._Str_21804;
        }

        public function set postMidRollSeekPosition(k:int):void
        {
            this._Str_9470 = k;
        }

        public function get postMidRollSeekPosition():int
        {
            return this._Str_9470;
        }

        public function postMidRollSeekPositionAsTimestamp():String
        {
            return Timestamp._Str_4110(this._Str_9470);
        }

        public function hasPostMidRollSeekPosition():Boolean
        {
            return this._Str_9470 > -1;
        }

        public function set enforceMidRollPlayback(k:Boolean):void
        {
            this._Str_20228 = k;
        }

        public function get enforceMidRollPlayback():Boolean
        {
            return this._Str_20228;
        }

        public function set holdingClipUrl(k:String):void
        {
            this.vpaidConfig.holdingClipUrl = k;
        }

        public function get holdingClipUrl():String
        {
            return this.vpaidConfig.holdingClipUrl;
        }

        public function set _Str_21117(k:CompanionsConfigGroup):void
        {
            this._Str_4936 = k;
        }

        public function get _Str_21117():CompanionsConfigGroup
        {
            return this._Str_4936;
        }

        public function set skipAd(k:SkipAdConfig):void
        {
            this._Str_6011 = new SkipAdConfig(k);
        }

        public function get skipAd():SkipAdConfig
        {
            return this._Str_6011;
        }

        public function isSkipAdButtonEnabled():Boolean
        {
            if (this._Str_6011 != null)
            {
                return this._Str_6011.enabled;
            }
            return false;
        }

        public function get _Str_25982():String
        {
            if (this._Str_6011 != null)
            {
                return this._Str_6011.image;
            }
            return "not-defined";
        }

        public function _Str_24147(k:Object):void
        {
            this._Str_19959 = new AdMetaDataConfigGroup(k);
        }

        public function set _Str_19959(k:AdMetaDataConfigGroup):void
        {
            this._Str_7343 = k;
        }

        public function get _Str_19959():AdMetaDataConfigGroup
        {
            return this._Str_7343;
        }

        public function _Str_19879(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            if (this._Str_7343 != null)
            {
                return this._Str_7343._Str_19879(k, _arg_2, _arg_3);
            }
            return "";
        }

        public function _Str_19524(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            if (this._Str_7343 != null)
            {
                return this._Str_7343._Str_19524(k, _arg_2, _arg_3);
            }
            return "";
        }

        protected function _Str_19888(k:String=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            if (this._Str_2621 != null)
            {
                _local_3 = new Object();
                _local_4 = 0;
                for (;_local_4 < this._Str_2621.length;_local_4++)
                {
                    if (k != null)
                    {
                        this._Str_2621[_local_4].tag = k;
                    }
                    if (this._Str_2621[_local_4].commonAdTag != undefined)
                    {
                        if (_local_3.hasOwnProperty(this._Str_2621[_local_4].commonAdTag.uid) == false)
                        {
                            _local_3[this._Str_2621[_local_4].commonAdTag.uid] = _Str_6024._Str_5664(this._Str_2621[_local_4].commonAdTag.server.type);
                            _local_3[this._Str_2621[_local_4].commonAdTag.uid].initialise(this._Str_2621[_local_4].commonAdTag.server);
                        }
                        this._Str_2621[_local_4].server = _local_3[this._Str_2621[_local_4].commonAdTag.uid];
                    }
                    else
                    {
                        if (this._Str_2621[_local_4].tag != undefined)
                        {
                            if (this._Str_4857 != null)
                            {
                                this._Str_2621[_local_4].server = {
                                    "type":"direct",
                                    "tag":this._Str_2621[_local_4].tag,
                                    "customProperties":this._Str_4857
                                }
                            }
                            else
                            {
                                this._Str_2621[_local_4].server = {
                                    "type":"direct",
                                    "tag":this._Str_2621[_local_4].tag
                                }
                            }
                        }
                        if (this._Str_2621[_local_4].server == undefined)
                        {
                            this._Str_2621[_local_4].server = this._Str_25127();
                        }
                        else
                        {
                            _local_2 = this._Str_2621[_local_4].server;
                            if (this._Str_2621[_local_4].server.id == undefined)
                            {
                                if (this._Str_2621[_local_4].server.type != undefined)
                                {
                                    this._Str_2621[_local_4].server = _Str_6024._Str_5664(this._Str_2621[_local_4].server.type);
                                    if (this._Str_2621[_local_4].server == null)
                                    {
                                        continue;
                                    }
                                }
                                else
                                {
                                    this._Str_2621[_local_4].server = this._Str_23778();
                                }
                            }
                            else
                            {
                                this._Str_2621[_local_4].server = this._Str_22583(this._Str_2621[_local_4].server.id);
                            }
                            if (_local_2 != null)
                            {
                                this._Str_2621[_local_4].server.initialise(_local_2);
                            }
                        }
                    }
                    if (this._Str_2621[_local_4].hasOwnProperty("encodeVars"))
                    {
                        this._Str_2621[_local_4].server.encodeVars = StringUtils._Str_2810(this._Str_2621[_local_4].encodeVars);
                    }
                    if (this._Str_17325())
                    {
                        this._Str_2621[_local_4].server.acceptedLinearAdMimeTypes = this.acceptedLinearAdMimeTypes;
                    }
                }
            }
        }

        public function _Str_19379(k:int):void
        {
            var _local_2:int;
            while (_local_2 < this._Str_2621.length)
            {
                if ((this._Str_2621[_local_2].server is AdServerConfig))
                {
                    this._Str_2621[_local_2].server.playerHeight = k;
                }
                _local_2++;
            }
        }

        public function _Str_20939(k:int):void
        {
            var _local_2:int;
            while (_local_2 < this._Str_2621.length)
            {
                if ((this._Str_2621[_local_2].server is AdServerConfig))
                {
                    this._Str_2621[_local_2].server.playerWidth = k;
                }
                _local_2++;
            }
        }

        public function get _Str_16561():Boolean
        {
            if (this._Str_9996 != null)
            {
                return this._Str_9996.enabled;
            }
            return true;
        }

        public function set tag(k:String):void
        {
            if (this._Str_2621.length == 0)
            {
                this._Str_2621 = [{
                    "position":"pre-roll",
                    "tag":k
                }];
            }
            this._Str_19888(k);
        }

        public function hasStreamers():Boolean
        {
            return !(this._Str_5061 == null);
        }

        public function set streamers(k:Array):void
        {
            var _local_2:int;
            this._Str_5061 = new Array();
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    this._Str_5061.push(new AdStreamerConfig(k[_local_2]));
                    _local_2++;
                }
            }
        }

        public function get streamers():Array
        {
            return this._Str_5061;
        }

        public function set adServerConfig(k:AdServerConfig):void
        {
            this._Str_3384 = k;
        }

        public function get adServerConfig():AdServerConfig
        {
            if (this._Str_3384 == null)
            {
                if (this._Str_3204 != null)
                {
                    return this._Str_3204[0];
                }
            }
            return this._Str_3384;
        }

        public function set _Str_19290(k:Array):void
        {
            var _local_3:AdServerConfig;
            this._Str_3204 = new Array();
            var _local_2:int;
            while (_local_2 < k.length)
            {
                if (k[_local_2].type != undefined)
                {
                    _local_3 = _Str_6024._Str_5664(k[_local_2].type);
                    _local_3.initialise(k[_local_2]);
                    if (this._Str_4857 != null)
                    {
                        _local_3.initialise({"tagParams":this._Str_4857});
                    }
                    this._Str_3204.push(_local_3);
                }
                _local_2++;
            }
        }

        public function get _Str_19290():Array
        {
            return this._Str_3204;
        }

        public function _Str_25127():AdServerConfig
        {
            var k:int;
            if (this._Str_3204 != null)
            {
                if (this._Str_3204.length > 0)
                {
                    k = this._Str_19450();
                    if (AdServerConfig(this._Str_3204[k]).oneAdPerRequest)
                    {
                        return this._Str_3204[k].clone();
                    }
                    return this._Str_3204[k];
                }
            }
            return new AdServerConfig();
        }

        public function _Str_23778():AdServerConfig
        {
            if (this._Str_3204 != null)
            {
                if (this._Str_3204.length > 0)
                {
                    return this._Str_3204[this._Str_19450()].clone();
                }
            }
            return this._Str_24415();
        }

        public function _Str_24415():AdServerConfig
        {
            if (this._Str_3204 != null)
            {
                if (this._Str_3204.length > 0)
                {
                    return this._Str_3204[0].clone();
                }
            }
            return new AdServerConfig();
        }

        protected function _Str_19450():int
        {
            var k:int;
            if (this._Str_3204 != null)
            {
                if (this._Str_3204.length > 0)
                {
                    k = 0;
                    while (k < this._Str_3204.length)
                    {
                        if (this._Str_3204[k].defaultAdServer)
                        {
                            return k;
                        }
                        k++;
                    }
                }
            }
            return 0;
        }

        public function _Str_22583(k:String):AdServerConfig
        {
            var _local_2:int;
            if (this._Str_3204 != null)
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3204.length)
                {
                    if (this._Str_3204[_local_2].matchesId(k))
                    {
                        return this._Str_3204[_local_2];
                    }
                    _local_2++;
                }
            }
            return new AdServerConfig();
        }

        public function set resetTrackingOnReplay(k:Boolean):void
        {
            this._Str_22194 = k;
        }

        public function get resetTrackingOnReplay():Boolean
        {
            return this._Str_22194;
        }

        public function set pauseOnClickThrough(k:Boolean):void
        {
            this._Str_20727 = k;
        }

        public function get pauseOnClickThrough():Boolean
        {
            return this._Str_20727;
        }

        public function vpaidMaxDurationTimeoutEnabled():Boolean
        {
            return this._Str_5258.enableMaxDurationTimeout;
        }

        public function get vpaidMaxDurationTimeout():int
        {
            return this._Str_5258.maxDurationTimeout;
        }

        public function set tagParams(k:Object):void
        {
            this._Str_4857 = k;
        }

        public function get tagParams():Object
        {
            return this._Str_4857;
        }

        public function _Str_26028():Boolean
        {
            return !(this._Str_18821 == null);
        }

        public function set linearScaling(k:String):void
        {
            this._Str_18821 = k;
        }

        public function get linearScaling():String
        {
            return this._Str_18821;
        }

        public function set enforceLinearInteractiveAdScaling(k:Boolean):void
        {
            this._Str_19748 = k;
        }

        public function get enforceLinearInteractiveAdScaling():Boolean
        {
            return this._Str_19748;
        }

        public function set enforceLinearVideoAdScaling(k:Boolean):void
        {
            this._Str_20521 = k;
        }

        public function get enforceLinearVideoAdScaling():Boolean
        {
            return this._Str_20521;
        }

        public function set enforceLinearAdsOnPlaylistSelection(k:Boolean):void
        {
            this._Str_19263 = k;
        }

        public function get enforceLinearAdsOnPlaylistSelection():Boolean
        {
            return this._Str_19263;
        }

        public function get replayOverlays():Boolean
        {
            return this._Str_13007.replay;
        }

        public function set allowDomains(k:String):void
        {
            this._Str_20654 = k;
        }

        public function get allowDomains():String
        {
            return this._Str_20654;
        }

        public function set activelySchedule(k:Boolean):void
        {
            this._Str_21454 = k;
        }

        public function get activelySchedule():Boolean
        {
            return this._Str_21454;
        }

        public function _Str_8478():Boolean
        {
            return this._Str_4936._Str_8478();
        }

        public function get companionDivIDs():Array
        {
            return this._Str_4936.companionDivIDs;
        }

        public function get displayCompanions():Boolean
        {
            return this._Str_4936.displayCompanions;
        }

        public function get _Str_7826():Boolean
        {
            if (this.nativeDisplay == false)
            {
                return true;
            }
            return this._Str_4936.nativeDisplay == false;
        }

        public function set nativeDisplay(k:Boolean):void
        {
            this._Str_10909 = k;
        }

        public function get nativeDisplay():Boolean
        {
            return this._Str_10909;
        }

        public function get restoreCompanions():Boolean
        {
            return this._Str_4936.restoreCompanions;
        }

        public function get millisecondDelayOnCompanionInjection():int
        {
            return this._Str_4936.millisecondDelayOnCompanionInjection;
        }

        public function _Str_12146():Boolean
        {
            return this._Str_4936._Str_12146();
        }

        public function get additionalParamsForSWFCompanions():Array
        {
            return this._Str_4936.additionalParamsForSWFCompanions;
        }

        public function showNotice():Boolean
        {
            if (this._Str_11226 != null)
            {
                return this._Str_11226.show;
            }
            return false;
        }

        public function set notice(k:Object):void
        {
            this._Str_11226 = new AdNoticeConfig(k);
        }

        public function get notice():Object
        {
            return this._Str_11226;
        }

        public function set rtmpSubscribe(k:Boolean):void
        {
            if (_Str_3337 == null)
            {
                _Str_3337 = new ProvidersConfigGroup();
            }
            _Str_3337.rtmpSubscribe = k;
        }

        public function get rtmpSubscribe():Boolean
        {
            if (_Str_3337 != null)
            {
                return _Str_3337.rtmpSubscribe;
            }
            return false;
        }

        public function canSkipOnLinearAd():Boolean
        {
            return this._Str_6011.enabled;
        }

        public function get skipAdConfig():SkipAdConfig
        {
            return this._Str_6011;
        }

        public function set vpaid(k:Object):void
        {
            this.vpaidConfig = new VPAIDConfig(k);
        }

        public function set vpaidConfig(k:VPAIDConfig):void
        {
            this._Str_5258 = k;
        }

        public function get vpaidConfig():VPAIDConfig
        {
            return this._Str_5258;
        }

        protected function _Str_26090(k:String):Boolean
        {
            if (StringUtils._Str_2576(k, "PRE-ROLL"))
            {
                return true;
            }
            if (StringUtils._Str_2576(k, "MID-ROLL"))
            {
                return true;
            }
            if (StringUtils._Str_2576(k, "POST-ROLL"))
            {
                return true;
            }
            return false;
        }

        public function set schedule(schedule:Array):void
        {
            var processedSchedule:Array;
            var i:int;
            var pres:Array;
            var mids:Array;
            var posts:Array;
            var k:int;
            var commonAdTag:Object;
            var j:int;
            var newObject:Object;
            var prop:String;
            if (schedule != null)
            {
                processedSchedule = new Array();
                i = 0;
                while (i < schedule.length)
                {
                    if (schedule[i].hasOwnProperty("notice"))
                    {
                        if ((schedule[i].notice is AdNoticeConfig) == false)
                        {
                            schedule[i].notice = new AdNoticeConfig(schedule[i]["notice"]);
                        }
                    }
                    else
                    {
                        schedule[i].notice = this.notice;
                    }
                    if (((schedule[i].hasOwnProperty("interval")) && (schedule[i].hasOwnProperty("repeat"))))
                    {
                        if (((schedule[i].interval > 0) && (schedule[i].repeat > 0)))
                        {
                            commonAdTag = null;
                            if (((schedule[i].hasOwnProperty("oneAdPerRequest")) && (schedule[i].hasOwnProperty("tag"))))
                            {
                                if (schedule[i].oneAdPerRequest == false)
                                {
                                    commonAdTag = {
                                        "uid":i,
                                        "server":{
                                            "type":"direct",
                                            "tag":schedule[i].tag,
                                            "oneAdPerRequest":false
                                        }
                                    }
                                }
                            }
                            if (schedule[i].hasOwnProperty("server"))
                            {
                                if (schedule[i].server != null)
                                {
                                    if (schedule[i].server.hasOwnProperty("oneAdPerRequest"))
                                    {
                                        if (schedule[i].server.oneAdPerRequest == false)
                                        {
                                            commonAdTag = {
                                                "uid":i,
                                                "server":schedule[i].server
                                            }
                                            if (commonAdTag.server.type == undefined)
                                            {
                                                commonAdTag.server.type = "direct";
                                            }
                                        }
                                    }
                                }
                            }
                            j = 0;
                            while (j < schedule[i].repeat)
                            {
                                newObject = new Object();
                                newObject.copyCount = j;
                                newObject.startTime = Timestamp._Str_24782(schedule[i].startTime, (schedule[i].interval * j));
                                if (commonAdTag != null)
                                {
                                    newObject["commonAdTag"] = commonAdTag;
                                }
                                for (prop in schedule[i])
                                {
                                    if (commonAdTag != null)
                                    {
                                        if ((((prop == "server") || (prop == "tag")) || (prop == "oneAdPerRequest")))
                                        {
                                            continue;
                                        }
                                    }
                                    if ((((!(prop == "interval")) && (!(prop == "startTime"))) && (!(prop == "repeat"))))
                                    {
                                        newObject[prop] = schedule[i][prop];
                                    }
                                }
                                processedSchedule.push(newObject);
                                j = (j + 1);
                            }
                        }
                    }
                    else
                    {
                        if (schedule[i].hasOwnProperty("oneAdPerRequest"))
                        {
                            if (schedule[i].hasOwnProperty("tag"))
                            {
                                schedule[i].server = {
                                    "type":"direct",
                                    "tag":schedule[i].tag,
                                    "oneAdPerRequest":schedule[i].oneAdPerRequest
                                }
                                delete schedule[i].tag;
                                delete schedule[i].oneAdPerRequest;
                            }
                            else
                            {
                                if (schedule[i].hasOwnProperty("server"))
                                {
                                    schedule[i].server.oneAdPerRequest = schedule[i].oneAdPerRequest;
                                    delete schedule[i].oneAdPerRequest;
                                }
                            }
                        }
                        processedSchedule.push(schedule[i]);
                    }
                    i = (i + 1);
                }
                pres = new Array();
                mids = new Array();
                posts = new Array();
                k = 0;
                while (k < processedSchedule.length)
                {
                    if (StringUtils._Str_2576(processedSchedule[k].position, "pre-roll"))
                    {
                        pres.push(processedSchedule[k]);
                    }
                    else
                    {
                        if (StringUtils._Str_2576(processedSchedule[k].position, "post-roll"))
                        {
                            posts.push(processedSchedule[k]);
                        }
                        else
                        {
                            mids.push(processedSchedule[k]);
                        }
                    }
                    k = (k + 1);
                }
                mids.sort(function (k:Object, _arg_2:Object):Number
                {
                    var _local_3:int;
                    var _local_4:int;
                    if (k.startTime != undefined)
                    {
                        if (_arg_2.startTime != undefined)
                        {
                            _local_3 = Timestamp.timestampToSeconds(k.startTime);
                            _local_4 = Timestamp.timestampToSeconds(_arg_2.startTime);
                            if (_local_3 > _local_4)
                            {
                                return 1;
                            }
                            if (_local_3 < _local_4)
                            {
                                return -1;
                            }
                            return 0;
                        }
                        return -1;
                    }
                    return -1;
                });
                this._Str_2621 = pres;
                this._Str_2621 = this._Str_2621.concat(mids);
                this._Str_2621 = this._Str_2621.concat(posts);
            }
            else
            {
                this._Str_2621 = null;
            }
        }

        public function get schedule():Array
        {
            return this._Str_2621;
        }

        public function set acceptedLinearAdMimeTypes(k:Array):void
        {
            this._Str_4352 = k;
        }

        public function get acceptedLinearAdMimeTypes():Array
        {
            return this._Str_4352;
        }

        public function set filterOnLinearAdMimeTypes(k:Boolean):void
        {
            this._Str_11973 = k;
        }

        public function get filterOnLinearAdMimeTypes():Boolean
        {
            return this._Str_11973;
        }

        public function _Str_17325():Boolean
        {
            if (this._Str_4352 != null)
            {
                return this._Str_4352.length > 0;
            }
            return false;
        }

        public function set visuallyCueLinearAdClickThrough(k:Boolean):void
        {
            this._Str_20374 = k;
        }

        public function get visuallyCueLinearAdClickThrough():Boolean
        {
            return this._Str_20374;
        }

        public function set clickSignConfig(k:ClickSignConfig):void
        {
            this._Str_9996 = k;
        }

        public function get clickSignConfig():ClickSignConfig
        {
            return this._Str_9996;
        }
    }
}
