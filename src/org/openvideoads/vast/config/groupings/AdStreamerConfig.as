package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.ArrayUtils;

    public class AdStreamerConfig extends Debuggable 
    {
        protected var _Str_8251:String = null;
        protected var _Str_4685:Array = null;
        protected var _Str_4813:Array = null;

        public function AdStreamerConfig(k:Object)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k.netConnectionAddress != undefined)
            {
                this._Str_8251 = StringUtils.trim(k.netConnectionAddress);
            }
            if (k.removeFilenameExtensions != undefined)
            {
                if ((k.removeFilenameExtensions is Array))
                {
                    this._Str_4685 = k.removeFilenameExtensions;
                }
                else
                {
                    this._Str_4685 = ArrayUtils._Str_8734(k.removeFilenameExtensions);
                }
            }
            if (k.addFilenamePrefixes != undefined)
            {
                if ((k.addFilenamePrefixes is Array))
                {
                    this._Str_4813 = k.addFilenamePrefixes;
                }
                else
                {
                    this._Str_4813 = ArrayUtils._Str_8734(k.addFilenamePrefixes);
                }
            }
        }

        public function set netConnectionAddress(k:String):void
        {
            this._Str_8251 = k;
        }

        public function get netConnectionAddress():String
        {
            return this._Str_8251;
        }

        public function set removeFilenameExtensions(k:Array):void
        {
            this._Str_4685 = k;
        }

        public function get removeFilenameExtensions():Array
        {
            return this._Str_4685;
        }

        public function set addFilenamePrefixes(k:Array):void
        {
            this._Str_4813 = k;
        }

        public function get addFilenamePrefixes():Array
        {
            return this._Str_4813;
        }

        public function _Str_22827(k:String, _arg_2:String="video/x-mp4"):String
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (this._Str_8251 != null)
            {
                _local_3 = k;
                if (k.indexOf(this._Str_8251) > -1)
                {
                    _local_3 = k.substr(this._Str_8251.length);
                }
                else
                {
                    if (k.indexOf("rtmp://") <= -1)
                    {
                        _local_3 = k;
                    }
                }
                if (_local_3.charAt(0) == "/")
                {
                    _local_3 = _local_3.substr(1);
                }
                if (((!(this._Str_4685 == null)) || (!(this._Str_4813 == null))))
                {
                    _local_4 = null;
                    if (_arg_2 != null)
                    {
                        _local_4 = StringUtils.trim(_arg_2);
                        if (_local_4.indexOf("video/x-") == 0)
                        {
                            _local_4 = _local_4.substr(8);
                        }
                        else
                        {
                            if (_local_4.indexOf("video/") == 0)
                            {
                                _local_4 = _local_4.substr(6);
                            }
                        }
                    }
                    else
                    {
                        if (k.indexOf(".mp4") > -1)
                        {
                            _local_4 = "mp4";
                        }
                        else
                        {
                            if (k.indexOf(".flv") > -1)
                            {
                                _local_4 = "flv";
                            }
                        }
                    }
                    if (_local_4 != null)
                    {
                        if (this._Str_4685 != null)
                        {
                            _local_5 = 0;
                            while (_local_5 < this._Str_4685.length)
                            {
                                if ((this._Str_4685[_local_5] is String))
                                {
                                    if (StringUtils._Str_2576(this._Str_4685[_local_5], _local_4))
                                    {
                                        _local_6 = _local_3.indexOf(("." + this._Str_4685[_local_5]));
                                        if (_local_6 == -1)
                                        {
                                            _local_6 = _local_3.indexOf(("." + this._Str_4685[_local_5].toUpperCase()));
                                        }
                                        if (_local_6 > -1)
                                        {
                                            _local_3 = _local_3.substr(0, _local_6);
                                            _local_5 = this._Str_4685.length;
                                        }
                                    }
                                }
                                _local_5++;
                            }
                        }
                        if (this._Str_4813 != null)
                        {
                            _local_7 = 0;
                            while (_local_7 < this._Str_4813.length)
                            {
                                if ((this._Str_4813[_local_7] is String))
                                {
                                    if (StringUtils._Str_2576(this._Str_4813[_local_7], _local_4))
                                    {
                                        if (_local_3.toUpperCase().indexOf((this._Str_4813[_local_7].toUpperCase() + ":")) == -1)
                                        {
                                            _local_3 = ((this._Str_4813[_local_7] + ":") + _local_3);
                                            _local_7 = this._Str_4813.length;
                                        }
                                    }
                                }
                                _local_7++;
                            }
                        }
                    }
                }
            }
            return _local_3;
        }
    }
}
