package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.util.ArrayUtils;
    import org.openvideoads.vast.schedule._Str_4545;

    public class ShowsConfigGroup extends AbstractStreamsConfig implements _Str_2741 
    {
        protected var _Str_2466:String = null;
        protected var _Str_3402:Array;
        protected var _Str_2519:ShowsPlaylistConfigGroup = null;
        protected var _Str_9912:StreamTimerConfig;

        public function ShowsConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_3402 = new Array();
            this._Str_9912 = new StreamTimerConfig();
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k != null)
                {
                    if (k.preview != undefined)
                    {
                        this._Str_2466 = k.preview;
                    }
                    if (k.streamTimer != undefined)
                    {
                        this._Str_9912 = new StreamTimerConfig(k.streamTimer);
                    }
                    if (k.playlist != undefined)
                    {
                        this._Str_2519 = new ShowsPlaylistConfigGroup(k.playlist);
                        this.streams = this._Str_2519._Str_10087();
                    }
                    else
                    {
                        if (k.streams != undefined)
                        {
                            if ((k.streams is String))
                            {
                                this.streams = ArrayUtils._Str_8734(k.streams);
                            }
                            this.streams = k.streams;
                        }
                    }
                }
            }
            _Str_3144();
        }

        override public function isOVAConfigLoading():Boolean
        {
            if (_Str_6229())
            {
                return true;
            }
            var k:int;
            while (k < this._Str_3402.length)
            {
                if (this._Str_3402[k].isOVAConfigLoading())
                {
                    return true;
                }
                k++;
            }
            return false;
        }

        override public function mustOperateWithoutDuration():Boolean
        {
            var k:int;
            if (_Str_6569)
            {
                return true;
            }
            if (this._Str_3402 != null)
            {
                k = 0;
                while (k < this._Str_3402.length)
                {
                    if ((this._Str_3402[k] is _Str_4545))
                    {
                        if (!this._Str_3402[k].hasDuration())
                        {
                            return true;
                        }
                    }
                    else
                    {
                        if (this._Str_3402[k].duration == undefined)
                        {
                            return true;
                        }
                        if (parseInt(this._Str_3402[k].duration) <= 0)
                        {
                            return true;
                        }
                    }
                    k++;
                }
            }
            return false;
        }

        public function _Str_12928():String
        {
            return this._Str_2466;
        }

        public function _Str_24712():Boolean
        {
            return !(this._Str_12928() == null);
        }

        public function _Str_19861():Boolean
        {
            if (this._Str_9912 != null)
            {
                return this._Str_9912.enabled;
            }
            return false;
        }

        public function get _Str_26331():StreamTimerConfig
        {
            return this._Str_9912;
        }

        public function _Str_23740():String
        {
            if (this._Str_3402.length > 0)
            {
                if (this._Str_3402[0].isLive())
                {
                    return this._Str_3402[0].filename;
                }
            }
            return null;
        }

        public function _Str_21533():Boolean
        {
            return this._Str_3402.length > 0;
        }

        public function _Str_21649(k:Array):void
        {
            this._Str_3402 = k.concat(this._Str_3402);
        }

        protected function _Str_24268():void
        {
            var k:int;
            if (this._Str_3402 != null)
            {
                k = 0;
                while (k < this._Str_3402.length)
                {
                    this._Str_3402[k].resolveFilename(this);
                    k++;
                }
            }
        }

        public function set streams(k:Array):void
        {
            var _local_2:int;
            var _local_3:_Str_4545;
            this._Str_3402 = new Array();
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    _local_3 = new _Str_4545(k[_local_2].file, k[_local_2].file, ((k[_local_2].duration != undefined) ? k[_local_2].duration : ("00:00:00")), ((k[_local_2].reduceLength != undefined) ? k[_local_2].reduceLength : (false)), ((k[_local_2].deliveryType != undefined) ? k[_local_2].deliveryType : ("any")), ((k[_local_2].playOnce != undefined) ? k[_local_2].playOnce : (false)), ((k[_local_2].metaData != undefined) ? k[_local_2].metaData : (true)), ((k[_local_2].autoPlay != undefined) ? k[_local_2].autoPlay : (true)), ((k[_local_2].provider != undefined) ? k[_local_2].provider : (null)), ((k[_local_2].player != undefined) ? k[_local_2].player : (this.player)), ((k[_local_2].customProperties != undefined) ? k[_local_2].customProperties : (null)), ((k[_local_2].type != undefined) ? k[_local_2].type : (null)), ((k[_local_2].startTime != undefined) ? k[_local_2].startTime : ("00:00:00")), fireTrackingEvents);
                    this._Str_3402.push(_local_3);
                    _local_2++;
                }
                this._Str_24268();
            }
        }

        public function get streams():Array
        {
            return this._Str_3402;
        }
    }
}
