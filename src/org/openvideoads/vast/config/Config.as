package org.openvideoads.vast.config
{
    import org.openvideoads.vast.config.groupings.AbstractStreamsConfig;
    import org.openvideoads.vast.config.groupings.AdsConfigGroup;
    import org.openvideoads.vast.config.groupings._Str_5516;
    import org.openvideoads.vast.config.groupings.ShowsConfigGroup;
    import org.openvideoads.vast.config.groupings.DebugConfigGroup;
    import org.openvideoads.vast.config.groupings._Str_7514;
    import org.openvideoads.vast.config.groupings.PlayerConfigGroup;
    import org.openvideoads.vast.config.groupings.analytics.AnalyticsConfigGroup;
    import org.openvideoads.vast.playlist._Str_4575;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;

    public class Config extends AbstractStreamsConfig implements _Str_2741 
    {
        protected var _Str_2462:AdsConfigGroup;
        protected var _Str_6000:_Str_5516;
        protected var _Str_2622:ShowsConfigGroup;
        protected var _Str_4509:DebugConfigGroup;
        protected var _Str_9223:_Str_7514;
        protected var _Str_2860:PlayerConfigGroup;
        protected var _Str_5933:AnalyticsConfigGroup;
        protected var _Str_19053:Boolean = false;
        protected var _Str_19317:Boolean = false;

        public function Config(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_2462 = new AdsConfigGroup();
            this._Str_6000 = new _Str_5516();
            this._Str_2622 = new ShowsConfigGroup();
            this._Str_4509 = new DebugConfigGroup();
            this._Str_9223 = new _Str_7514();
            this._Str_2860 = new PlayerConfigGroup();
            this._Str_5933 = new AnalyticsConfigGroup();
            super(k, _arg_2);
            if (((!(k == null)) || (!(_arg_2 == null))))
            {
                this.initialise(k, _arg_2);
            }
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.shows != undefined)
                {
                    this.shows = k.shows;
                }
                else
                {
                    this._Str_2622.initialise(null, this);
                }
                if (k.regions != undefined)
                {
                    this.regions = k.regions;
                }
                else
                {
                    this._Str_6000.initialise(null, this);
                }
                if (k.tagParams != undefined)
                {
                    this.adsConfig.tagParams = k.tagParams;
                }
                if (k.ads != undefined)
                {
                    this.ads = k.ads;
                }
                else
                {
                    this._Str_2462.initialise(null, this);
                }
                if (k.tag != undefined)
                {
                    this.adsConfig.tag = k.tag;
                }
                if (k.providers != undefined)
                {
                    this.providers = k.providers;
                }
                if (k.debug != undefined)
                {
                    this.debug = k.debug;
                }
                else
                {
                    this._Str_4509.initialise(null, this);
                }
                if (k.player != undefined)
                {
                    this.player = k.player;
                }
                else
                {
                    this._Str_2860.initialise(null, this);
                }
                if (k.analytics != undefined)
                {
                    this.analytics = k.analytics;
                }
                else
                {
                    this._Str_5933.initialise(null, this);
                }
                if (k.supportExternalPlaylistLoading != undefined)
                {
                    if ((k.supportExternalPlaylistLoading is String))
                    {
                        this.supportExternalPlaylistLoading = ((k.supportExternalPlaylistLoading.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.supportExternalPlaylistLoading = k.supportExternalPlaylistLoading;
                    }
                }
                if (k.autoPlayOnExternalLoad != undefined)
                {
                    if ((k.autoPlayOnExternalLoad is String))
                    {
                        this.autoPlayOnExternalLoad = ((k.autoPlayOnExternalLoad.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.autoPlayOnExternalLoad = k.autoPlayOnExternalLoad;
                    }
                }
                if (this._Str_2860 != null)
                {
                    if (this._Str_2860._Str_18778())
                    {
                        this._Str_2462._Str_19379(this._Str_2860.height);
                    }
                    if (this._Str_2860._Str_16865())
                    {
                        this._Str_2462._Str_20939(this._Str_2860.width);
                    }
                }
            }
            this.onOVAConfigLoaded();
        }

        public function _Str_26353():void
        {
            if (this._Str_2462._Str_6073() == false)
            {
                this._Str_2462._Str_3144();
            }
            if (this._Str_6000._Str_6073() == false)
            {
                this._Str_6000._Str_3144();
            }
            if (this._Str_2622._Str_6073() == false)
            {
                this._Str_2622._Str_3144();
            }
            if (this._Str_4509._Str_6073() == false)
            {
                this._Str_4509._Str_3144();
            }
            if (this._Str_9223._Str_6073() == false)
            {
                this._Str_9223._Str_3144();
            }
            if (this._Str_5933._Str_6073() == false)
            {
                this._Str_5933._Str_3144();
            }
            if (this._Str_2860._Str_6073() == false)
            {
                this._Str_2860._Str_3144();
            }
        }

        override public function setLoadedListener(k:_Str_2741):void
        {
            _Str_4686 = k;
            this.onOVAConfigLoaded();
        }

        override public function onOVAConfigLoaded():void
        {
            if ((((((((!(this._Str_2462.isOVAConfigLoading())) && (!(this._Str_6000.isOVAConfigLoading()))) && (!(this._Str_2622.isOVAConfigLoading()))) && (!(this._Str_4509.isOVAConfigLoading()))) && (!(this._Str_9223.isOVAConfigLoading()))) && (!(this._Str_5933.isOVAConfigLoading()))) && (!(this._Str_2860.isOVAConfigLoading()))))
            {
                if (_Str_4686 != null)
                {
                    _Str_4686.onOVAConfigLoaded();
                }
            }
        }

        override public function isOVAConfigLoading():Boolean
        {
            return ((((this._Str_2462.isOVAConfigLoading()) || (this._Str_6000.isOVAConfigLoading())) || (this._Str_2622.isOVAConfigLoading())) || (this._Str_4509.isOVAConfigLoading())) || (this._Str_9223.isOVAConfigLoading());
        }

        public function _Str_25879(k:_Str_4575):void
        {
            this._Str_2622.streams = k._Str_10087();
        }

        public function _Str_18778():Boolean
        {
            if (this._Str_2860 != null)
            {
                return this._Str_2860._Str_18778();
            }
            return false;
        }

        public function _Str_16865():Boolean
        {
            if (this._Str_2860 != null)
            {
                return this._Str_2860._Str_16865();
            }
            return false;
        }

        public function set playerHeight(k:int):void
        {
            if (this._Str_2860 == null)
            {
                this._Str_2860 = new PlayerConfigGroup();
            }
            this._Str_2860.height = k;
            if (this._Str_2462 != null)
            {
                this._Str_2462._Str_19379(this._Str_2860.height);
            }
        }

        public function get playerHeight():int
        {
            if (this._Str_2860 != null)
            {
                return this._Str_2860.height;
            }
            return -1;
        }

        public function set playerWidth(k:int):void
        {
            if (this._Str_2860 == null)
            {
                this._Str_2860 = new PlayerConfigGroup();
            }
            this._Str_2860.width = k;
            if (this._Str_2462 != null)
            {
                this._Str_2462._Str_20939(this._Str_2860.width);
            }
        }

        public function get playerWidth():int
        {
            if (this._Str_2860 != null)
            {
                return this._Str_2860.width;
            }
            return -1;
        }

        public function set supportExternalPlaylistLoading(k:Boolean):void
        {
            this._Str_19053 = k;
        }

        public function get supportExternalPlaylistLoading():Boolean
        {
            return this._Str_19053;
        }

        public function set autoPlayOnExternalLoad(k:Boolean):void
        {
            this._Str_19317 = k;
        }

        public function get autoPlayOnExternalLoad():Boolean
        {
            return this._Str_19317;
        }

        public function _Str_12146():Boolean
        {
            return this._Str_2462._Str_12146();
        }

        public function get millisecondDelayOnCompanionInjection():int
        {
            return this._Str_2462.millisecondDelayOnCompanionInjection;
        }

        public function set analytics(k:*):void
        {
            if ((k is AnalyticsConfigGroup))
            {
                this._Str_5933 = k;
                this._Str_5933.initialise(null, this, true);
            }
            else
            {
                this._Str_5933.initialise(k, this, true);
            }
        }

        public function get analytics():AnalyticsConfigGroup
        {
            return this._Str_5933;
        }

        public function set tag(k:String):void
        {
            if (this._Str_2462 != null)
            {
                this._Str_2462.tag = k;
            }
        }

        public function set tagParams(k:Object):void
        {
            if (this._Str_2462 != null)
            {
                this._Str_2462.tagParams = k;
            }
        }

        public function _Str_21394():Boolean
        {
            return this._Str_2622.enableProxies;
        }

        public function _Str_20773():Boolean
        {
            return this._Str_2462.enableProxies;
        }

        public function canSkipOnLinearAd():Boolean
        {
            return this._Str_2462.canSkipOnLinearAd();
        }

        public function getLinearVPAIDRegionID():String
        {
            return this._Str_2462.vpaidConfig.getLinearRegion((!(this._Str_2860.shouldHideControlsOnLinearPlayback(true))));
        }

        public function getNonLinearVPAIDRegionID():String
        {
            return this._Str_2462.vpaidConfig.nonLinearRegion;
        }

        public function vpaidMaxDurationTimeoutEnabled():Boolean
        {
            return this._Str_2462.vpaidMaxDurationTimeoutEnabled();
        }

        public function get vpaidMaxDurationTimeout():int
        {
            return this._Str_2462.vpaidMaxDurationTimeout;
        }

        public function controlEnabledForLinearAdType(k:String, _arg_2:Boolean):Boolean
        {
            return this._Str_2860.controlEnabledForLinearAdType(k, _arg_2);
        }

        public function get scheduleAds():Boolean
        {
            return this._Str_2462.activelySchedule;
        }

        public function set shows(k:Object):void
        {
            if (k.player != undefined)
            {
                k.player = this.player;
            }
            this._Str_2622.initialise(k, this);
        }

        public function get _Str_21867():ShowsConfigGroup
        {
            return this._Str_2622;
        }

        public function set _Str_21867(k:ShowsConfigGroup):void
        {
            this._Str_2622 = k;
        }

        public function _Str_26049():Boolean
        {
            return this._Str_2622._Str_21533();
        }

        public function set regions(k:Object):void
        {
            this._Str_6000 = new _Str_5516();
            this._Str_6000.initialise(k, this);
        }

        public function get _Str_23104():_Str_5516
        {
            return this._Str_6000;
        }

        override public function set player(k:Object):void
        {
            if (this._Str_2860 == null)
            {
                this._Str_2860 = new PlayerConfigGroup();
            }
            this._Str_2860.initialise(k, this);
        }

        public function set _Str_4565(k:PlayerConfigGroup):void
        {
            this._Str_2860 = k;
        }

        public function get _Str_4565():PlayerConfigGroup
        {
            return this._Str_2860;
        }

        public function set ads(k:Object):void
        {
            if (k != null)
            {
                if (k.player != undefined)
                {
                    k.player = this.player;
                }
                this._Str_2462.initialise(k, this);
            }
        }

        public function get adsConfig():AdsConfigGroup
        {
            return this._Str_2462;
        }

        public function get _Str_26185():_Str_7514
        {
            return this._Str_9223;
        }

        public function get pauseOnClickThrough():Boolean
        {
            return this._Str_2462.pauseOnClickThrough;
        }

        public function _Str_21050():Boolean
        {
            return this._Str_2462.setDurationFromMetaData;
        }

        public function _Str_19637():Boolean
        {
            return this._Str_2622.setDurationFromMetaData;
        }

        public function operateWithoutStreamDuration():Boolean
        {
            return this._Str_2622.mustOperateWithoutDuration();
        }

        public function get adServerConfig():AdServerConfig
        {
            return this._Str_2462.adServerConfig;
        }

        public function set debug(k:Object):void
        {
            this._Str_4509 = new DebugConfigGroup();
            this._Str_4509.initialise(k, this);
        }

        public function _Str_26135():Boolean
        {
            return this._Str_2622._Str_21533();
        }

        public function set streams(k:Array):void
        {
            this._Str_2622.streams = k;
        }

        public function get streams():Array
        {
            return this._Str_2622.streams;
        }

        public function _Str_21649(k:Array):void
        {
            this._Str_2622._Str_21649(k);
        }

        public function get previewImage():String
        {
            if (this._Str_2622 != null)
            {
                return this._Str_2622._Str_12928();
            }
            return null;
        }

        public function _Str_8478():Boolean
        {
            return this._Str_2462._Str_8478();
        }

        public function get companionDivIDs():Array
        {
            return this._Str_2462.companionDivIDs;
        }

        public function get displayCompanions():Boolean
        {
            return this._Str_2462.displayCompanions;
        }

        public function get restoreCompanions():Boolean
        {
            return this._Str_2462.restoreCompanions;
        }

        public function get _Str_7826():Boolean
        {
            return this._Str_2462._Str_7826;
        }

        public function get _Str_22059():Boolean
        {
            return this._Str_2462.nativeDisplay == false;
        }

        public function get notice():Object
        {
            return this._Str_2462.notice;
        }

        public function get showNotice():Boolean
        {
            return this._Str_2462.showNotice();
        }

        public function get _Str_16561():Boolean
        {
            return this._Str_2462._Str_16561;
        }

        public function get _Str_8392():Array
        {
            return this._Str_2462.schedule;
        }

        override public function hasProviders():Boolean
        {
            return (this._Str_2622.hasProviders()) && (this._Str_2462.hasProviders());
        }

        override public function setDefaultProviders():void
        {
            _Str_3337 = new ProvidersConfigGroup();
            this._Str_2622.setDefaultProviders();
            this._Str_2462.setDefaultProviders();
        }

        public function ensureProvidersAreSet():void
        {
            if (_Str_3337 == null)
            {
                _Str_3337 = new ProvidersConfigGroup();
            }
            if (!this._Str_2622.hasProviders())
            {
                this._Str_2622.setDefaultProviders();
            }
            if (!this._Str_2462.hasProviders())
            {
                this._Str_2462.setDefaultProviders();
            }
        }

        public function _Str_25978(k:String, _arg_2:String):void
        {
            if (_Str_3337 == null)
            {
                _Str_3337 = new ProvidersConfigGroup();
                _Str_3337.httpProvider = k;
                _Str_3337.rtmpProvider = _arg_2;
            }
            if (!this._Str_2622.hasProviders())
            {
                this._Str_2622.setDefaultProviders();
                this._Str_2622.httpProvider = k;
                this._Str_2622.rtmpProvider = _arg_2;
            }
            if (!this._Str_2462.hasProviders())
            {
                this._Str_2462.setDefaultProviders();
                this._Str_2462.httpProvider = k;
                this._Str_2462.rtmpProvider = _arg_2;
            }
        }

        override public function set rtmpProvider(k:String):void
        {
            _Str_4721.rtmpProvider = k;
            this._Str_2622.rtmpProvider = k;
            this._Str_2462.rtmpProvider = k;
        }

        override public function set httpProvider(k:String):void
        {
            _Str_4721.httpProvider = k;
            this._Str_2622.httpProvider = k;
            this._Str_2462.httpProvider = k;
        }

        public function _Str_26245():ProvidersConfigGroup
        {
            return this._Str_2622._Str_4721;
        }

        public function _Str_26413():ProvidersConfigGroup
        {
            return this._Str_2462._Str_4721;
        }

        public function _Str_26258(k:String):String
        {
            return this._Str_2622.getProvider(k);
        }

        public function set _Str_23390(k:String):void
        {
            this._Str_2622.rtmpProvider = k;
        }

        public function get _Str_23390():String
        {
            return this._Str_2622.rtmpProvider;
        }

        public function set _Str_25128(k:String):void
        {
            this._Str_2622.httpProvider = k;
        }

        public function get _Str_25128():String
        {
            return this._Str_2622.httpProvider;
        }

        public function _Str_26026(k:String):String
        {
            return this._Str_2462.getProvider(k);
        }

        public function set _Str_24310(k:String):void
        {
            this._Str_2462.rtmpProvider = k;
        }

        public function get _Str_24310():String
        {
            return this._Str_2462.rtmpProvider;
        }

        public function set _Str_24194(k:String):void
        {
            this._Str_2462.httpProvider = k;
        }

        public function get _Str_24194():String
        {
            return this._Str_2462.httpProvider;
        }

        override public function get allowPlaylistControl():Boolean
        {
            return (this._Str_2622._Str_23304()) ? this._Str_2622.allowPlaylistControl : _Str_11903;
        }

        override public function get playOnce():Boolean
        {
            return (this._Str_2462._Str_22516()) ? this._Str_2462.playOnce : _Str_4538;
        }

        override public function get deliveryType():String
        {
            return (this._Str_2622._Str_19939()) ? this._Str_2622.deliveryType : ((this._Str_2462._Str_19939()) ? this._Str_2462.deliveryType : _Str_4101);
        }

        override public function get baseURL():String
        {
            return (this._Str_2622._Str_20891()) ? this._Str_2622.baseURL : ((this._Str_2462._Str_20891()) ? this._Str_2462.baseURL : _Str_2846);
        }

        override public function get streamType():String
        {
            return (this._Str_2622._Str_21706()) ? this._Str_2622.streamType : ((this._Str_2462._Str_21706()) ? this._Str_2462.streamType : _Str_4718);
        }

        override public function get subscribe():Boolean
        {
            return (this._Str_2622._Str_21260()) ? this._Str_2622.subscribe : ((this._Str_2462._Str_21260()) ? this._Str_2462.subscribe : _Str_10343);
        }

        override public function get bitrate():*
        {
            return (this._Str_2622._Str_21448()) ? this._Str_2622.bitrate : ((this._Str_2462._Str_21448()) ? this._Str_2462.bitrate : _Str_4980);
        }

        public function get visuallyCueLinearAdClickThrough():Boolean
        {
            return this._Str_2462.visuallyCueLinearAdClickThrough;
        }

        public function set acceptedLinearAdMimeTypes(k:Array):void
        {
            this._Str_2462.acceptedLinearAdMimeTypes = k;
        }

        public function get acceptedLinearAdMimeTypes():Array
        {
            return this._Str_2462.acceptedLinearAdMimeTypes;
        }

        public function set filterOnLinearAdMimeTypes(k:Boolean):void
        {
            this._Str_2462.filterOnLinearAdMimeTypes = k;
        }

        public function get filterOnLinearAdMimeTypes():Boolean
        {
            return this._Str_2462.filterOnLinearAdMimeTypes;
        }

        public function _Str_16875():Boolean
        {
            return this._Str_4509._Str_16875();
        }

        public function get debugger():String
        {
            return this._Str_4509.debugger;
        }

        public function outputingDebug():Boolean
        {
            return this._Str_4509.outputingDebug();
        }

        public function get _Str_23960():String
        {
            return this._Str_4509.levels;
        }

        public function _Str_18288():Boolean
        {
            return this._Str_4509._Str_18288();
        }
    }
}
