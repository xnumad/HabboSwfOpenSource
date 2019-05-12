package org.openvideoads.util
{
    public class StringUtils 
    {


        public static function _Str_26296(k:String, _arg_2:Number):String
        {
            if (k != null)
            {
                return k.substr(0, _arg_2);
            }
            return k;
        }

        public static function _Str_26249(k:String, _arg_2:int):Number
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            if (k != null)
            {
                _local_3 = k.split(".");
                _local_4 = 0;
                _local_5 = 0;
                _local_6 = (_local_3.length - 1);
                while (_local_6 >= 0)
                {
                    if (_local_5 == 0)
                    {
                        _local_4 = _local_3[_local_6];
                        _local_5 = _arg_2;
                    }
                    else
                    {
                        _local_4 = (_local_4 + (_local_3[_local_6] * _local_5));
                    }
                    _local_5 = (_local_5 * 10);
                    _local_6--;
                }
                return _local_4;
            }
            return 0;
        }

        public static function _Str_2810(k:*):Boolean
        {
            if (((!(k == null)) && (!(k == undefined))))
            {
                if (((k is String) || (typeof(k) == "xml")))
                {
                    return k.toUpperCase() == "TRUE";
                }
                if ((k is Boolean))
                {
                    return k;
                }
            }
            return false;
        }

        public static function _Str_24234(k:*):Number
        {
            if ((k is Number))
            {
                return k;
            }
            if ((k is String))
            {
                return Number(k);
            }
            return -1;
        }

        public static function _Str_22149(k:*, _arg_2:String):Boolean
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:String;
            if ((k is Array))
            {
                for each (_local_3 in k)
                {
                    if ((_local_3 is String))
                    {
                        if (_Str_2576((_local_3 as String), _arg_2))
                        {
                            return true;
                        }
                    }
                }
            }
            else
            {
                if ((k is String))
                {
                    if (((StringUtils.isEmpty(k)) || (StringUtils.isEmpty(_arg_2))))
                    {
                        return false;
                    }
                    _local_4 = k.toUpperCase();
                    _local_5 = _arg_2.toUpperCase();
                    return _local_4.indexOf(_local_5) > -1;
                }
            }
            return false;
        }

        public static function _Str_2576(k:String, _arg_2:String):Boolean
        {
            if (((k == null) && (_arg_2 == null)))
            {
                return true;
            }
            if ((((k == null) && (!(_arg_2 == null))) || ((!(k == null)) && (_arg_2 == null))))
            {
                return false;
            }
            return k.toUpperCase() == _arg_2.toUpperCase();
        }

        public static function trim(k:String):String
        {
            return (k) ? k.replace(/^\s+|\s+$/gs, "") : "";
        }

        public static function isEmpty(k:String):Boolean
        {
            if (k == null)
            {
                return true;
            }
            return StringUtils.trim(k).length == 0;
        }

        public static function _Str_21602(k:String):String
        {
            var _local_2:String;
            var _local_3:Array;
            if (k != null)
            {
                _local_2 = k;
                _local_2 = _local_2.split("\t").join(" ");
                _local_2 = _local_2.split("\r").join(" ");
                _local_2 = _local_2.split("\n").join(" ");
                return _local_2;
            }
            return k;
        }

        public static function _Str_26304(k:String):String
        {
            var _local_3:Array;
            var _local_2:String = k;
            _local_3 = _local_2.split(" ");
            var _local_4:uint;
            while (_local_4 < _local_3.length)
            {
                if (_local_3[_local_4] == "")
                {
                    _local_3.splice(_local_4, 1);
                    _local_4--;
                }
                _local_4++;
            }
            _local_2 = _local_3.join(" ");
            return _local_2;
        }

        public static function _Str_26054(k:String, _arg_2:String, _arg_3:String):Object
        {
            var _local_6:int;
            var _local_7:Array;
            var _local_4:Object = new Object();
            var _local_5:Array = k.split(_arg_2);
            if (_local_5.length > 0)
            {
                _local_6 = 0;
                while (_local_6 < _local_5.length)
                {
                    _local_7 = _local_5[_local_6].split(_arg_3);
                    if (_local_7.length == 2)
                    {
                        _local_4[_local_7[0]] = _local_7[1];
                    }
                    _local_6++;
                }
            }
            return _local_4;
        }

        public static function _Str_26335(k:String, _arg_2:String, _arg_3:String):String
        {
            if (((StringUtils._Str_17635(k, _arg_3)) || (StringUtils._Str_4861(_arg_2, _arg_3))))
            {
                return k + _arg_2;
            }
            return (k + _arg_3) + _arg_2;
        }

        public static function _Str_4861(k:String, _arg_2:String):Boolean
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            return StringUtils.trim(k).toUpperCase().indexOf(_arg_2.toUpperCase()) == 0;
        }

        public static function _Str_17635(k:String, _arg_2:String):Boolean
        {
            if (k == null)
            {
                return false;
            }
            return k.lastIndexOf(_arg_2) == (k.length - _arg_2.length);
        }

        public static function _Str_20351(k:String, _arg_2:String):String
        {
            var _local_3:RegExp = /{quote}/g;
            return k.replace(_local_3, _arg_2);
        }

        public static function _Str_22866(k:String):String
        {
            return k.replace(/\n/g, "");
        }

        public static function _Str_22738(k:String):String
        {
            return k.replace(/(['\\])/g, "\\$1");
        }

        public static function _Str_26006(k:String, _arg_2:String):Boolean
        {
            if (k != null)
            {
                if (_arg_2 != null)
                {
                    if (((!(StringUtils.isEmpty(k))) && (!(StringUtils.isEmpty(_arg_2)))))
                    {
                        return k == _arg_2;
                    }
                }
            }
            return false;
        }

        public static function _Str_26146(k:String, _arg_2:String):String
        {
            var _local_3:int;
            while (_local_3 < k.length)
            {
                if (_local_3 < _arg_2.length)
                {
                    if (k.charAt(_local_3) != _arg_2.charAt(_local_3))
                    {
                        return ((((("difference: " + _local_3) + ", (") + k.charCodeAt(_local_3)) + ") != (") + _arg_2.charCodeAt(_local_3)) + ")";
                    }
                }
                else
                {
                    return "difference: string1 longer";
                }
                _local_3++;
            }
            if (k.length < _arg_2.length)
            {
                return "difference: string2 is longer";
            }
            return "difference: identical";
        }

        public static function _Str_26338(k:String):String
        {
            var _local_2:RegExp = /'/g;
            return k.replace(_local_2, '"');
        }

        public static function _Str_25987(k:String):String
        {
            return k.replace(/(['\\])/g, "\\$1");
        }

        public static function _Str_26323(k:String):String
        {
            var _local_2:String = new String();
            var _local_3:int;
            while (_local_3 < k.length)
            {
                if (k.charAt(_local_3) == '"')
                {
                    _local_2 = (_local_2 + '"');
                }
                else
                {
                    _local_2 = (_local_2 + k.charAt(_local_3));
                }
                _local_3++;
            }
            return _local_2;
        }
    }
}
