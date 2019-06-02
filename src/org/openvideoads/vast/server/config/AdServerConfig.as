package org.openvideoads.vast.server.config
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.server.request.direct._Str_4664;
    import org.openvideoads.util.StringUtils;

    public class AdServerConfig extends Debuggable 
    {
        protected var _id:String = "";
        protected var _Str_5295:String = "direct";
        protected var _Str_7775:Boolean = false;
        protected var _Str_14740:Boolean = false;
        protected var _Str_3753:CustomProperties;
        protected var _Str_6748:String = null;
        protected var _Str_12926:String = "http://localhost";
        protected var _Str_15101:Boolean = false;
        protected var _Str_5662:Array = null;
        protected var _Str_15247:FailoverConditionsConfig = null;
        protected var _Str_3096:String = null;
        protected var _Str_5101:Boolean = false;
        protected var _Str_26073:Boolean = false;
        protected var _Str_14150:Boolean = false;
        protected var _Str_11242:int = -1;
        protected var _Str_15694:String = "3";
        protected var _Str_10161:int = -1;
        protected var _Str_12360:int = -1;
        protected var _Str_15767:String = null;
        protected var _Str_15081:String = null;
        protected var _Str_14580:String = null;
        protected var _Str_18886:String = null;
        protected var _Str_14298:String = "vast1";
        protected var _Str_14994:String = null;
        protected var _Str_15423:String = null;
        protected var _Str_15473:String = null;
        protected var _Str_14735:String = null;
        protected var _Str_13316:String = null;
        protected var _Str_13878:String = null;
        protected var _Str_9744:Boolean = false;
        protected var _Str_20883:Boolean = false;
        protected var _Str_4857:Object = null;
        protected var _Str_11530:int = -1;
        protected var _Str_17573:Boolean = true;
        protected var _Str_4352:Array;
        protected var _Str_11973:Boolean = false;
        protected var _Str_22385:Array;
        protected var _Str_26439:Boolean = false;
        protected var _Str_16412:Boolean = false;
        protected var _Str_3676:Array;

        public function AdServerConfig(k:String=null, _arg_2:Object=null)
        {
            this._Str_4352 = new Array();
            this._Str_22385 = new Array();
            this._Str_3676 = new Array();
            super();
            if (k != null)
            {
                this._Str_5295 = k;
            }
            this._Str_3753 = this.defaultCustomProperties;
            this.initialise(_arg_2);
        }

        public function initialise(k:Object):void
        {
            var _local_2:int;
            var _local_3:AdServerConfig;
            if (k != null)
            {
                if (k.id != undefined)
                {
                    this._id = k.id;
                }
                if (k.type != undefined)
                {
                    this._Str_5295 = k.type;
                }
                if (k.apiAddress != undefined)
                {
                    this._Str_12926 = k.apiAddress;
                }
                if (k.requestTemplate != undefined)
                {
                    this._Str_6748 = k.requestTemplate;
                }
                if (k.allowAdRepetition != undefined)
                {
                    this._Str_14740 = k.allowAdRepetition;
                }
                if (k.ensureSingleAdUnitRecordedPerInlineAd != undefined)
                {
                    this._Str_17573 = k.ensureSingleAdUnitRecordedPerInlineAd;
                }
                if (k.oneAdPerRequest != undefined)
                {
                    this._Str_7775 = k.oneAdPerRequest;
                }
                if (k.customProperties != undefined)
                {
                    this._Str_3753._Str_17005(k.customProperties);
                }
                if (k.tagParams != undefined)
                {
                    this._Str_3753._Str_17005(k.tagParams);
                    this._Str_4857 = k.tagParams;
                }
                if (k.defaultAdServer != undefined)
                {
                    this._Str_15101 = k.defaultAdServer;
                }
                if (k.tag != undefined)
                {
                    this._Str_3096 = k.tag;
                }
                if (k.allowVPAID != undefined)
                {
                    this._Str_14150 = k.allowVPAID;
                }
                if (k.asVersion != undefined)
                {
                    this._Str_15694 = k.asVersion;
                }
                if (k.timeoutInSeconds != undefined)
                {
                    if ((k.timeoutInSeconds is String))
                    {
                        this._Str_11530 = int(k.timeoutInSeconds);
                    }
                    else
                    {
                        this._Str_11530 = k.timeoutInSeconds;
                    }
                }
                if (k.maxDuration != undefined)
                {
                    if ((k.maxDuration is String))
                    {
                        this._Str_11242 = int(k.maxDuration);
                    }
                    else
                    {
                        this._Str_11242 = k.maxDuration;
                    }
                }
                if (k.playerWidth != undefined)
                {
                    if ((k.playerWidth is String))
                    {
                        this._Str_10161 = int(k.playerWidth);
                    }
                    else
                    {
                        this._Str_10161 = k.playerWidth;
                    }
                }
                if (k.playerHeight != undefined)
                {
                    if ((k.playerHeight is String))
                    {
                        this._Str_12360 = int(k.playerHeight);
                    }
                    else
                    {
                        this._Str_12360 = k.playerHeight;
                    }
                }
                if (k.mediaUrl != undefined)
                {
                    this._Str_15767 = k.mediaUrl;
                }
                if (k.pageStreamUrl != undefined)
                {
                    this._Str_15081 = k.pageStreamUrl;
                }
                if (k.pageUrl != undefined)
                {
                    this._Str_14580 = k.pageUrl;
                }
                if (k.format != undefined)
                {
                    this._Str_14298 = k.format;
                }
                if (k.partnerId != undefined)
                {
                    this._Str_14994 = k.partnerId;
                }
                if (k.mediaId != undefined)
                {
                    this._Str_15423 = k.mediaId;
                }
                if (k.mediaTitle != undefined)
                {
                    this._Str_15473 = k.mediaTitle;
                }
                if (k.mediaDescription != undefined)
                {
                    this._Str_14735 = k.mediaDescription;
                }
                if (k.mediaCategories != undefined)
                {
                    this._Str_13316 = k.mediaCategories;
                }
                if (k.mediaKeywords != undefined)
                {
                    this._Str_13878 = k.mediaKeywords;
                }
                if (k.forceImpressionServing != undefined)
                {
                    this.forceImpressionServing = k.forceImpressionServing;
                }
                if (k.addCacheBuster != undefined)
                {
                    this.addCacheBuster = k.addCacheBuster;
                }
                if (k.parseWrappedAdTags != undefined)
                {
                    this.parseWrappedAdTags = k.parseWrappedAdTags;
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
                if (k.encodeVars != undefined)
                {
                    if ((k.encodeVars is String))
                    {
                        this.encodeVars = ((k.encodeVars.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.encodeVars = k.encodeVars;
                    }
                }
                if (k.failoverConditions != undefined)
                {
                    this._Str_15247 = new FailoverConditionsConfig(k.failoverConditions);
                }
                if (k.failoverServers != undefined)
                {
                    if ((k.failoverServers is Array))
                    {
                        this._Str_5662 = new Array();
                        _local_2 = 0;
                        while (_local_2 < k.failoverServers.length)
                        {
                            if ((k.failoverServers[_local_2] is AdServerConfig))
                            {
                                this._Str_5662.push(k.failoverServers[_local_2]);
                            }
                            else
                            {
                                if (k.failoverServers[_local_2].type != undefined)
                                {
                                    _local_3 = _Str_6024._Str_5664(k.failoverServers[_local_2].type);
                                    _local_3.initialise(k.failoverServers[_local_2]);
                                }
                                else
                                {
                                    _local_3 = new _Str_4664(k.failoverServers[_local_2]);
                                }
                                this._Str_5662.push(_local_3);
                            }
                            _local_2++;
                        }
                    }
                }
                if (k.transformers != undefined)
                {
                    if ((k.transformers is String))
                    {
                        this._Str_3676 = [k.transformers];
                    }
                    else
                    {
                        if ((k.transformers is Array))
                        {
                            this._Str_3676 = k.transformers;
                        }
                    }
                }
            }
        }

        public function set ensureSingleAdUnitRecordedPerInlineAd(k:Boolean):void
        {
            this._Str_17573 = k;
        }

        public function get ensureSingleAdUnitRecordedPerInlineAd():Boolean
        {
            return this._Str_17573;
        }

        public function set encodeVars(k:Boolean):void
        {
            this._Str_16412 = k;
        }

        public function get encodeVars():Boolean
        {
            return this._Str_16412;
        }

        public function _Str_25364():Boolean
        {
            if (this._Str_3676 != null)
            {
                return this._Str_3676.length > 0;
            }
            return false;
        }

        public function set transformers(k:Array):void
        {
            this._Str_3676 = k;
        }

        public function get transformers():Array
        {
            return this._Str_3676;
        }

        public function set timeoutInSeconds(k:int):void
        {
            this._Str_11530 = k;
        }

        public function get timeoutInSeconds():int
        {
            return this._Str_11530;
        }

        protected function get defaultTemplate():String
        {
            return "";
        }

        protected function get defaultCustomProperties():CustomProperties
        {
            return new CustomProperties();
        }

        public function get template():String
        {
            if (this._Str_6748 != null)
            {
                return this._Str_6748;
            }
            return this.defaultTemplate;
        }

        public function set template(k:String):void
        {
            this._Str_6748 = k;
        }

        public function set apiServerAddress(k:String):void
        {
            this._Str_12926 = k;
        }

        public function get apiServerAddress():String
        {
            return this._Str_12926;
        }

        public function set apiAddress(k:String):void
        {
            this.apiServerAddress = k;
        }

        public function get apiAddress():String
        {
            return this.apiServerAddress;
        }

        public function set addCacheBuster(k:Boolean):void
        {
            this._Str_9744 = k;
        }

        public function get addCacheBuster():Boolean
        {
            return this._Str_9744;
        }

        public function set parseWrappedAdTags(k:Boolean):void
        {
            this._Str_20883 = k;
        }

        public function get parseWrappedAdTags():Boolean
        {
            return this._Str_20883;
        }

        public function set failoverServers(k:Array):void
        {
            this._Str_5662 = k;
        }

        public function get failoverServers():Array
        {
            return this._Str_5662;
        }

        public function _Str_23936():Boolean
        {
            return this._Str_14867 > 0;
        }

        public function get _Str_14867():int
        {
            if (this._Str_5662 != null)
            {
                return this._Str_5662.length;
            }
            return 0;
        }

        public function _Str_24012(k:int):AdServerConfig
        {
            if (((this._Str_14867 > k) && (this._Str_14867 > 0)))
            {
                return this._Str_5662[k];
            }
            return null;
        }

        public function set failoverConditions(k:FailoverConditionsConfig):void
        {
            this._Str_15247 = k;
        }

        public function get failoverConditions():FailoverConditionsConfig
        {
            return this._Str_15247;
        }

        public function set forceImpressionServing(k:Boolean):void
        {
            this._Str_5101 = k;
        }

        public function get forceImpressionServing():Boolean
        {
            return this._Str_5101;
        }

        public function _Str_22972():Boolean
        {
            return !(this._Str_4857 == null);
        }

        public function set customProperties(k:CustomProperties):void
        {
            this._Str_3753 = k;
        }

        public function get customProperties():CustomProperties
        {
            return this._Str_3753;
        }

        public function set oneAdPerRequest(k:Boolean):void
        {
            this._Str_7775 = k;
        }

        public function get oneAdPerRequest():Boolean
        {
            return this._Str_7775;
        }

        public function set defaultAdServer(k:Boolean):void
        {
            this._Str_15101 = k;
        }

        public function get defaultAdServer():Boolean
        {
            return this._Str_15101;
        }

        public function set allowAdRepetition(k:Boolean):void
        {
            this._Str_14740 = k;
        }

        public function get allowAdRepetition():Boolean
        {
            return this._Str_14740;
        }

        public function set serverType(k:String):void
        {
            this._Str_5295 = k;
        }

        public function get serverType():String
        {
            return this._Str_5295;
        }

        public function _Str_23380():String
        {
            return this.serverType + ((this.oneAdPerRequest) ? "-single" : ("-multiple-" + _Str_2995));
        }

        public function set type(k:String):void
        {
            this.serverType = k;
        }

        public function get type():String
        {
            return this.serverType;
        }

        public function set requestTemplate(k:String):void
        {
            this._Str_6748 = k;
        }

        public function get requestTemplate():String
        {
            return this._Str_6748;
        }

        public function set tag(k:String):void
        {
            this._Str_3096 = k;
        }

        public function get tag():String
        {
            return this._Str_3096;
        }

        public function set tagParams(k:Object):void
        {
            this._Str_4857 = k;
        }

        public function get tagParams():Object
        {
            return this._Str_4857;
        }

        public function set allowVPAID(k:Boolean):void
        {
            this._Str_14150 = k;
        }

        public function get allowVPAID():Boolean
        {
            return this._Str_14150;
        }

        public function set maxDuration(k:int):void
        {
            this._Str_11242 = k;
        }

        public function get maxDuration():int
        {
            return this._Str_11242;
        }

        public function set asVersion(k:String):void
        {
            this._Str_15694 = k;
        }

        public function get asVersion():String
        {
            return this._Str_15694;
        }

        public function set playerWidth(k:int):void
        {
            this._Str_10161 = k;
        }

        public function get playerWidth():int
        {
            return this._Str_10161;
        }

        public function set playerHeight(k:int):void
        {
            this._Str_12360 = k;
        }

        public function get playerHeight():int
        {
            return this._Str_12360;
        }

        public function set mediaUrl(k:String):void
        {
            this._Str_15767 = k;
        }

        public function get mediaUrl():String
        {
            return this._Str_15767;
        }

        public function set pageStreamUrl(k:String):void
        {
            this._Str_15081 = k;
        }

        public function get pageStreamUrl():String
        {
            return this._Str_15081;
        }

        public function set streamUrl(k:String):void
        {
            this._Str_18886 = k;
        }

        public function get streamUrl():String
        {
            return this._Str_18886;
        }

        public function set pageUrl(k:String):void
        {
            this._Str_14580 = k;
        }

        public function get pageUrl():String
        {
            return this._Str_14580;
        }

        public function set format(k:String):void
        {
            this._Str_14298 = k;
        }

        public function get format():String
        {
            return this._Str_14298;
        }

        public function matchesId(k:String):Boolean
        {
            if (this._id == null)
            {
                return k == null;
            }
            if (k == null)
            {
                return false;
            }
            return this._id.toUpperCase() == k.toUpperCase();
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set partnerId(k:String):void
        {
            this._Str_14994 = k;
        }

        public function get partnerId():String
        {
            return this._Str_14994;
        }

        public function set mediaId(k:String):void
        {
            this._Str_15423 = k;
        }

        public function get mediaId():String
        {
            return this._Str_15423;
        }

        public function set mediaTitle(k:String):void
        {
            this._Str_15473 = k;
        }

        public function get mediaTitle():String
        {
            return this._Str_15473;
        }

        public function set mediaDescription(k:String):void
        {
            this._Str_14735 = k;
        }

        public function get mediaDescription():String
        {
            return this._Str_14735;
        }

        public function set mediaCategories(k:String):void
        {
            this._Str_13316 = k;
        }

        public function get mediaCategories():String
        {
            return this._Str_13316;
        }

        public function set mediaKeywords(k:String):void
        {
            this._Str_13878 = k;
        }

        public function get mediaKeywords():String
        {
            return this._Str_13878;
        }

        public function set acceptedLinearAdMimeTypes(k:Array):void
        {
            this._Str_4352 = k;
        }

        public function get acceptedLinearAdMimeTypes():Array
        {
            return this._Str_4352;
        }

        public function _Str_17325():Boolean
        {
            if (this._Str_4352 != null)
            {
                return this._Str_4352.length > 0;
            }
            return false;
        }

        public function isAcceptedLinearAdMimeType(k:String):Boolean
        {
            if (this._Str_17325() == false)
            {
                return true;
            }
            var _local_2:int;
            while (_local_2 < this._Str_4352.length)
            {
                if (StringUtils._Str_2576(this._Str_4352[_local_2], k))
                {
                    return true;
                }
                _local_2++;
            }
            return false;
        }

        public function set filterOnLinearAdMimeTypes(k:Boolean):void
        {
            this._Str_11973 = k;
        }

        public function get filterOnLinearAdMimeTypes():Boolean
        {
            return this._Str_11973;
        }

        public function clone():AdServerConfig
        {
            var k:AdServerConfig = _Str_6024._Str_5664(this._Str_5295);
            k.allowAdRepetition = this._Str_14740;
            k.serverType = this._Str_5295;
            k.oneAdPerRequest = this._Str_7775;
            k.customProperties = this._Str_3753;
            k.template = this._Str_6748;
            k.apiServerAddress = this._Str_12926;
            k.defaultAdServer = this._Str_15101;
            k.forceImpressionServing = this._Str_5101;
            k.requestTemplate = this._Str_6748;
            k.failoverServers = this._Str_5662;
            k.failoverConditions = this._Str_15247;
            k.tag = this._Str_3096;
            k.forceImpressionServing = this._Str_5101;
            k.allowVPAID = this._Str_14150;
            k.maxDuration = this._Str_11242;
            k.asVersion = this._Str_15694;
            k.playerWidth = this._Str_10161;
            k.playerHeight = this._Str_12360;
            k.mediaUrl = this._Str_15767;
            k.pageStreamUrl = this._Str_15081;
            k.pageUrl = this._Str_14580;
            k.streamUrl = this._Str_18886;
            k.format = this._Str_14298;
            k.partnerId = this._Str_14994;
            k.mediaId = this._Str_15423;
            k.mediaTitle = this._Str_15473;
            k.mediaDescription = this._Str_14735;
            k.mediaCategories = this._Str_13316;
            k.mediaKeywords = this._Str_13878;
            k.addCacheBuster = this._Str_9744;
            k.tagParams = this._Str_4857;
            k.timeoutInSeconds = this._Str_11530;
            k.encodeVars = this._Str_16412;
            return k;
        }
    }
}
