package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.vast.config._Str_2741;

    public class AbstractStreamsConfig extends _Str_3389 
    {
        protected static var _Str_14458:String = null;
        protected static var _Str_15475:String = "any";
        protected static var _Str_12597:String = "any";
        protected static var _Str_20481:String = "any";
        protected static var _Str_12719:Boolean = false;
        protected static var _Str_14327:Boolean = false;
        protected static var _Str_15650:Boolean = false;

        protected var _Str_2846:String;
        protected var _Str_4718:String;
        protected var _Str_4101:String;
        protected var _Str_10343:Boolean;
        protected var _Str_11903:Boolean;
        protected var _Str_20248:Boolean = true;
        protected var _Str_4538:Boolean;
        protected var _Str_3744:Boolean = true;
        protected var _Str_3869:Boolean = false;
        protected var _Str_6195:Boolean = false;
        protected var _Str_25937:Boolean = false;
        protected var _Str_21723:Boolean = false;
        protected var _Str_4797:Object;
        protected var _Str_3337:ProvidersConfigGroup = null;
        protected var _Str_6569:Boolean = false;
        protected var _Str_4980:* = -1;
        protected var _width:int = -1;
        protected var _height:int = -1;
        protected var _Str_20878:Boolean = false;
        protected var _Str_15662:Boolean = false;
        protected var _Str_13104:Boolean = false;

        public function AbstractStreamsConfig(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_2846 = _Str_14458;
            this._Str_4718 = _Str_15475;
            this._Str_4101 = _Str_12597;
            this._Str_10343 = _Str_12719;
            this._Str_11903 = _Str_14327;
            this._Str_4538 = _Str_15650;
            this._Str_4797 = new Object();
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            var _local_4:String;
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.baseURL != undefined)
                {
                    this.baseURL = k.baseURL;
                }
                if (k.streamType != undefined)
                {
                    this.streamType = k.streamType;
                }
                if (k.metaData != undefined)
                {
                    if ((k.metaData is String))
                    {
                        this.metaData = ((k.metaData.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.metaData = k.metaData;
                    }
                }
                if (k.setDurationFromMetaData != undefined)
                {
                    if ((k.setDurationFromMetaData is String))
                    {
                        this._Str_6569 = ((k.setDurationFromMetaData.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this._Str_6569 = k.setDurationFromMetaData;
                    }
                }
                if (k.delayAdRequestUntilPlay != undefined)
                {
                    if ((k.delayAdRequestUntilPlay is String))
                    {
                        this._Str_15662 = ((k.delayAdRequestUntilPlay.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this._Str_15662 = k.delayAdRequestUntilPlay;
                    }
                }
                if (k.enableProxies != undefined)
                {
                    if ((k.enableProxies is String))
                    {
                        this._Str_13104 = ((k.enableProxies.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this._Str_13104 = k.enableProxies;
                    }
                }
                if (k.stripFileExtensions != undefined)
                {
                    if ((k.stripFileExtensions is String))
                    {
                        this.stripFileExtensions = ((k.stripFileExtensions.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.stripFileExtensions = k.stripFileExtensions;
                    }
                }
                if (k.bitrate != undefined)
                {
                    if ((k.bitrate is String))
                    {
                        _local_4 = k.bitrate.toUpperCase();
                        if ((((_local_4 == "LOW") || (_local_4 == "MEDIUM")) || (_local_4 == "HIGH")))
                        {
                            this.bitrate = _local_4;
                        }
                        else
                        {
                            this.bitrate = k.bitrate;
                        }
                    }
                    else
                    {
                        this.bitrate = k.bitrate;
                    }
                }
                if (k.width != undefined)
                {
                    if ((k.width is String))
                    {
                        this.width = int(k.width);
                    }
                    else
                    {
                        this.width = k.width;
                    }
                }
                if (k.height != undefined)
                {
                    if ((k.height is String))
                    {
                        this.height = int(k.height);
                    }
                    else
                    {
                        this.height = k.height;
                    }
                }
                if (k.subscribe != undefined)
                {
                    if ((k.subscribe is String))
                    {
                        this.subscribe = ((k.subscribe.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.subscribe = k.subscribe;
                    }
                }
                if (k.fireTrackingEvents != undefined)
                {
                    if ((k.fireTrackingEvents is String))
                    {
                        this.fireTrackingEvents = ((k.fireTrackingEvents.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.fireTrackingEvents = k.fireTrackingEvents;
                    }
                }
                if (k.turnOnCountdownTimer != undefined)
                {
                    if ((k.turnOnCountdownTimer is String))
                    {
                        this.turnOnCountdownTimer = ((k.turnOnCountdownTimer.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.turnOnCountdownTimer = k.turnOnCountdownTimer;
                    }
                }
                if (k.deliveryType != undefined)
                {
                    this.deliveryType = k.deliveryType;
                }
                if (k.providers != undefined)
                {
                    this.providers = k.providers;
                }
                if (k.allowPlaylistControl != undefined)
                {
                    if ((k.allowPlaylistControl is String))
                    {
                        this.allowPlaylistControl = ((k.allowPlaylistControl.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.allowPlaylistControl = k.allowPlaylistControl;
                    }
                }
                if (k.clearPlaylist != undefined)
                {
                    if ((k.clearPlaylist is String))
                    {
                        this.clearPlaylist = ((k.clearPlaylist.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.clearPlaylist = k.clearPlaylist;
                    }
                }
                if (k.autoPlay != undefined)
                {
                    if ((k.autoPlay is String))
                    {
                        this.autoPlay = ((k.autoPlay.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.autoPlay = k.autoPlay;
                    }
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
                if (k.player != undefined)
                {
                    this.player = k.player;
                }
            }
        }

        public function set setDurationFromMetaData(k:Boolean):void
        {
            this._Str_6569 = k;
        }

        public function get setDurationFromMetaData():Boolean
        {
            return this._Str_6569;
        }

        public function set delayAdRequestUntilPlay(k:Boolean):void
        {
            this._Str_15662 = k;
        }

        public function get delayAdRequestUntilPlay():Boolean
        {
            return this._Str_15662;
        }

        public function set enableProxies(k:Boolean):void
        {
            this._Str_13104 = k;
        }

        public function get enableProxies():Boolean
        {
            return this._Str_13104;
        }

        public function mustOperateWithoutDuration():Boolean
        {
            return this._Str_6569;
        }

        public function hasProviders():Boolean
        {
            return !(this._Str_3337 == null);
        }

        public function setDefaultProviders():void
        {
            this._Str_3337 = new ProvidersConfigGroup();
        }

        public function set providers(k:Object):void
        {
            if (k != null)
            {
                if (k.http != undefined)
                {
                    this.httpProvider = k.http;
                }
                if (k.rtmp != undefined)
                {
                    this.rtmpProvider = k.rtmp;
                }
                this._Str_4721 = new ProvidersConfigGroup(k);
            }
        }

        public function set _Str_4721(k:ProvidersConfigGroup):void
        {
            this._Str_3337 = k;
        }

        public function get _Str_4721():ProvidersConfigGroup
        {
            if (this._Str_3337 == null)
            {
                this._Str_3337 = new ProvidersConfigGroup();
            }
            return this._Str_3337;
        }

        public function getProvider(k:String):String
        {
            return this._Str_4721.getProvider(k);
        }

        public function set rtmpProvider(k:String):void
        {
            this._Str_4721.rtmpProvider = k;
        }

        public function get rtmpProvider():String
        {
            return this._Str_4721.rtmpProvider;
        }

        public function set httpProvider(k:String):void
        {
            this._Str_4721.httpProvider = k;
        }

        public function get httpProvider():String
        {
            return this._Str_4721.httpProvider;
        }

        public function set turnOnCountdownTimer(k:Boolean):void
        {
            this._Str_20878 = k;
        }

        public function get turnOnCountdownTimer():Boolean
        {
            return this._Str_20878;
        }

        public function set player(k:Object):void
        {
            this._Str_4797 = k;
        }

        public function get player():Object
        {
            return this._Str_4797;
        }

        public function set stripFileExtensions(k:Boolean):void
        {
            this._Str_21723 = k;
        }

        public function get stripFileExtensions():Boolean
        {
            return this._Str_21723;
        }

        public function set metaData(k:Boolean):void
        {
            this._Str_3744 = k;
        }

        public function get metaData():Boolean
        {
            return this._Str_3744;
        }

        public function set fireTrackingEvents(k:Boolean):void
        {
            this._Str_6195 = k;
        }

        public function get fireTrackingEvents():Boolean
        {
            return this._Str_6195;
        }

        public function set allowPlaylistControl(k:Boolean):void
        {
            this._Str_11903 = k;
        }

        public function get allowPlaylistControl():Boolean
        {
            return this._Str_11903;
        }

        public function set clearPlaylist(k:Boolean):void
        {
            this._Str_20248 = k;
        }

        public function get clearPlaylist():Boolean
        {
            return this._Str_20248;
        }

        public function _Str_23304():Boolean
        {
            return !(this._Str_11903 == _Str_14327);
        }

        public function set playOnce(k:Boolean):void
        {
            this._Str_4538 = k;
        }

        public function get playOnce():Boolean
        {
            return this._Str_4538;
        }

        public function set autoPlay(k:Boolean):void
        {
            this._Str_3869 = k;
        }

        public function get autoPlay():Boolean
        {
            return this._Str_3869;
        }

        public function _Str_22516():Boolean
        {
            return !(this._Str_4538 == _Str_15650);
        }

        public function set deliveryType(k:String):void
        {
            this._Str_4101 = k;
        }

        public function get deliveryType():String
        {
            return this._Str_4101;
        }

        public function _Str_19939():Boolean
        {
            return !(this._Str_4101 == _Str_12597);
        }

        public function get baseURL():String
        {
            return this._Str_2846;
        }

        public function set baseURL(k:String):void
        {
            this._Str_2846 = k;
        }

        public function _Str_20891():Boolean
        {
            return !(this._Str_2846 == _Str_14458);
        }

        public function set streamType(k:String):void
        {
            this._Str_4718 = k;
        }

        public function get streamType():String
        {
            return this._Str_4718;
        }

        public function _Str_21706():Boolean
        {
            return !(this._Str_4718 == _Str_15475);
        }

        public function set subscribe(k:Boolean):void
        {
            this._Str_10343 = k;
        }

        public function get subscribe():Boolean
        {
            return this._Str_10343;
        }

        public function _Str_21260():Boolean
        {
            return !(this._Str_10343 == _Str_12719);
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

        public function _Str_21448():Boolean
        {
            if ((this._Str_4980 is String))
            {
                return true;
            }
            return Number(this._Str_4980) > -1;
        }
    }
}
