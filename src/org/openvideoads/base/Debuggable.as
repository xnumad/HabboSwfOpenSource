package org.openvideoads.base
{
    import org.openvideoads.util.ObjectUtils;
    import org.openvideoads.util.StringUtils;

    public class Debuggable 
    {
        public static var _Str_17390:int = -1;
        public static var _Str_15476:int = 0;
        public static var _Str_11519:int = 1;
        public static var _Str_17922:int = 2;
        public static var _Str_17928:int = 4;
        public static var _Str_15983:int = 8;
        public static var _Str_18879:int = 16;
        public static var _Str_17292:int = 32;
        public static var _Str_16607:int = 64;
        public static var _Str_17262:int = 128;
        public static var _Str_18937:int = 0x0100;
        public static var _Str_16003:int = 0x0200;
        public static var _Str_16591:int = 0x0400;
        public static var _Str_12852:int = 0x0800;
        public static var _Str_22030:int = 0x0800;
        public static var _Str_16580:int = 0x1000;
        public static var _Str_17920:int = 0x2000;
        public static var _Str_18777:int = 0x4000;
        public static var _Str_17322:int = 0x8000;
        public static var _Str_16103:int = 65536;
        public static var _Str_17063:int = 131072;
        public static var _Str_18509:int = 262144;
        public static var _Str_16704:int = 524288;
        protected static var _Str_2456:int = 0;
        protected static var _Str_14737:String = "firebug";
        public static var _Str_1229:Debuggable;

        protected var _Str_2995:String = null;

        public function Debuggable()
        {
            this._Str_2995 = ObjectUtils._Str_22043();
        }

        public static function getInstance():Debuggable
        {
            if (_Str_1229 == null)
            {
                _Str_1229 = new (Debuggable)();
            }
            return _Str_1229;
        }


        public function _Str_26207(k:Object):void
        {
            if (((!(k == null)) && ((k is String) == false)))
            {
                if (k.levels != undefined)
                {
                    this.setLevelFromString(k.levels);
                }
                if (k.debugger != undefined)
                {
                    this.activeDebuggers = k.debugger;
                }
            }
        }

        public function get uid():String
        {
            return this._Str_2995;
        }

        public function set level(k:int):void
        {
            _Str_2456 = k;
        }

        public function _Str_26279(k:int=1):Boolean
        {
            return (k == Debuggable._Str_17390) || ((!(_Str_2456 == Debuggable._Str_15476)) && (((_Str_2456 == Debuggable._Str_11519) || (k == Debuggable._Str_11519)) || (_Str_2456 & k)));
        }

        public function set activeDebuggers(k:String):void
        {
            _Str_14737 = k;
        }

        public function setLevelFromString(k:String):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            if (this.setLevelFromString != null)
            {
                _local_2 = k.split(/,/);
                if (_local_2.length > 0)
                {
                    _local_3 = 0;
                    _local_4 = 0;
                    while (_local_4 < _local_2.length)
                    {
                        switch (StringUtils.trim(_local_2[_local_4]).toUpperCase())
                        {
                            case "NONE":
                                _local_3 = (_local_3 | _Str_15476);
                                break;
                            case "ALL":
                                _local_3 = (_local_3 | _Str_11519);
                                break;
                            case "VAST_TEMPLATE":
                                _local_3 = (_local_3 | _Str_17922);
                                break;
                            case "CUEPOINT_EVENTS":
                                _local_3 = (_local_3 | _Str_17928);
                                break;
                            case "SEGMENT_FORMATION":
                                _local_3 = (_local_3 | _Str_15983);
                                break;
                            case "REGION_FORMATION":
                                _local_3 = (_local_3 | _Str_18879);
                                break;
                            case "CUEPOINT_FORMATION":
                                _local_3 = (_local_3 | _Str_17292);
                                break;
                            case "CONFIG":
                                _local_3 = (_local_3 | _Str_16607);
                                break;
                            case "CLICKTHROUGH_EVENTS":
                                _local_3 = (_local_3 | _Str_17262);
                                break;
                            case "DATA_ERROR":
                                _local_3 = (_local_3 | _Str_18937);
                                break;
                            case "HTTP_CALLS":
                                _local_3 = (_local_3 | _Str_16003);
                                break;
                            case "FATAL":
                                _local_3 = (_local_3 | _Str_16591);
                                break;
                            case "VPAID":
                                _local_3 = (_local_3 | _Str_12852);
                                break;
                            case "MOUSE_EVENTS":
                                _local_3 = (_local_3 | _Str_16580);
                                break;
                            case "PLAYLIST":
                                _local_3 = (_local_3 | _Str_17920);
                                break;
                            case "JAVASCRIPT":
                                _local_3 = (_local_3 | _Str_18777);
                                break;
                            case "API":
                                _local_3 = (_local_3 | _Str_17322);
                                break;
                            case "TRACKING_TABLE":
                                _local_3 = (_local_3 | _Str_16103);
                                break;
                            case "DISPLAY_EVENTS":
                                _local_3 = (_local_3 | _Str_17063);
                                break;
                            case "ANALYTICS":
                                _local_3 = (_local_3 | _Str_18509);
                                break;
                            case "TRACKING_EVENTS":
                                _local_3 = (_local_3 | _Str_16704);
                                break;
                        }
                        _local_4++;
                    }
                    this.level = _local_3;
                }
            }
        }

        public function _Str_25882(k:int=1):void
        {
        }

        public function _Str_16801(k:String, _arg_2:int=1):void
        {
        }

        public function _Str_19580(k:Object, _arg_2:int=1):void
        {
        }

        public function toJSObject():Object
        {
            return new Object();
        }
    }
}
