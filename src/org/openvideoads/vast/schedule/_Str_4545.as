package org.openvideoads.vast.schedule
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.playlist._Str_6835;
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.vast.playlist._Str_4575;
    import org.openvideoads.vast.playlist._Str_7812;
    import org.openvideoads.vast.playlist._Str_3480;
    import org.openvideoads.util.Timestamp;

    public class _Str_4545 extends Debuggable implements _Str_6835, _Str_2741 
    {
        private var _id:String = null;
        private var _filename:String;
        private var _baseURL:String = null;
        private var _Str_22547:String = null;
        private var _duration:String = "00:00:00";
        private var _reduceLength:Boolean = false;
        private var _Str_20270:Boolean = false;
        private var _deliveryType:String = "any";
        private var _playOnce:Boolean = false;
        private var _metaData:Boolean = true;
        private var _autoPlay:Boolean = true;
        private var _provider:String = null;
        private var _player:Object;
        private var _customProperties:Object;
        private var _type:String = null;
        private var _Str_16632:_Str_2741 = null;
        private var _Str_20259:Boolean = false;
        private var _startTime:String = "00:00:00";
        private var _fireTrackingEvents:Boolean = false;

        public function _Str_4545(k:String, _arg_2:String, _arg_3:String, _arg_4:Boolean=false, _arg_5:String="any", _arg_6:Boolean=false, _arg_7:Boolean=true, _arg_8:Boolean=true, _arg_9:String=null, _arg_10:Object=null, _arg_11:Object=null, _arg_12:String=null, _arg_13:String=null, _arg_14:Boolean=false)
        {
            this._player = new Object();
            this._customProperties = new Object();
            super();
            this._id = k;
            if (_arg_2 != null)
            {
                if (_arg_2.indexOf("(live)") > -1)
                {
                    this._filename = _arg_2.substr((_arg_2.lastIndexOf("(live)") + 6));
                    this._Str_20270 = true;
                }
                else
                {
                    this._filename = _arg_2;
                }
            }
            this.duration = _arg_3;
            this._reduceLength = _arg_4;
            this._deliveryType = _arg_5;
            this._playOnce = _arg_6;
            this._metaData = _arg_7;
            this._autoPlay = _arg_8;
            this._provider = _arg_9;
            if (_arg_10 != null)
            {
                this._player = _arg_10;
            }
            if (_arg_11 != null)
            {
                this._customProperties = _arg_11;
            }
            this.type = _arg_12;
            if (_arg_13 != null)
            {
                this._startTime = _arg_13;
            }
            else
            {
                this._startTime = "00:00:00";
            }
            this._fireTrackingEvents = _arg_14;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get player():Object
        {
            return this._player;
        }

        public function set provider(k:String):void
        {
            this._provider = k;
        }

        public function get provider():String
        {
            return this._provider;
        }

        public function set fireTrackingEvents(k:Boolean):void
        {
            this._fireTrackingEvents = k;
        }

        public function get fireTrackingEvents():Boolean
        {
            return this._fireTrackingEvents;
        }

        public function set autoPlay(k:Boolean):void
        {
            this._autoPlay = k;
        }

        public function get autoPlay():Boolean
        {
            return this._autoPlay;
        }

        public function set deliveryType(k:String):void
        {
            this._deliveryType = k;
        }

        public function get deliveryType():String
        {
            return this._deliveryType;
        }

        public function set metaData(k:Boolean):void
        {
            this._metaData = k;
        }

        public function get metaData():Boolean
        {
            return this._metaData;
        }

        public function set customProperties(k:Object):void
        {
            this._customProperties = k;
        }

        public function get customProperties():Object
        {
            return this._customProperties;
        }

        public function set filename(k:String):void
        {
            this._filename = k;
        }

        public function get filename():String
        {
            return this._filename;
        }

        public function get baseURL():String
        {
            return this._baseURL;
        }

        public function set baseURL(k:String):void
        {
            this._baseURL = k;
        }

        public function hasBaseURL():Boolean
        {
            return !(this._baseURL == null);
        }

        public function _Str_24069():Boolean
        {
            if (this._type != null)
            {
                return this._type.toUpperCase() == "SMIL";
            }
            return false;
        }

        public function resolveFilename(k:_Str_2741):void
        {
            var _local_2:_Str_4575;
            this._Str_16632 = k;
            if (this._Str_24069())
            {
                _local_2 = _Str_7812._Str_19936(_Str_7812.getType(this._type.toUpperCase()));
                _local_2._Str_16925(this._filename, this);
            }
            else
            {
                this.onOVAConfigLoaded();
            }
        }

        public function isOVAConfigLoading():Boolean
        {
            return !(this._type == null);
        }

        public function onOVAConfigLoaded():void
        {
            if (this._type == null)
            {
                if (this._Str_16632 != null)
                {
                    this._Str_16632.onOVAConfigLoaded();
                }
            }
        }

        public function _Str_16701(k:_Str_4575):void
        {
            var _local_2:_Str_3480;
            if (k.length > 0)
            {
                _local_2 = k._Str_11606(0);
                this._type = null;
                this._Str_22547 = this._filename;
                this._Str_20259 = true;
                if (_local_2.isRTMP())
                {
                    this._filename = _local_2.filename;
                    this._baseURL = _local_2.url;
                }
                else
                {
                    this._filename = _local_2.getQualifiedStreamAddress();
                }
                this._id = this._filename;
            }
            this.onOVAConfigLoaded();
        }

        public function get file():String
        {
            return this.filename;
        }

        public function _Str_26216():Boolean
        {
            return this._Str_20259;
        }

        public function set type(k:String):void
        {
            this._type = k;
        }

        public function get type():String
        {
            return this._type;
        }

        public function isStream():Boolean
        {
            var k:RegExp;
            if (this._filename != null)
            {
                k = new RegExp("(?i).*\\.(jpg|png|gif|bmp)");
                return this._filename.match(k) == null;
            }
            return true;
        }

        public function set duration(k:String):void
        {
            if (Timestamp.validate(k))
            {
                this._duration = k;
            }
            else
            {
                this._duration = Timestamp._Str_16820(k);
            }
        }

        public function get duration():String
        {
            return this._duration;
        }

        public function hasDuration():Boolean
        {
            return (!(this._duration == null)) && (this.getDurationAsInt() > 0);
        }

        public function getDurationAsInt():int
        {
            return Timestamp.timestampToSeconds(this.duration);
        }

        public function set reduceLength(k:Boolean):void
        {
            this._reduceLength = k;
        }

        public function get reduceLength():Boolean
        {
            return this._reduceLength;
        }

        public function set startTime(k:String):void
        {
            if (k != null)
            {
                if (k.indexOf(":") == 2)
                {
                    this._startTime = k;
                }
                else
                {
                    this._startTime = Timestamp._Str_4110(int(k));
                }
            }
        }

        public function get startTime():String
        {
            return this._startTime;
        }

        public function isLive():Boolean
        {
            return this._Str_20270;
        }

        public function set playOnce(k:Boolean):void
        {
            this._playOnce = k;
        }

        public function get playOnce():Boolean
        {
            return this._playOnce;
        }
    }
}
