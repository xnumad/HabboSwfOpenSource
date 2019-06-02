package org.openvideoads.vast.model
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.events._Str_3019;
    import org.openvideoads.util.ArrayUtils;

    public class VideoAd extends Debuggable 
    {
        public static const LINEAR:String = "linear";
        public static const _Str_6723:String = "non-linear";
        public static const COMPANION:String = "companion";
        public static const UNKNOWN:String = "unknown";
        public static const _Str_16569:String = "linear-vpaid";
        public static const _Str_16642:String = "non-linear-vpaid";

        protected var _id:String;
        protected var _Str_9985:String = null;
        protected var _Str_7451:String = null;
        protected var _Str_14340:String;
        protected var _Str_14487:String;
        protected var _Str_6606:String;
        protected var _Str_15105:String;
        protected var _Str_1858:String;
        protected var _Str_10070:String;
        protected var _error:String;
        protected var _Str_3519:Array;
        protected var _Str_3053:Array;
        protected var _Str_2815:LinearVideoAd = null;
        protected var _Str_2587:Array;
        protected var _Str_3336:Array;
        protected var _Str_10143:Boolean = false;
        protected var _Str_3517:Array;
        protected var _Str_7809:Array;
        protected var _Str_17197:WrappedVideoAdV1 = null;
        protected var _Str_3562:Object = null;

        public function VideoAd()
        {
            this._Str_3519 = new Array();
            this._Str_3053 = new Array();
            this._Str_2587 = new Array();
            this._Str_3336 = new Array();
            this._Str_3517 = new Array();
            this._Str_7809 = new Array();
            super();
        }

        public function unload():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            if (this.hasAds())
            {
                if (this.hasLinearAd())
                {
                    this._Str_2815.unload();
                }
                if (this.hasNonLinearAds())
                {
                    k = 0;
                    while (k < this._Str_2587.length)
                    {
                        this._Str_2587[k].unload();
                        k++;
                    }
                }
            }
            if (this._Str_16075())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3519.length)
                {
                    this._Str_3519[_local_2].unload();
                    _local_2++;
                }
            }
            if (this.hasTrackingEvents())
            {
                _local_3 = 0;
                while (_local_3 < this._Str_3053.length)
                {
                    this._Str_3053[_local_3].unload();
                    _local_3++;
                }
            }
            if (this.hasCompanionAds())
            {
                _local_4 = 0;
                while (_local_4 < this._Str_3336.length)
                {
                    this._Str_3336[_local_4].unload();
                    _local_4++;
                }
            }
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function setPreferredSelectionCriteria(k:Object):void
        {
            this._Str_3562 = k;
        }

        public function _Str_13087():Boolean
        {
            return !(this._Str_3562 == null);
        }

        public function _Str_15642():*
        {
            if (this._Str_3562 != null)
            {
                if (this._Str_3562.hasOwnProperty("bitrate"))
                {
                    return this._Str_3562.bitrate;
                }
            }
            return -1;
        }

        public function _Str_14891():*
        {
            if (this._Str_3562 != null)
            {
                if (this._Str_3562.hasOwnProperty("mimeType"))
                {
                    return this._Str_3562.mimeType;
                }
            }
            return "any";
        }

        public function _Str_13161():String
        {
            if (this._Str_3562 != null)
            {
                if (this._Str_3562.hasOwnProperty("deliveryType"))
                {
                    return this._Str_3562.deliveryType;
                }
            }
            return "any";
        }

        public function _Str_14847():*
        {
            if (this._Str_3562 != null)
            {
                if (this._Str_3562.hasOwnProperty("width"))
                {
                    return this._Str_3562.width;
                }
            }
            return -1;
        }

        public function _Str_14760():*
        {
            if (this._Str_3562 != null)
            {
                if (this._Str_3562.hasOwnProperty("height"))
                {
                    return this._Str_3562.height;
                }
            }
            return -1;
        }

        public function hasAds(k:Boolean=false):Boolean
        {
            if (k)
            {
                return ((this.hasLinearAd()) || (this.hasNonLinearAds())) || (this._Str_16075());
            }
            return (this._Str_15398() == false) || ((this.hasNonLinearAds()) && (this._Str_13487() == false));
        }

        public function _Str_23787():Boolean
        {
            return (this.hasLinearAd()) && (this.hasNonLinearAds());
        }

        public function _Str_25585(k:String):Boolean
        {
            return StringUtils._Str_2576(this._Str_6606, "OPENX");
        }

        public function filterLinearAdMediaFileByMimeType(k:Array):void
        {
            if (this._Str_2815 != null)
            {
                this._Str_2815.filterLinearAdMediaFileByMimeType(k);
            }
        }

        protected function _Str_12713(k:String, _arg_2:AdServerConfig):Boolean
        {
            if (_arg_2 != null)
            {
                return _arg_2.isAcceptedLinearAdMimeType(k);
            }
            return true;
        }

        public function hasWrapper():Boolean
        {
            return !(this._Str_17197 == null);
        }

        public function set wrapper(k:WrappedVideoAdV1):void
        {
            this._Str_17197 = k;
        }

        public function get wrapper():WrappedVideoAdV1
        {
            return this._Str_17197;
        }

        public function _Str_26388(k:Boolean):void
        {
        }

        public function canFireAPICalls():Boolean
        {
            return false;
        }

        public function _Str_26436(k:Boolean):void
        {
        }

        public function canFireEventAPICalls():Boolean
        {
            return false;
        }

        public function set useV2APICalls(k:Boolean):void
        {
        }

        public function get useV2APICalls():Boolean
        {
            return false;
        }

        public function set jsCallbackScopingPrefix(k:String):void
        {
        }

        public function get jsCallbackScopingPrefix():String
        {
            return "";
        }

        protected function _Str_24949():void
        {
            this._Str_3517 = new Array();
        }

        protected function _Str_17110(k:int, _arg_2:int):int
        {
            var _local_3:int;
            while (_local_3 < this._Str_3517.length)
            {
                if (((this._Str_3517[_local_3].width == k) && (this._Str_3517[_local_3].height == _arg_2)))
                {
                    this._Str_3517[_local_3].index = (this._Str_3517[_local_3].index + 1);
                    return this._Str_3517[_local_3].index;
                }
                _local_3++;
            }
            this._Str_3517.push({
                "width":k,
                "height":_arg_2,
                "index":0
            });
            return 0;
        }

        public function injectAllTrackingData(k:VideoAd):VideoAd
        {
            return k;
        }

        public function _Str_16323(k:XML):void
        {
            var _local_2:XMLList;
            var _local_3:int;
            if (((!(k.Impression == null)) && (!(k.Impression.children() == null))))
            {
                _local_2 = k.Impression.children();
                _local_3 = 0;
                while (_local_3 < _local_2.length())
                {
                    this._Str_22638(new Impression(_local_2[_local_3].@id, _local_2[_local_3]));
                    _local_3++;
                }
            }
        }

        public function _Str_18315(k:XML):void
        {
            var _local_2:XMLList;
            var _local_3:int;
            var _local_4:XML;
            var _local_5:TrackingEvent;
            var _local_6:XMLList;
            var _local_7:int;
            var _local_8:XML;
            if (((!(k.TrackingEvents == null)) && (!(k.TrackingEvents.children() == null))))
            {
                _local_2 = k.TrackingEvents.children();
                _local_3 = 0;
                while (_local_3 < _local_2.length())
                {
                    _local_4 = _local_2[_local_3];
                    _local_5 = new TrackingEvent(_local_4.@event);
                    _local_6 = _local_4.children();
                    _local_7 = 0;
                    while (_local_7 < _local_6.length())
                    {
                        _local_8 = _local_6[_local_7];
                        _local_5._Str_9951(new NetworkResource(_local_8.@id, _local_8.text()));
                        _local_7++;
                    }
                    this._Str_10620(_local_5);
                    _local_3++;
                }
            }
        }

        public function _Str_24028(k:XML, _arg_2:int=-1, _arg_3:AdServerConfig=null):void
        {
            var _local_8:XMLList;
            var _local_9:XML;
            var _local_10:int;
            var _local_11:XMLList;
            var _local_12:XML;
            var _local_13:MediaFile;
            var _local_14:XML;
            var _local_4:LinearVideoAd = new LinearVideoAd();
            var _local_5:String = "";
            var _local_6:String = "";
            _local_4._Str_18431 = k.Video.AdID;
            _local_4.index = _arg_2;
            var _local_7:String;
            if (k.Video.VideoLength != undefined)
            {
                _local_7 = k.Video.VideoLength;
            }
            else
            {
                if (k.Video.Duration != undefined)
                {
                    _local_7 = k.Video.Duration;
                }
            }
            if (_local_7 != null)
            {
                if (Timestamp.validate(_local_7))
                {
                    _local_4.duration = _local_7;
                }
                else
                {
                    _local_4.duration = Timestamp._Str_16820(_local_7);
                }
            }
            if (k.Video.AdParameters != undefined)
            {
                if (!StringUtils.isEmpty(k.Video.AdParameters.@apiFramework))
                {
                    _local_5 = k.Video.AdParameters.@apiFramework;
                    _local_6 = k.Video.AdParameters.text();
                }
            }
            if (k.Video.VideoClicks != undefined)
            {
                _local_10 = 0;
                if (k.Video.VideoClicks.ClickThrough.children().length() > 0)
                {
                    _local_8 = k.Video.VideoClicks.ClickThrough.children();
                    _local_10 = 0;
                    while (_local_10 < _local_8.length())
                    {
                        _local_9 = _local_8[_local_10];
                        if (!StringUtils.isEmpty(_local_9.text()))
                        {
                            _local_4._Str_7230(new NetworkResource(_local_9.@id, _local_9.text()));
                        }
                        _local_10++;
                    }
                }
                if (k.Video.VideoClicks.ClickTracking.children().length() > 0)
                {
                    _local_8 = k.Video.VideoClicks.ClickTracking.children();
                    _local_10 = 0;
                    while (_local_10 < _local_8.length())
                    {
                        _local_9 = _local_8[_local_10];
                        if (!StringUtils.isEmpty(_local_9.text()))
                        {
                            _local_4._Str_10053(new NetworkResource(_local_9.@id, _local_9.text()));
                        }
                        _local_10++;
                    }
                }
                if (k.Video.VideoClicks.CustomClick.children().length() > 0)
                {
                    _local_8 = k.Video.CustomClick.ClickTracking.children();
                    _local_10 = 0;
                    while (_local_10 < _local_8.length())
                    {
                        _local_9 = _local_8[_local_10];
                        if (!StringUtils.isEmpty(_local_9.text()))
                        {
                            _local_4._Str_10085(new NetworkResource(_local_9.@id, _local_9.text()));
                        }
                        _local_10++;
                    }
                }
            }
            if (k.Video.MediaFiles != undefined)
            {
                _local_11 = k.Video.MediaFiles.children();
                _local_10 = 0;
                while (_local_10 < _local_11.length())
                {
                    _local_12 = _local_11[_local_10];
                    if (_local_12.children().length() > 0)
                    {
                        if (this._Str_12713(_local_12.@type, _arg_3))
                        {
                            _local_13 = ((StringUtils._Str_2576(_local_5, "VPAID")) ? new VPAIDMediaFile() : new MediaFile());
                            _local_13.id = _local_12.@id;
                            _local_13.bandwidth = _local_12.@bandwidth;
                            _local_13.delivery = _local_12.@delivery;
                            _local_13.mimeType = _local_12.@type;
                            _local_13.bitRate = int(_local_12.@bitrate);
                            _local_13.width = _local_12.@width;
                            _local_13.height = _local_12.@height;
                            _local_13.scale = _local_12.@scalable;
                            _local_13.maintainAspectRatio = _local_12.@maintainAspectRatio;
                            _local_13.apiFramework = _local_5;
                            _local_13.adParameters = _local_6;
                            _local_13._Str_19024 = _local_4;
                            _local_14 = _local_12.children()[0];
                            _local_13.url = new AdNetworkResource(_local_14.@id, _local_14.text(), _local_12.@type);
                            _local_4._Str_19374(_local_13);
                        }
                    }
                    _local_10++;
                }
            }
            this.linearVideoAd = _local_4;
        }

        public function _Str_24780(k:XML, _arg_2:int=-1):void
        {
            var _local_5:XML;
            var _local_6:NonLinearVideoAd;
            var _local_7:XMLList;
            var _local_8:XML;
            var _local_9:int;
            var _local_3:XMLList = k.NonLinearAds.children();
            var _local_4:int;
            _local_4 = 0;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                _local_6 = null;
                switch (_local_5.@resourceType.toUpperCase())
                {
                    case "HTML":
                        _local_6 = new _Str_6389();
                        break;
                    case "TEXT":
                        _local_6 = new NonLinearTextAd();
                        break;
                    case "SCRIPT":
                        _local_6 = new _Str_4867();
                        break;
                    case "IFRAME":
                        _local_6 = new _Str_6437();
                        break;
                    case "STATIC":
                        if (((!(_local_5.@creativeType == undefined)) && (!(_local_5.@creativeType == null))))
                        {
                            switch (_local_5.@creativeType.toUpperCase())
                            {
                                case "IMAGE/JPEG":
                                case "JPEG":
                                case "IMAGE/GIF":
                                case "GIF":
                                case "IMAGE/PNG":
                                case "PNG":
                                    _local_6 = new _Str_5606();
                                    break;
                                case "APPLICATION/X-SHOCKWAVE-FLASH":
                                case "SWF":
                                    if (StringUtils._Str_2576(_local_5.@apiFramework, "VPAID"))
                                    {
                                        _local_6 = new VPAIDNonLinearAd();
                                    }
                                    else
                                    {
                                        _local_6 = new _Str_4713();
                                    }
                                    break;
                                case "SCRIPT":
                                case "JAVASCRIPT":
                                case "TEXT/JAVASCRIPT":
                                case "TEXT/SCRIPT":
                                    _local_6 = new _Str_4867();
                                    break;
                                default:
                                    _local_6 = new NonLinearVideoAd();
                            }
                        }
                        else
                        {
                            _local_6 = new NonLinearVideoAd();
                        }
                        break;
                    default:
                        _local_6 = new NonLinearVideoAd();
                }
                _local_6.index = _arg_2;
                _local_6.id = _local_5.@id;
                _local_6.width = _local_5.@width;
                _local_6.height = _local_5.@height;
                if (_local_5.@expandedWidth != undefined)
                {
                    _local_6.expandedWidth = _local_5.@expandedWidth;
                }
                if (_local_5.@expandedHeight != undefined)
                {
                    _local_6.expandedHeight = _local_5.@expandedHeight;
                }
                _local_6.resourceType = _local_5.@resourceType;
                _local_6.creativeType = _local_5.@creativeType;
                _local_6.apiFramework = _local_5.@apiFramework;
                _local_6.maintainAspectRatio = _local_5.@maintainAspectRatio;
                _local_6.scale = _local_5.@scalable;
                if (_local_5.URL != undefined)
                {
                    _local_6.url = new NetworkResource(null, _local_5.URL.text());
                }
                if (_local_5.Code != undefined)
                {
                    _local_6.codeBlock = _local_5.Code.text();
                }
                if (_local_5.NonLinearClickThrough != undefined)
                {
                    _local_7 = _local_5.NonLinearClickThrough.children();
                    _local_9 = 0;
                    while (_local_9 < _local_7.length())
                    {
                        _local_8 = _local_7[_local_9];
                        _local_6._Str_7230(new NetworkResource(_local_8.@id, _local_8.text()));
                        _local_9++;
                    }
                }
                this._Str_19277(_local_6);
                _local_4++;
            }
        }

        public function _Str_24076(k:XML):void
        {
            var _local_4:XML;
            var _local_5:CompanionAd;
            var _local_6:XMLList;
            var _local_7:XML;
            var _local_8:int;
            var _local_2:XMLList = k.CompanionAds.children();
            var _local_3:int;
            this._Str_24949();
            _local_3 = 0;
            while (_local_3 < _local_2.length())
            {
                _local_4 = _local_2[_local_3];
                _local_5 = new CompanionAd(this);
                _local_5.id = _local_4.@id;
                _local_5.width = _local_4.@width;
                _local_5.height = _local_4.@height;
                _local_5.index = this._Str_17110(_local_5.width, _local_5.height);
                if (_local_4.@resourceType != undefined)
                {
                    _local_5.resourceType = _local_4.@resourceType;
                }
                else
                {
                    _local_5.resourceType = "static";
                }
                if (_local_4.@creativeType != undefined)
                {
                    _local_5.creativeType = _local_4.@creativeType;
                }
                if (_local_4.URL != undefined)
                {
                    _local_5.url = new NetworkResource(null, _local_4.URL.text());
                }
                if (_local_4.Code != undefined)
                {
                    _local_5.codeBlock = _local_4.Code.text();
                }
                if (_local_4.AltText != undefined)
                {
                    _local_5.altText = _local_4.AltText.text();
                }
                if (_local_4.AdParameters != undefined)
                {
                    _local_5.adParameters = _local_4.AdParameters.text();
                }
                if (_local_4.CompanionClickThrough != undefined)
                {
                    _local_6 = _local_4.CompanionClickThrough;
                    _local_8 = 0;
                    while (_local_8 < _local_6.length())
                    {
                        _local_7 = _local_6[_local_8];
                        if (_local_7.URL != undefined)
                        {
                            _local_5._Str_7230(new NetworkResource(_local_7.@id, _local_7.URL.text()));
                        }
                        _local_8++;
                    }
                }
                this._Str_24117(_local_5);
                _local_3++;
            }
        }

        public function _Str_25118(k:XML):void
        {
            var _local_4:XML;
            var _local_5:XMLList;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:int;
            var _local_2:XMLList = k.Extensions.children();
            var _local_3:int;
            while (_local_3 < _local_2.length())
            {
                _local_4 = _local_2[_local_3];
                if (_local_4.@type == "NonLinearClickTracking")
                {
                    if (_local_4.ClickTracking != undefined)
                    {
                        _local_5 = _local_4.ClickTracking.children();
                        _local_6 = new Array();
                        _local_7 = 0;
                        while (_local_7 < _local_5.length())
                        {
                            if (!StringUtils.isEmpty(_local_5[_local_7].text()))
                            {
                                _local_6.push(new NetworkResource(_local_5[_local_7].@id, _local_5[_local_7].text()));
                            }
                            _local_7++;
                        }
                        _local_8 = 0;
                        while (_local_8 < this._Str_2587.length)
                        {
                            NonLinearVideoAd(this._Str_2587[_local_8])._Str_21348(_local_6);
                            _local_8++;
                        }
                    }
                }
                _local_3++;
            }
        }

        public function addClickTrackingItems(k:Array):void
        {
            if (this._Str_2815 != null)
            {
                this._Str_2815.addClickTrackingItems(k);
            }
        }

        public function addCustomClickTrackingItems(k:Array):void
        {
            if (this._Str_2815 != null)
            {
                this._Str_2815.addCustomClickTrackingItems(k);
            }
        }

        public function set adId(k:String):void
        {
            this._Str_7451 = k;
        }

        public function get adId():String
        {
            return this._Str_7451;
        }

        public function set inlineAdId(k:String):void
        {
            this._Str_9985 = k;
        }

        public function get inlineAdId():String
        {
            return this._Str_9985;
        }

        public function _Str_19109(k:String):Boolean
        {
            return this._Str_9985 == k;
        }

        public function set creativeId(k:String):void
        {
            this._Str_14487 = k;
        }

        public function get creativeId():String
        {
            return this._Str_14487;
        }

        public function set sequenceId(k:String):void
        {
            this._Str_14340 = k;
        }

        public function get sequenceId():String
        {
            return this._Str_14340;
        }

        public function set adSystem(k:String):void
        {
            this._Str_6606 = k;
        }

        public function get adSystem():String
        {
            return this._Str_6606;
        }

        public function get duration():int
        {
            if (this._Str_2815 != null)
            {
                return Timestamp.timestampToSeconds(this._Str_2815.duration);
            }
            if (this.hasNonLinearAds())
            {
                if (this._Str_2587[0].hasRecommendedMinDuration())
                {
                    return this._Str_2587[0].recommendedMinDuration;
                }
            }
            return 0;
        }

        public function _Str_25515(k:int):int
        {
            var _local_2:int = this.duration;
            if (((_local_2 == 0) && (k > 0)))
            {
                return k;
            }
            return _local_2;
        }

        public function set adTitle(k:String):void
        {
            this._Str_15105 = k;
        }

        public function get adTitle():String
        {
            return this._Str_15105;
        }

        public function set description(k:String):void
        {
            this._Str_1858 = k;
        }

        public function get description():String
        {
            return this._Str_1858;
        }

        public function _Str_20690():Boolean
        {
            return !(this._Str_10070 == null);
        }

        public function set survey(k:String):void
        {
            this._Str_10070 = k;
        }

        public function get survey():String
        {
            return this._Str_10070;
        }

        public function _Str_25033():Boolean
        {
            return !(this._error == null);
        }

        public function set error(k:String):void
        {
            this._error = k;
        }

        public function get error():String
        {
            return this._error;
        }

        public function _Str_23092():NetworkResource
        {
            return new NetworkResource("error", this.error);
        }

        public function set impressions(k:Array):void
        {
            this._Str_3519 = k;
        }

        public function get impressions():Array
        {
            return this._Str_3519;
        }

        public function get _Str_26057():Array
        {
            return this._Str_3519;
        }

        public function _Str_22638(k:NetworkResource):void
        {
            this._Str_3519.push(k);
        }

        public function addImpressions(k:Array):void
        {
            this._Str_3519 = this._Str_3519.concat(k);
        }

        public function _Str_16075():Boolean
        {
            return this._Str_3519.length > 0;
        }

        public function getImpressionList():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this._Str_16075())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3519.length)
                {
                    k.push(NetworkResource(this._Str_3519[_local_2]).url);
                    _local_2++;
                }
            }
            return k;
        }

        public function _Str_26162():Boolean
        {
            return this._Str_7809.length > 0;
        }

        public function set extensions(k:Array):void
        {
            if (k != null)
            {
                this._Str_7809 = k;
            }
            else
            {
                this._Str_7809 = new Array();
            }
        }

        public function get extensions():Array
        {
            return this._Str_7809;
        }

        public function setLinearAdDurationFromSeconds(k:int):void
        {
            if (this._Str_2815 != null)
            {
                this._Str_2815._Str_24711(k);
            }
        }

        public function set trackingEvents(k:Array):void
        {
            this._Str_3053 = k;
        }

        public function get trackingEvents():Array
        {
            return this._Str_3053;
        }

        public function _Str_10620(k:TrackingEvent):void
        {
            this._Str_3053.push(k);
        }

        public function addTrackingEventItems(k:Array):void
        {
            this._Str_3053 = this._Str_3053.concat(k);
        }

        public function hasTrackingEvents():Boolean
        {
            return this._Str_3053.length > 0;
        }

        public function _Str_18876():Boolean
        {
            if (this.hasLinearAd())
            {
                return this._Str_2815._Str_18876();
            }
            return false;
        }

        public function set linearVideoAd(k:LinearVideoAd):void
        {
            k.parentAdContainer = this;
            this._Str_2815 = k;
        }

        public function get linearVideoAd():LinearVideoAd
        {
            return this._Str_2815;
        }

        public function set nonLinearVideoAds(k:Array):void
        {
            var _local_2:NonLinearVideoAd;
            if (k != null)
            {
                for each (_local_2 in k)
                {
                    this._Str_19277(_local_2);
                }
            }
            this._Str_2587 = k;
        }

        public function get nonLinearVideoAds():Array
        {
            return this._Str_2587;
        }

        public function get firstNonLinearVideoAd():NonLinearVideoAd
        {
            if (this.hasNonLinearAds())
            {
                return this._Str_2587[0];
            }
            return null;
        }

        public function _Str_19277(k:NonLinearVideoAd):void
        {
            k.parentAdContainer = this;
            this._Str_2587.push(k);
        }

        public function hasNonLinearAds():Boolean
        {
            return this._Str_2587.length > 0;
        }

        public function hasLinearAd():Boolean
        {
            if (this._Str_2815 != null)
            {
                return this._Str_2815.isEmpty() == false;
            }
            return false;
        }

        public function _Str_15398():Boolean
        {
            if (this.linearVideoAd != null)
            {
                return this.linearVideoAd.isEmpty();
            }
            return true;
        }

        public function _Str_13487():Boolean
        {
            var k:Boolean;
            var _local_2:int;
            if (this.hasNonLinearAds())
            {
                k = true;
                _local_2 = 0;
                while (_local_2 < this._Str_2587.length)
                {
                    if (this._Str_2587[_local_2].isEmpty() == false)
                    {
                        k = false;
                    }
                    _local_2++;
                }
                return k;
            }
            return false;
        }

        public function set companionAds(k:Array):void
        {
            this._Str_3336 = k;
        }

        public function get companionAds():Array
        {
            return this._Str_3336;
        }

        public function _Str_24117(k:CompanionAd):void
        {
            this._Str_3336.push(k);
        }

        public function _Str_21998(k:Array):void
        {
            this._Str_3336 = this._Str_3336.concat(k);
        }

        public function hasCompanionAds():Boolean
        {
            return this._Str_3336.length > 0;
        }

        public function _Str_25895():int
        {
            if (this._Str_3336 != null)
            {
                return this._Str_3336.length;
            }
            return 0;
        }

        public function isCompanionOnlyAd():Boolean
        {
            if (this.hasCompanionAds())
            {
                return (this.hasLinearAd() == false) && (this.hasNonLinearAds() == false);
            }
            return false;
        }

        public function isEmpty():Boolean
        {
            if (this.isLinear())
            {
                return this._Str_15398();
            }
            if (this.isNonLinear())
            {
                return this._Str_13487();
            }
            if (this.isCompanionOnlyAd())
            {
            }
            return true;
        }

        public function isLinear():Boolean
        {
            return (!(this._Str_2815 == null)) && (!(this.isNonLinear()));
        }

        public function isNonLinear():Boolean
        {
            return this.hasNonLinearAds();
        }

        public function _Str_9554():Boolean
        {
            return ((!(this.isLinear())) && (!(this.isNonLinear()))) && (this.hasCompanionAds());
        }

        public function isWrapperTemplateAd():Boolean
        {
            return this.isEmpty();
        }

        public function get adType():String
        {
            if (this.isLinear())
            {
                if (this.isInteractive())
                {
                    return _Str_16569;
                }
                return LINEAR;
            }
            if (this.isNonLinear())
            {
                if (this.isInteractive())
                {
                    return _Str_16642;
                }
                return _Str_6723;
            }
            if (this._Str_9554())
            {
                return COMPANION;
            }
            return LINEAR;
        }

        public function getFlashMediaToPlay(k:Number, _arg_2:Number, _arg_3:Boolean=false):_Str_4027
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (this.isLinear())
            {
                return this._Str_2815._Str_10510(null, ["APPLICATION/X-SHOCKWAVE-FLASH", "SWF"], -1, k, _arg_2, _arg_3) as _Str_4027;
            }
            if (this.hasNonLinearAds())
            {
                if (this._Str_2587.length == 1)
                {
                    if ((this._Str_2587[0] is _Str_4713))
                    {
                        return this._Str_2587[0];
                    }
                }
                else
                {
                    _local_4 = -1;
                    _local_5 = -1;
                    _local_6 = -1;
                    _local_7 = 0;
                    while (_local_7 < this._Str_2587.length)
                    {
                        if ((this._Str_2587[_local_7] is _Str_4713))
                        {
                            if (((this._Str_2587[_local_7].width == k) && (this._Str_2587[_local_7].height == _arg_2)))
                            {
                                return this._Str_2587[_local_7];
                            }
                            _local_6 = (Math.abs((this._Str_2587[_local_7].width - k)) + Math.abs((this._Str_2587[_local_7].height - _arg_2)));
                            if (((_local_5 == -1) || (_local_6 < _local_5)))
                            {
                                _local_4 = _local_7;
                                _local_5 = _local_6;
                            }
                        }
                        _local_7++;
                    }
                    if (_local_4 > -1)
                    {
                        return this._Str_2587[_local_4];
                    }
                }
            }
            return null;
        }

        public function getStreamToPlay():AdNetworkResource
        {
            if (((this.isLinear()) || ((this.isNonLinear()) && (!(this._Str_2815 == null)))))
            {
                return this._Str_2815.getStreamToPlay(this._Str_13161(), this._Str_14891(), this._Str_15642(), this._Str_14847(), this._Str_14760(), this._Str_13087());
            }
            return null;
        }

        public function canScale():Boolean
        {
            if (this._Str_2815 != null)
            {
                return this._Str_2815.canScale(this._Str_13161(), this._Str_14891(), this._Str_15642(), this._Str_14847(), this._Str_14760(), this._Str_13087());
            }
            return false;
        }

        public function shouldMaintainAspectRatio():Boolean
        {
            if (this._Str_2815 != null)
            {
                return this._Str_2815.shouldMaintainAspectRatio(this._Str_13161(), this._Str_14891(), this._Str_15642(), this._Str_14847(), this._Str_14760(), this._Str_13087());
            }
            return false;
        }

        public function isInteractive():Boolean
        {
            if (this.isLinear())
            {
                return this._Str_2815.isInteractive(this._Str_13161(), this._Str_14891(), this._Str_15642(), this._Str_14847(), this._Str_14760(), this._Str_13087());
            }
            if (this.hasNonLinearAds())
            {
                return NonLinearVideoAd(this._Str_2587[0]).isInteractive();
            }
            return false;
        }

        public function _Str_26223(k:Array):Array
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            if (((!(k == null)) && (this.hasCompanionAds())))
            {
                _local_2 = new Array();
                _local_3 = new Array();
                _local_4 = 0;
                while (_local_4 < k.length)
                {
                    _local_5 = 0;
                    while (_local_5 < this._Str_3336.length)
                    {
                        if (_local_3.indexOf(this._Str_3336[_local_5]) == -1)
                        {
                            if (this._Str_3336[_local_5].suitableForDisplayInDIV(k[_local_4]))
                            {
                                _local_3.push({
                                    "div":k[_local_4],
                                    "companion":this._Str_3336[_local_5]
                                });
                            }
                        }
                        _local_5++;
                    }
                    _local_4++;
                }
                return _local_3;
            }
            return new Array();
        }

        protected function _triggerTrackingEvent(k:String, _arg_2:String=null):void
        {
        }

        public function triggerTrackingEvent(k:String, _arg_2:String=null):void
        {
            this._triggerTrackingEvent(k, _arg_2);
        }

        public function _Str_22830():void
        {
            this._triggerTrackingEvent(TrackingEvent.CREATIVEVIEW);
        }

        public function _Str_23204():void
        {
            this._Str_10143 = false;
        }

        public function triggerImpressionConfirmations(k:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:NetworkResource;
            if (((k) || (!(this._Str_10143))))
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3519.length)
                {
                    _local_3 = this._Str_3519[_local_2];
                    _local_3.call();
                    _local_2++;
                }
            }
            this._Str_10143 = true;
        }

        public function triggerForcedImpressionConfirmations(k:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:NetworkResource;
            if (((k) || (!(this._Str_10143))))
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3519.length)
                {
                    _local_3 = this._Str_3519[_local_2];
                    _local_3.call();
                    _local_2++;
                }
                this._Str_10143 = true;
            }
        }

        protected function _Str_25176(... k):*
        {
        }

        protected function _Str_25265(... k):*
        {
        }

        public function processStartAdEvent():void
        {
            if (this.hasNonLinearAds() == false)
            {
                this.triggerImpressionConfirmations();
            }
            this._Str_22830();
            this._triggerTrackingEvent(TrackingEvent.START);
        }

        public function processStopAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.STOP);
        }

        public function processPauseAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.PAUSE);
        }

        public function processResumeAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.RESUME);
        }

        public function processFullScreenAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.FULLSCREEN);
        }

        public function _Str_22336():void
        {
        }

        public function processMuteAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.MUTE);
        }

        public function processUnmuteAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.UNMUTE);
        }

        public function processReplayAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.REPLAY);
        }

        public function processHitMidpointAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.MIDPOINT);
        }

        public function processFirstQuartileCompleteAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.EVENT_1STQUARTILE);
        }

        public function processThirdQuartileCompleteAdEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.EVENT_3RDQUARTILE);
        }

        public function processAdCompleteEvent():void
        {
            this._triggerTrackingEvent(TrackingEvent.COMPLETE);
        }

        protected function _Str_23496():void
        {
            var k:int;
            while (k < this._Str_2587.length)
            {
                this._Str_2587[k].clearActiveDisplayRegion();
                k++;
            }
        }

        protected function _Str_19199(k:Array):int
        {
            var _local_2:int;
            while (_local_2 < this._Str_2587.length)
            {
                if (((this._Str_2587[_local_2].hasActiveDisplayRegion() == false) && (this._Str_2587[_local_2].matchesAcceptedAdTypes(k))))
                {
                    return _local_2;
                }
                _local_2++;
            }
            return -1;
        }

        public function processStartNonLinearAdEvent(k:_Str_3019):void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Boolean;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            if (k._Str_3073 != null)
            {
                if (k._Str_3073.adSlot != null)
                {
                    this._Str_23496();
                    _local_2 = k._Str_3073.adSlot.preferredDisplayMode;
                    _local_3 = 0;
                    _local_4 = 0;
                    while (_local_4 < 2)
                    {
                        if (k._Str_3073.adSlot.hasRegions(_local_2))
                        {
                            _local_5 = 0;
                            while (((_local_5 < k._Str_3073.adSlot.regions[_local_2].length) && ((AdSlot(k._Str_3073.adSlot)._Str_19603() == false) || ((AdSlot(k._Str_3073.adSlot)._Str_19603()) && (_local_3 < AdSlot(k._Str_3073.adSlot).maxDisplayCount)))))
                            {
                                if (k._Str_3073.adSlot.regions[_local_2][_local_5].enable)
                                {
                                    _local_6 = false;
                                    _local_7 = 0;
                                    if (k._Str_3073.adSlot.regions[_local_2][_local_5].hasSize())
                                    {
                                        _local_7 = 0;
                                        while (((_local_7 < this._Str_2587.length) && (!(_local_6))))
                                        {
                                            if (this._Str_2587[_local_7].hasActiveDisplayRegion() == false)
                                            {
                                                if (this._Str_2587[_local_7].matchesSizeAndAcceptedAdTypes(k._Str_3073.adSlot.regions[_local_2][_local_5].width, k._Str_3073.adSlot.regions[_local_2][_local_5].height, k._Str_3073.adSlot.regions[_local_2][_local_5].acceptedAdTypes))
                                                {
                                                    _local_6 = true;
                                                    _local_3++;
                                                    this._Str_2587[_local_7].start(k, k._Str_3073.adSlot.regions[_local_2][_local_5]);
                                                    this.triggerImpressionConfirmations();
                                                }
                                            }
                                            _local_7++;
                                        }
                                        if (!_local_6)
                                        {
                                            _local_8 = this._Str_19199(k._Str_3073.adSlot.regions[_local_2][_local_5].acceptedAdTypes);
                                            if (((_local_8 > -1) && (k._Str_3073.adSlot.regions[_local_2][_local_5].alwaysMatch)))
                                            {
                                                _local_3++;
                                                this._Str_2587[_local_8].start(k, k._Str_3073.adSlot.regions[_local_2][_local_5]);
                                                this.triggerImpressionConfirmations();
                                            }
                                        }
                                    }
                                    else
                                    {
                                        _local_9 = 0;
                                        _local_10 = -1;
                                        _local_11 = -1;
                                        _local_7 = 0;
                                        while (_local_7 < this._Str_2587.length)
                                        {
                                            if (this._Str_2587[_local_7].hasActiveDisplayRegion() == false)
                                            {
                                                _local_9 = this._Str_2587[_local_7].deriveScoreBasedOnEstimatedSizeAndAcceptedAdTypes(k.controller.playerWidth, k.controller.playerHeight, k._Str_3073.adSlot.regions[_local_2][_local_5].acceptedAdTypes);
                                                if (_local_9 >= 0)
                                                {
                                                    if (_local_9 == 0)
                                                    {
                                                        _local_11 = _local_7;
                                                        break;
                                                    }
                                                    if (((_local_11 == -1) || (_local_9 < _local_10)))
                                                    {
                                                        _local_10 = _local_9;
                                                        _local_11 = _local_7;
                                                    }
                                                }
                                            }
                                            _local_7++;
                                        }
                                        if ((((this._Str_2587.length > 0) && (_local_11 == -1)) && (k._Str_3073.adSlot.regions[_local_2][_local_5].alwaysMatch)))
                                        {
                                            _local_11 = this._Str_19199(k._Str_3073.adSlot.regions[_local_2][_local_5].acceptedAdTypes);
                                        }
                                        if (_local_11 > -1)
                                        {
                                            _local_3++;
                                            this._Str_2587[_local_11].start(k, k._Str_3073.adSlot.regions[_local_2][_local_5]);
                                            this.triggerImpressionConfirmations();
                                        }
                                    }
                                }
                                _local_5++;
                            }
                        }
                        _local_2 = ((_local_2 == "flash") ? "html5" : "flash");
                        _local_4++;
                    }
                }
                return;
            }
        }

        public function processStopNonLinearAdEvent(k:_Str_3019):void
        {
            var _local_2:int;
            while (_local_2 < this._Str_2587.length)
            {
                if (this._Str_2587[_local_2].hasActiveDisplayRegion())
                {
                    this._Str_2587[_local_2].stop(k);
                }
                _local_2++;
            }
        }

        public function processStartCompanionAdEvent(k:_Str_3019):void
        {
            var _local_2:int;
            if (k.controller.displayingCompanions())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3336.length)
                {
                    this._Str_3336[_local_2].start(k);
                    _local_2++;
                }
            }
        }

        public function processStopCompanionAdEvent(k:_Str_3019):void
        {
            var _local_2:int;
            if (k.controller.displayingCompanions())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3336.length)
                {
                    this._Str_3336[_local_2].stop(k);
                    _local_2++;
                }
            }
        }

        public function split():Array
        {
            var _local_2:VideoAd;
            var k:Array = new Array();
            if (((this.hasLinearAd()) && (this.hasNonLinearAds())))
            {
                _local_2 = new VideoAd();
                _local_2.inlineAdId = this._Str_9985;
                _local_2.adId = this._Str_7451;
                _local_2.sequenceId = this._Str_14340;
                _local_2.creativeId = this._Str_14487;
                _local_2.adSystem = this._Str_6606;
                _local_2.adTitle = this._Str_15105;
                _local_2.description = this._Str_1858;
                _local_2.survey = this._Str_10070;
                _local_2.error = this._error;
                _local_2.impressions = this._Str_3519;
                _local_2.trackingEvents = this._Str_3053;
                _local_2.companionAds = this._Str_3336;
                _local_2.extensions = this._Str_7809;
                _local_2.nonLinearVideoAds = this._Str_2587;
                this.nonLinearVideoAds = new Array();
                k.push(this);
                k.push(_local_2);
            }
            else
            {
                k.push(this);
            }
            return k;
        }

        public function _Str_23203():Object
        {
            if (this.hasLinearAd())
            {
                return this._Str_2815.toJSObject();
            }
            return "";
        }

        public function _Str_22275():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this.hasNonLinearAds())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2587.length)
                {
                    k.push(this._Str_2587[_local_2].toJSObject());
                    _local_2++;
                }
            }
            return k;
        }

        public function _Str_25761():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this.hasCompanionAds())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3336.length)
                {
                    k.push(this._Str_3336[_local_2].toJSObject());
                    _local_2++;
                }
            }
            return k;
        }

        override public function toJSObject():Object
        {
            var k:Object = new Object();
            k = {
                "id":this._id,
                "uid":_Str_2995,
                "adId":this._Str_7451,
                "inlineAdId":this._Str_9985,
                "type":this.adType,
                "adSystem":this._Str_6606,
                "adTitle":this._Str_15105,
                "description":this._Str_1858,
                "survey":this._Str_10070,
                "impressions":ArrayUtils._Str_6975(this._Str_3519),
                "trackingEvents":ArrayUtils._Str_6975(this._Str_3053),
                "linearAd":this._Str_23203(),
                "nonLinearAds":this._Str_22275(),
                "companionAds":this._Str_25761(),
                "sequenceId":this._Str_14340,
                "creativeId":this._Str_14487,
                "extensions":this._Str_7809
            }
            return k;
        }
    }
}
