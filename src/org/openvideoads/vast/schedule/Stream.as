package org.openvideoads.vast.schedule
{
    import org.openvideoads.base._Str_4989;
    import org.openvideoads.vast.tracking.TrackingTable;
    import org.openvideoads.vast.VASTController;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.playlist._Str_3480;
    import org.openvideoads.vast.config.Config;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.vast.tracking._Str_2460;
    import org.openvideoads.vast.tracking._Str_4278;

    public class Stream extends _Str_4989 
    {
        public const _Str_24267:String = "video/x-flv";
        public const _Str_24815:String = "video/x-mp4";
        public const _Str_26086:String = "streaming";
        public const _Str_26113:String = "progressive";

        protected var _id:String = null;
        protected var _Str_2987:int;
        protected var _Str_14603:String;
        protected var _Str_990:String = "00:00:00";
        protected var _Str_17895:int = 0;
        protected var _Str_10178:String = null;
        protected var _Str_2467:String = null;
        protected var _Str_8087:Boolean = false;
        protected var _Str_4718:String = "any";
        protected var _Str_2230:String = null;
        protected var _Str_4980:* = -1;
        protected var _width:int = -1;
        protected var _height:int = -1;
        protected var _Str_8898:Boolean = false;
        protected var _Str_2846:String = null;
        protected var _Str_3649:TrackingTable = null;
        protected var _parent:StreamSequence = null;
        protected var _Str_2335:VASTController = null;
        protected var _Str_4101:String = "streaming";
        protected var _Str_4538:Boolean = false;
        protected var _Str_3744:Boolean = true;
        protected var _Str_3869:Boolean = true;
        protected var _Str_4904:String = null;
        protected var _Str_4797:Object;
        protected var _Str_2466:String = null;
        protected var _index:int = -1;
        protected var _Str_7240:int = 0;
        protected var _Str_8737:int = 0;
        protected var _Str_20639:Boolean = false;
        protected var _Str_2495:String = null;
        protected var _Str_3753:Object = null;
        protected var _Str_6195:Boolean = false;
        protected var _Str_18584:Boolean = false;
        protected var _Str_17968:Boolean = false;
        protected var _Str_12564:AdSlot = null;
        protected var _Str_19898:_Str_3480 = null;
        protected var _Str_19364:Boolean = false;

        public function Stream(k:StreamSequence, _arg_2:VASTController, _arg_3:int=0, _arg_4:String=null, _arg_5:String=null, _arg_6:String="00:00:00", _arg_7:String=null, _arg_8:String=null, _arg_9:Boolean=false, _arg_10:String=null, _arg_11:String="any", _arg_12:String="streaming", _arg_13:*=-1, _arg_14:Boolean=false, _arg_15:Boolean=true, _arg_16:Boolean=true, _arg_17:String=null, _arg_18:Object=null, _arg_19:String=null, _arg_20:int=0, _arg_21:Boolean=false, _arg_22:Object=null, _arg_23:Boolean=false, _arg_24:Boolean=false, _arg_25:AdSlot=null)
        {
            this._Str_4797 = new Object();
            super();
            this._parent = k;
            this._Str_2335 = _arg_2;
            this._Str_2987 = _arg_3;
            this._Str_3649 = new TrackingTable(_arg_4, _arg_3, _arg_20);
            this._id = _arg_4;
            this._Str_14603 = _arg_5;
            this.startTime = _arg_6;
            this._Str_2467 = _arg_7;
            this._Str_10178 = _arg_8;
            this._Str_8087 = _arg_9;
            this._Str_4718 = _arg_11;
            this._Str_4980 = _arg_13;
            this._Str_19161();
            this._Str_2846 = _arg_10;
            this._Str_4101 = _arg_12;
            this._Str_4538 = _arg_14;
            this._Str_3744 = _arg_15;
            this._Str_3869 = _arg_16;
            this._Str_4904 = _arg_17;
            this._Str_12564 = _arg_25;
            if (_arg_18 != null)
            {
                this._Str_4797 = _arg_18;
            }
            if (_arg_22 != null)
            {
                this._Str_3753 = _arg_22;
            }
            this._Str_2466 = _arg_19;
            this._Str_8737 = _arg_20;
            this._Str_20639 = _arg_21;
            this._Str_6195 = _arg_23;
            this._Str_17968 = _arg_24;
        }

        public function unload():void
        {
        }

        public function set key(k:int):void
        {
            this._Str_2987 = k;
        }

        public function get key():int
        {
            return this._Str_2987;
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set _Str_26434(k:Boolean):void
        {
            this._Str_19364 = k;
        }

        public function get _Str_26303():Boolean
        {
            return this._Str_19364;
        }

        public function set title(k:String):void
        {
            this._Str_2495 = k;
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function get config():Config
        {
            if (this._Str_2335 != null)
            {
                return this._Str_2335.config;
            }
            return new Config();
        }

        public function set hasOffsetStartTime(k:Boolean):void
        {
            this._Str_17968 = k;
        }

        public function get hasOffsetStartTime():Boolean
        {
            return this._Str_17968;
        }

        public function isSlice():Boolean
        {
            return this._Str_20639;
        }

        public function set originatingStreamIndex(k:int):void
        {
            this._Str_8737 = k;
        }

        public function get originatingStreamIndex():int
        {
            return this._Str_8737;
        }

        public function set associatedStreamIndex(k:int):void
        {
            this._Str_7240 = k;
        }

        public function get associatedStreamIndex():int
        {
            return this._Str_7240;
        }

        public function set _Str_17460(k:Boolean):void
        {
            this._Str_18584 = k;
        }

        public function get _Str_17460():Boolean
        {
            return this._Str_18584;
        }

        public function _Str_25920():Boolean
        {
            return this._Str_18584;
        }

        public function set index(k:int):void
        {
            this._index = k;
        }

        public function get index():int
        {
            return this._index;
        }

        public function _Str_26140():Boolean
        {
            return !(this._Str_12564 == null);
        }

        public function set _Str_21235(k:AdSlot):void
        {
            this._Str_12564 = k;
        }

        public function get _Str_21235():AdSlot
        {
            return this._Str_12564;
        }

        public function set provider(k:String):void
        {
            this._Str_4904 = k;
        }

        public function get provider():String
        {
            return this._Str_4904;
        }

        public function get _Str_4565():Object
        {
            return this._Str_4797;
        }

        public function set previewImage(k:String):void
        {
            this._Str_2466 = k;
        }

        public function get previewImage():String
        {
            return this._Str_2466;
        }

        public function set autoPlay(k:Boolean):void
        {
            this._Str_3869 = k;
        }

        public function get autoPlay():Boolean
        {
            return this._Str_3869;
        }

        public function get _Str_25927():String
        {
            return "";
        }

        public function isInteractive():Boolean
        {
            return false;
        }

        public function get playOnce():Boolean
        {
            return this._Str_4538;
        }

        public function set deliveryType(k:String):void
        {
            this._Str_4101 = k;
        }

        public function get deliveryType():String
        {
            return this._Str_4101;
        }

        public function get metaData():Boolean
        {
            return this._Str_3744;
        }

        public function set bitrate(k:*):void
        {
            this._Str_4980 = k;
        }

        public function get bitrate():*
        {
            return this._Str_4980;
        }

        public function set width(k:int):void
        {
            this._width = k;
        }

        public function get width():int
        {
            return this._width;
        }

        public function set height(k:int):void
        {
            this._height = k;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get fireTrackingEvents():Boolean
        {
            return this._Str_6195;
        }

        public function _Str_24709():Boolean
        {
            return !(this._Str_3753 == null);
        }

        public function _Str_26369(k:String):Boolean
        {
            if (this._Str_24709())
            {
                return this._Str_3753.hasOwnProperty(k);
            }
            return false;
        }

        public function set customProperties(k:Object):void
        {
            this._Str_3753 = k;
        }

        public function get customProperties():Object
        {
            return this._Str_3753;
        }

        public function getQualifiedStreamAddress():String
        {
            var k:NetworkResource = this.getStreamToPlay();
            return k.getQualifiedStreamAddress(this._Str_2846);
        }

        public function set parent(k:StreamSequence):void
        {
            this._parent = k;
        }

        public function get parent():StreamSequence
        {
            return this._parent;
        }

        public function set streamID(k:String):void
        {
            this._Str_14603 = k;
        }

        public function get streamID():String
        {
            return this._Str_14603;
        }

        public function set streamType(k:String):void
        {
            this._Str_4718 = k;
            this._Str_19161();
        }

        public function get streamType():String
        {
            return this._Str_4718;
        }

        public function set _Str_21333(k:_Str_3480):void
        {
            this._Str_19898 = k;
        }

        public function get _Str_21333():_Str_3480
        {
            return this._Str_19898;
        }

        public function _Str_23330():Boolean
        {
            var _local_2:RegExp;
            var k:String = this.streamName;
            if (k != null)
            {
                _local_2 = new RegExp("(?i).*\\.(jpg|png|gif|bmp)");
                return !(k.match(_local_2) == null);
            }
            return false;
        }

        public function _Str_26375():Boolean
        {
            return !(StringUtils.isEmpty(this.streamName));
        }

        public function isLoaded():Boolean
        {
            return true;
        }

        public function isStream():Boolean
        {
            var k:String;
            var _local_2:RegExp;
            if (this.streamName != null)
            {
                if (this.streamName.indexOf("?") > 0)
                {
                    k = this.streamName.substr(0, this.streamName.indexOf("?"));
                }
                else
                {
                    k = this.streamName;
                }
                _local_2 = new RegExp("(?i).*\\.(mp4|flv|wmv|mp3|3g2|3gp|aac|f4b|f4p|f4v|m4a|m4v|mov|sdp)$");
                return !(k.match(_local_2) == null);
            }
            return true;
        }

        public function _Str_26312(k:String):Boolean
        {
            if (this._id != null)
            {
                return StringUtils._Str_4861(this._id, k);
            }
            return false;
        }

        public function _Str_26347(k:String):Boolean
        {
            return StringUtils._Str_4861(this.streamName, k);
        }

        public function _Str_26021(k:String):String
        {
            if (this.streamName != null)
            {
                if (this.streamName.length > k.length)
                {
                    return this.streamName.substr(k.length);
                }
            }
            return null;
        }

        private function _Str_19161():void
        {
            if (this._Str_4718.toUpperCase() == "MP4")
            {
                this._Str_2230 = this._Str_24815;
            }
            else
            {
                if (this._Str_4718.toUpperCase() == "FLV")
                {
                    this._Str_2230 = this._Str_24267;
                }
                else
                {
                    this._Str_2230 = null;
                }
            }
        }

        public function get mimeType():String
        {
            return this._Str_2230;
        }

        public function set startTime(k:String):void
        {
            this._Str_990 = k;
            this._Str_17895 = this.getStartTimeAsSeconds();
        }

        public function get startTime():String
        {
            return this._Str_990;
        }

        public function getStartTimeAsSeconds():int
        {
            if (this._Str_990 != null)
            {
                if (Timestamp.validate(this._Str_990))
                {
                    return Timestamp.timestampToSeconds(this._Str_990);
                }
                return parseInt(this._Str_990);
            }
            return 0;
        }

        public function _Str_26266():String
        {
            return new String(this.getStartTimeAsSeconds());
        }

        public function set streamStartTime(k:int):void
        {
            this._Str_17895 = k;
        }

        public function get streamStartTime():int
        {
            return this._Str_17895;
        }

        public function hasDuration():Boolean
        {
            if (this.duration != null)
            {
                return (!(this.duration == "00:00:00")) && (!(this.duration == "0"));
            }
            return false;
        }

        public function _Str_22487():Boolean
        {
            if (this.duration != null)
            {
                return this.getDurationAsInt() > 0;
            }
            return false;
        }

        public function _Str_20238():Boolean
        {
            return !(this._Str_22487());
        }

        public function isSlicedStream():Boolean
        {
            return this.isSlice();
        }

        public function _Str_23955():Boolean
        {
            var k:int = this.getStartTimeAsSeconds();
            return (k == 0) || ((k > 0) && (this.hasOffsetStartTime));
        }

        public function set _Str_19355(k:String):void
        {
            this._Str_10178 = k;
        }

        public function get _Str_19355():String
        {
            return this._Str_10178;
        }

        public function _Str_21832():int
        {
            return parseInt(this._Str_10178);
        }

        public function set duration(k:*):void
        {
            var _local_2:String = ((k is String) ? k : ((k is Number) ? k.toString() : "0"));
            this._Str_2467 = _local_2;
            this._Str_8898 = false;
            this.declareTrackingPoints(0, true);
        }

        public function get duration():String
        {
            return (this._Str_2467 == null) ? "0" : this._Str_2467;
        }

        public function getDurationAsInt():int
        {
            return parseInt(this.duration);
        }

        public function _Str_24960():String
        {
            return Timestamp._Str_4110(parseInt(this._Str_2467));
        }

        public function set reduceLength(k:Boolean):void
        {
            this._Str_8087 = k;
        }

        public function get reduceLength():Boolean
        {
            return this._Str_8087;
        }

        public function isRTMP():Boolean
        {
            var _local_2:NetworkResource;
            var k:NetworkResource = this.getStreamToPlay();
            if (k != null)
            {
                if (k._Str_11386())
                {
                    return k.isRTMP();
                }
                if (this.hasBaseURL())
                {
                    _local_2 = new NetworkResource(null, this.baseURL);
                    return _local_2.isRTMP();
                }
            }
            return false;
        }

        public function getStreamToPlay():NetworkResource
        {
            return new NetworkResource(null, this._Str_14603);
        }

        protected function _Str_22449(k:String):String
        {
            var _local_2:String = StringUtils.trim(k);
            if (_local_2.lastIndexOf("/") == (_local_2.length - 1))
            {
                return _local_2;
            }
            return _local_2 + "/";
        }

        public function get url():String
        {
            var k:NetworkResource = this.getStreamToPlay();
            if (k != null)
            {
                if (k._Str_11386())
                {
                    return k.url;
                }
                if (this.hasBaseURL())
                {
                    return this._Str_22449(this._Str_2846) + this._Str_21497(k.url);
                }
                return k.url;
            }
            return null;
        }

        public function set baseURL(k:String):void
        {
            this._Str_2846 = k;
        }

        public function get baseURL():String
        {
            var k:NetworkResource = this.getStreamToPlay();
            if (k != null)
            {
                if (k._Str_11386())
                {
                    return k.netConnectionAddress;
                }
                if (this.hasBaseURL())
                {
                    return this._Str_2846;
                }
            }
            return null;
        }

        public function hasBaseURL():Boolean
        {
            return !(this._Str_2846 == null);
        }

        public function _Str_26214():Boolean
        {
            var k:String = this.streamName;
            if (k != null)
            {
                return StringUtils._Str_22149(k, ".smil");
            }
            return false;
        }

        public function isLinear():Boolean
        {
            return true;
        }

        public function canScale():Boolean
        {
            return false;
        }

        public function shouldMaintainAspectRatio():Boolean
        {
            return false;
        }

        protected function _Str_21497(k:String):String
        {
            if (k != null)
            {
                if (k.indexOf("mp4:") >= 0)
                {
                    return k.substr((k.indexOf("mp4:") + 4));
                }
                if (k.indexOf("flv:") >= 0)
                {
                    return k.substr((k.indexOf("flv:") + 4));
                }
                return k;
            }
            return null;
        }

        public function get streamName():String
        {
            var k:NetworkResource = this.getStreamToPlay();
            return this.cleanseStreamName(k._Str_5059((this.streamType + ":")));
        }

        public function get _Str_24252():String
        {
            return this._Str_21497(this.streamName);
        }

        protected function cleanseStreamName(k:String):String
        {
            var _local_2:RegExp;
            if (k != null)
            {
                if (((!(k.indexOf("mp4:") == 0)) || (!(k.indexOf("flv:") == 0))))
                {
                    if (k.indexOf("mp4:") > 0)
                    {
                        k = k.substr(k.indexOf("mp4:"));
                    }
                    else
                    {
                        if (k.indexOf("flv:") > 0)
                        {
                            k = k.substr(k.indexOf("flv:"));
                        }
                    }
                }
                if (k.indexOf("flv:") > -1)
                {
                    _local_2 = /flv:/g;
                    return k.replace(_local_2, "");
                }
                return k;
            }
            return null;
        }

        protected function _Str_18576():void
        {
            this._Str_8898 = true;
        }

        public function _Str_21236():void
        {
            this._Str_8898 = false;
        }

        protected function clearTrackingTable(k:Boolean=false):void
        {
            this._Str_3649 = new TrackingTable(this.id, this.key, this.originatingStreamIndex);
        }

        public function _Str_2606(k:_Str_2460, _arg_2:Boolean=false, _arg_3:Boolean=true, _arg_4:Boolean=false):void
        {
            if (((_arg_2) || (this._Str_8898 == false)))
            {
                this._Str_3649._Str_24378(k, _arg_4);
                if (_arg_3)
                {
                    if (this._Str_2335 != null)
                    {
                        this._Str_2335._Str_23658(k);
                    }
                }
            }
        }

        public function declareTrackingPoints(k:int=0, _arg_2:Boolean=false):void
        {
            var _local_3:int;
            if (this._Str_8898 == false)
            {
                this.clearTrackingTable(_arg_2);
                _local_3 = 1000;
                if (this.getDurationAsInt() > 0)
                {
                    this._Str_2606(new _Str_2460(((k * _local_3) + this._Str_2335.startStreamSafetyMargin), "BS"));
                    if (((!(this._Str_2335._Str_17402)) && (this.isSlicedStream())))
                    {
                        this._Str_2606(new _Str_2460((((k + this._Str_21832()) * _local_3) - this._Str_2335.endStreamSafetyMargin), "ES"));
                    }
                    else
                    {
                        this._Str_2606(new _Str_2460((((k + this.getDurationAsInt()) * _local_3) - this._Str_2335.endStreamSafetyMargin), "ES"));
                    }
                }
                this._Str_18576();
            }
        }

        public function _Str_22706():TrackingTable
        {
            return this._Str_3649;
        }

        public function resetAllTrackingPoints():void
        {
            if (this._Str_3649 != null)
            {
                this._Str_3649.resetAllTrackingPoints();
            }
        }

        public function resetRepeatableTrackingPoints():void
        {
            if (this._Str_3649 != null)
            {
                this._Str_3649.resetRepeatableTrackingPoints();
            }
        }

        public function processTimeEvent(k:_Str_4278, _arg_2:Boolean=true, _arg_3:Boolean=false):void
        {
            var _local_6:_Str_2460;
            var _local_4:Array = this._Str_3649.activeTrackingPoints(k, _arg_2);
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = _local_4[_local_5];
                if (_local_6 != null)
                {
                    switch (_local_6.label)
                    {
                        case "BS":
                            this.processStartStream();
                            this._Str_2335.onProcessTrackingPoint(_local_6);
                            break;
                        case "ES":
                            this.processStreamComplete();
                            this._Str_2335.onProcessTrackingPoint(_local_6);
                            break;
                    }
                }
                _local_5++;
            }
        }

        public function processStartStream():void
        {
        }

        public function processStopStream():void
        {
        }

        public function processStreamComplete():void
        {
        }

        public function processPauseStream():void
        {
        }

        public function processResumeStream():void
        {
        }

        public function processFullScreenEvent():void
        {
        }

        public function processFullScreenExitEvent():void
        {
        }

        public function processMuteEvent():void
        {
        }

        public function processUnmuteEvent():void
        {
        }

        protected function _Str_19894():void
        {
            if (this._Str_2335 != null)
            {
                this._Str_2335._Str_20056(true);
            }
        }

        protected function _Str_21885():void
        {
            if (this._Str_2335 != null)
            {
                this._Str_2335._Str_20056(false);
            }
        }

        public function toShortString():String
        {
            return (((((("streamName: " + this.streamName) + ", baseURL: ") + this.baseURL) + ", duration: ") + this.duration) + ", startTime: ") + this.startTime;
        }

        public function toString():String
        {
            return (((((((((((((((((((((((((((((((((((("key: " + this.key) + ", id: ") + this.id) + ", originatingStreamIndex: ") + this.originatingStreamIndex) + ", baseURL: ") + this.baseURL) + ", streamName: ") + this.streamName) + ", startTime: ") + this.startTime) + ", duration: ") + this.duration) + ", originalDuration: ") + this._Str_19355) + ", reduceLength: ") + this.reduceLength) + ", hasOffsetStartTime: ") + this.hasOffsetStartTime) + ", isSlice: ") + this.isSlice()) + ", streamType: ") + this.streamType) + ", bitrate: ") + this.bitrate) + ", mimeType: ") + this.mimeType) + ", deliveryType: ") + this.deliveryType) + ", playOnce: ") + this.playOnce) + ", metaData: ") + this.metaData) + ", previewImage: ") + this.previewImage) + ", fireTrackingEvents: ") + this.fireTrackingEvents;
        }
    }
}
