package org.openvideoads.vast.model
{
    import org.openvideoads.util.Timestamp;

    public class LinearVideoAd extends TrackedVideoAd 
    {
        protected var _Str_2467:String;
        protected var _Str_2409:Array;
        protected var _Str_3645:MediaFile = null;

        public function LinearVideoAd()
        {
            this._Str_2409 = new Array();
            super();
        }

        override public function unload():void
        {
            var k:int;
            if (this._Str_20050())
            {
                k = 0;
                while (k < this._Str_2409.length)
                {
                    this._Str_2409[k].unload();
                    k++;
                }
            }
        }

        public function set duration(k:String):void
        {
            this._Str_2467 = k;
        }

        override public function get duration():String
        {
            return this._Str_2467;
        }

        public function _Str_24711(k:int):void
        {
            this._Str_2467 = Timestamp._Str_4110(k);
        }

        public function _Str_20050():Boolean
        {
            if (this._Str_2409 == null)
            {
                return false;
            }
            return this._Str_2409.length > 0;
        }

        public function _Str_26164():int
        {
            if (this._Str_20050())
            {
                return this._Str_2409.length;
            }
            return 0;
        }

        public function set mediaFiles(k:Array):void
        {
            this._Str_2409 = k;
        }

        public function get mediaFiles():Array
        {
            return this._Str_2409;
        }

        public function _Str_26332():MediaFile
        {
            return this._Str_3645;
        }

        public function filterLinearAdMediaFileByMimeType(k:Array):void
        {
            var _local_3:Array;
            var _local_2:int;
            while (_local_2 < this._Str_2409.length)
            {
                if (this._Str_2409[_local_2].isPermittedMimeType(k) == false)
                {
                    _local_3 = this._Str_2409.splice(_local_2, 1);
                }
                else
                {
                    _local_2++;
                }
            }
        }

        public function _Str_19374(k:MediaFile):void
        {
            var _local_2:Array;
            if (k._parser4())
            {
                _local_2 = [k];
                this._Str_2409 = _local_2.concat(this._Str_2409);
            }
            else
            {
                this._Str_2409.push(k);
            }
        }

        public function isEmpty():Boolean
        {
            return this._Str_2409.length == 0;
        }

        public function _Str_25352(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):MediaFile
        {
            var _local_7:MediaFile;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Array;
            if (((!(this._Str_2409 == null)) && (this._Str_2409.length > 0)))
            {
                _local_7 = null;
                _local_8 = -1;
                _local_9 = -1;
                _local_10 = -1;
                _local_11 = -1;
                if (((_arg_3 is String) && (!(_arg_3 == null))))
                {
                    if (_arg_3.indexOf("-") > -1)
                    {
                        _local_13 = String(_arg_3).split("-");
                        if (_local_13.length == 2)
                        {
                            _local_10 = parseInt(_local_13[0]);
                            _local_11 = parseInt(_local_13[1]);
                        }
                    }
                    else
                    {
                        _local_10 = (_local_11 = parseInt(_arg_3));
                    }
                }
                _local_12 = 0;
                for (;_local_12 < this._Str_2409.length;_local_12++)
                {
                    if (((this._Str_2409[_local_12].isDeliveryType(k)) && (this._Str_2409[_local_12].isMimeType(_arg_2))))
                    {
                        if (((this._Str_2409[_local_12].hasBitRate()) && (_local_10 > -1)))
                        {
                            if (!((_local_10 <= this._Str_2409[_local_12].bitRate) && (this._Str_2409[_local_12].bitRate <= _local_11))) continue;
                        }
                        if (((_arg_4 == -1) && (_arg_5 == -1)))
                        {
                            _local_7 = this._Str_2409[_local_12];
                            _local_12 = this._Str_2409.length;
                        }
                        else
                        {
                            if (_arg_4 > -1)
                            {
                                if (((_local_8 == -1) || (Math.abs((_arg_4 - this._Str_2409[_local_12].width)) < _local_8)))
                                {
                                    if (_arg_5 > -1)
                                    {
                                        if (((_local_9 == -1) || (Math.abs((_arg_5 - this._Str_2409[_local_12].height)) < _local_9)))
                                        {
                                            _local_7 = this._Str_2409[_local_12];
                                            _local_9 = Math.abs((_arg_5 - this._Str_2409[_local_12].height));
                                            _local_8 = Math.abs((_arg_4 - this._Str_2409[_local_12].width));
                                        }
                                    }
                                    else
                                    {
                                        _local_7 = this._Str_2409[_local_12];
                                        _local_8 = Math.abs((_arg_4 - this._Str_2409[_local_12].width));
                                    }
                                }
                            }
                            else
                            {
                                if (((_local_9 == -1) || (Math.abs((_arg_5 - this._Str_2409[_local_12].height)) < _local_9)))
                                {
                                    _local_7 = this._Str_2409[_local_12];
                                    _local_9 = Math.abs((_arg_5 - this._Str_2409[_local_12].height));
                                }
                            }
                        }
                    }
                }
                if (_local_7 != null)
                {
                }
                return _local_7;
            }
            return null;
        }

        public function _Str_25560(k:String, _arg_2:*="any", _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):MediaFile
        {
            var _local_7:int;
            var _local_8:int;
            var _local_6:MediaFile;
            if (((!(this._Str_2409 == null)) && (this._Str_2409.length > 0)))
            {
                _local_7 = 99999999;
                _local_8 = 0;
                while (_local_8 < this._Str_2409.length)
                {
                    if (((_arg_3 == -1) && (_arg_4 == -1)))
                    {
                        if (this._Str_2409[_local_8].bitRate < _local_7)
                        {
                            _local_6 = this._Str_2409[_local_8];
                            _local_7 = this._Str_2409[_local_8].bitRate;
                        }
                    }
                    else
                    {
                        if (((_arg_3 == -1) && (_arg_4 > -1)))
                        {
                            if (_arg_4 == this._Str_2409[_local_8].height)
                            {
                                if (this._Str_2409[_local_8].bitRate < _local_7)
                                {
                                    _local_6 = this._Str_2409[_local_8];
                                    _local_7 = this._Str_2409[_local_8].bitRate;
                                }
                            }
                        }
                        else
                        {
                            if (((_arg_3 > -1) && (this._Str_2409[_local_8].width == _arg_3)))
                            {
                                if (this._Str_2409[_local_8].bitRate < _local_7)
                                {
                                    _local_6 = this._Str_2409[_local_8];
                                    _local_7 = this._Str_2409[_local_8].bitRate;
                                }
                            }
                        }
                    }
                    _local_8++;
                }
            }
            if (_local_6 != null)
            {
            }
            return _local_6;
        }

        public function _Str_25491(k:String, _arg_2:*="any", _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):MediaFile
        {
            var _local_7:int;
            var _local_8:int;
            var _local_6:MediaFile;
            if (((!(this._Str_2409 == null)) && (this._Str_2409.length > 0)))
            {
                _local_7 = -1;
                _local_8 = 0;
                while (_local_8 < this._Str_2409.length)
                {
                    if (((_arg_3 == -1) && (_arg_4 == -1)))
                    {
                        if (this._Str_2409[_local_8].bitRate > _local_7)
                        {
                            _local_6 = this._Str_2409[_local_8];
                            _local_7 = this._Str_2409[_local_8].bitRate;
                        }
                    }
                    else
                    {
                        if (((_arg_3 == -1) && (_arg_4 > -1)))
                        {
                            if (_arg_4 == this._Str_2409[_local_8].height)
                            {
                                if (this._Str_2409[_local_8].bitRate > _local_7)
                                {
                                    _local_6 = this._Str_2409[_local_8];
                                    _local_7 = this._Str_2409[_local_8].bitRate;
                                }
                            }
                        }
                        else
                        {
                            if (((_arg_3 > -1) && (this._Str_2409[_local_8].width == _arg_3)))
                            {
                                if (this._Str_2409[_local_8].bitRate > _local_7)
                                {
                                    _local_6 = this._Str_2409[_local_8];
                                    _local_7 = this._Str_2409[_local_8].bitRate;
                                }
                            }
                        }
                    }
                    _local_8++;
                }
            }
            if (_local_6 != null)
            {
            }
            return _local_6;
        }

        public function _Str_22640(k:String, _arg_2:*="any", _arg_3:int=-1, _arg_4:int=-1, _arg_5:Boolean=false):MediaFile
        {
            var _local_7:int;
            var _local_8:int;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_6:MediaFile;
            if (((!(this._Str_2409 == null)) && (this._Str_2409.length > 0)))
            {
                _local_7 = -1;
                _local_8 = 9999999;
                _local_9 = new Array();
                _local_10 = 0;
                while (_local_10 < this._Str_2409.length)
                {
                    if (((_arg_3 == -1) && (_arg_4 == -1)))
                    {
                        if (this._Str_2409[_local_10].bitRate > _local_7)
                        {
                            _local_7 = this._Str_2409[_local_10].bitRate;
                            _local_6 = this._Str_2409[_local_10];
                        }
                        if (this._Str_2409[_local_10].bitRate < _local_8)
                        {
                            _local_8 = this._Str_2409[_local_10].bitRate;
                        }
                        _local_9.push(_local_10);
                    }
                    else
                    {
                        if (((_arg_3 == -1) && (_arg_4 > -1)))
                        {
                            if (_arg_4 == this._Str_2409[_local_10].height)
                            {
                                if (this._Str_2409[_local_10].bitRate > _local_7)
                                {
                                    _local_7 = this._Str_2409[_local_10].bitRate;
                                    _local_6 = this._Str_2409[_local_10];
                                }
                                if (this._Str_2409[_local_10].bitRate < _local_8)
                                {
                                    _local_8 = this._Str_2409[_local_10].bitRate;
                                }
                                _local_9.push(_local_10);
                            }
                        }
                        else
                        {
                            if (((_arg_3 > -1) && (this._Str_2409[_local_10].width == _arg_3)))
                            {
                                if (this._Str_2409[_local_10].bitRate > _local_7)
                                {
                                    _local_7 = this._Str_2409[_local_10].bitRate;
                                    _local_6 = this._Str_2409[_local_10];
                                }
                                if (this._Str_2409[_local_10].bitRate < _local_8)
                                {
                                    _local_8 = this._Str_2409[_local_10].bitRate;
                                }
                                _local_9.push(_local_10);
                            }
                        }
                    }
                    _local_10++;
                }
                if (((_local_7 > -1) && (_local_8 < 9999999)))
                {
                    _local_11 = (_local_8 + ((_local_7 - _local_8) / 2));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        if (((this._Str_2409[_local_9[_local_12]].bitRate > _local_8) && (this._Str_2409[_local_9[_local_12]].bitRate <= _local_11)))
                        {
                            if ((((_local_11 - _local_6.bitRate) < 0) || ((_local_11 - this._Str_2409[_local_9[_local_12]].bitRate) < (_local_11 - _local_6.bitRate))))
                            {
                                _local_6 = this._Str_2409[_local_9[_local_12]];
                            }
                            else
                            {
                                _local_6 = this._Str_2409[_local_9[_local_12]];
                            }
                        }
                        _local_12++;
                    }
                }
            }
            if (_local_6 != null)
            {
            }
            return _local_6;
        }

        public function _Str_17936(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):MediaFile
        {
            return this._Str_25352(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function _Str_10510(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):MediaFile
        {
            var _local_7:MediaFile;
            if (((_arg_3 is String) && (!(_arg_3 == null))))
            {
                _local_7 = null;
                if (_arg_3 != null)
                {
                    switch (_arg_3.toUpperCase())
                    {
                        case "HIGH":
                            return this._Str_25491(k, _arg_2, _arg_4, _arg_5);
                        case "MEDIUM":
                            return this._Str_22640(k, _arg_2, _arg_4, _arg_5);
                        case "LOW":
                            return this._Str_25560(k, _arg_2, _arg_4, _arg_5);
                        default:
                            return this._Str_17936(k, _arg_2, _arg_3, _arg_4, _arg_5);
                    }
                }
                return this._Str_17936(k, _arg_2, -1, _arg_4, _arg_5);
            }
            return this._Str_17936(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function getStreamToPlay(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):AdNetworkResource
        {
            var _local_7:MediaFile;
            if (this._Str_3645 == null)
            {
                _local_7 = this._Str_10510(k, _arg_2, _arg_3, _arg_4, _arg_5);
                if (_arg_6)
                {
                    this._Str_3645 = _local_7;
                }
                else
                {
                    if (_local_7 != null)
                    {
                        return _local_7.url;
                    }
                }
            }
            if (this._Str_3645 != null)
            {
                return this._Str_3645.url;
            }
            return null;
        }

        public function canScale(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):Boolean
        {
            var _local_7:MediaFile;
            if (this._Str_3645 == null)
            {
                _local_7 = this._Str_10510(k, _arg_2, _arg_3, _arg_4, _arg_5);
                if (_arg_6)
                {
                    this._Str_3645 = _local_7;
                }
                else
                {
                    if (_local_7 != null)
                    {
                        return _local_7.scale;
                    }
                }
            }
            if (this._Str_3645 != null)
            {
                return this._Str_3645.scale;
            }
            return false;
        }

        public function shouldMaintainAspectRatio(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):Boolean
        {
            var _local_7:MediaFile;
            if (this._Str_3645 == null)
            {
                _local_7 = this._Str_10510(k, _arg_2, _arg_3, _arg_4, _arg_5);
                if (_arg_6)
                {
                    this._Str_3645 = _local_7;
                }
                else
                {
                    if (_local_7 != null)
                    {
                        return _local_7.maintainAspectRatio;
                    }
                }
            }
            if (this._Str_3645 != null)
            {
                return this._Str_3645.maintainAspectRatio;
            }
            return true;
        }

        public function isInteractive(k:String, _arg_2:*="any", _arg_3:*=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:Boolean=false):Boolean
        {
            var _local_7:MediaFile;
            if (this._Str_3645 == null)
            {
                _local_7 = this._Str_10510(k, _arg_2, _arg_3, _arg_4, _arg_5);
                if (_arg_6)
                {
                    this._Str_3645 = _local_7;
                }
                else
                {
                    if (_local_7 != null)
                    {
                        return _local_7.isInteractive();
                    }
                }
            }
            if (this._Str_3645 != null)
            {
                return this._Str_3645.isInteractive();
            }
            return false;
        }

        public function _Str_26132():void
        {
            this._Str_3645 = null;
        }

        public function clicked():void
        {
            triggerTrackingEvent(TrackingEvent.ACCEPTINVITATION);
            fireClickTracking();
        }

        protected function _Str_23930():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this._Str_2409 != null)
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2409.length)
                {
                    k.push(this._Str_2409[_local_2].toJSObject());
                    _local_2++;
                }
            }
            return k;
        }

        override public function toJSObject():Object
        {
            var k:Object = super.toJSObject();
            k.duration = this._Str_2467;
            k.mediaFiles = this._Str_23930();
            return k;
        }
    }
}
