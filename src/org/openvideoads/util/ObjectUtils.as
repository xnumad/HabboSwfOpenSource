package org.openvideoads.util
{
    import flash.system.Capabilities;

    public class ObjectUtils 
    {
        private static var counter:Number = 0;


        public static function _Str_22043():String
        {
            var k:Date = new Date();
            var _local_2:Number = k.getTime();
            var _local_3:Number = (Math.random() * Number.MAX_VALUE);
            var _local_4:String = Capabilities.serverString;
            var _local_5:String = _Str_21958((((_local_2 + _local_4) + _local_3) + counter++)).toUpperCase();
            var _local_6:String = ((((((((_local_5.substring(0, 8) + "-") + _local_5.substring(8, 12)) + "-") + _local_5.substring(12, 16)) + "-") + _local_5.substring(16, 20)) + "-") + _local_5.substring(20, 32));
            return _local_6;
        }

        private static function _Str_21958(k:String):String
        {
            return _Str_20760(k);
        }

        private static function _Str_20760(k:String):String
        {
            return _Str_20761(_Str_19782(_Str_20253(k), (k.length * 8)));
        }

        private static function _Str_19782(k:Array, _arg_2:Number):Array
        {
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            k[(_arg_2 >> 5)] = (k[(_arg_2 >> 5)] | (128 << (24 - (_arg_2 % 32))));
            k[((((_arg_2 + 64) >> 9) << 4) + 15)] = _arg_2;
            var _local_3:Array = new Array(80);
            var _local_4:Number = 1732584193;
            var _local_5:Number = -271733879;
            var _local_6:Number = -1732584194;
            var _local_7:Number = 271733878;
            var _local_8:Number = -1009589776;
            var _local_9:Number = 0;
            while (_local_9 < k.length)
            {
                _local_10 = _local_4;
                _local_11 = _local_5;
                _local_12 = _local_6;
                _local_13 = _local_7;
                _local_14 = _local_8;
                _local_15 = 0;
                while (_local_15 < 80)
                {
                    if (_local_15 < 16)
                    {
                        _local_3[_local_15] = k[(_local_9 + _local_15)];
                    }
                    else
                    {
                        _local_3[_local_15] = _Str_6749((((_local_3[(_local_15 - 3)] ^ _local_3[(_local_15 - 8)]) ^ _local_3[(_local_15 - 14)]) ^ _local_3[(_local_15 - 16)]), 1);
                    }
                    _local_16 = _Str_3687(_Str_3687(_Str_6749(_local_4, 5), sha1_ft(_local_15, _local_5, _local_6, _local_7)), _Str_3687(_Str_3687(_local_8, _local_3[_local_15]), sha1_kt(_local_15)));
                    _local_8 = _local_7;
                    _local_7 = _local_6;
                    _local_6 = _Str_6749(_local_5, 30);
                    _local_5 = _local_4;
                    _local_4 = _local_16;
                    _local_15++;
                }
                _local_4 = _Str_3687(_local_4, _local_10);
                _local_5 = _Str_3687(_local_5, _local_11);
                _local_6 = _Str_3687(_local_6, _local_12);
                _local_7 = _Str_3687(_local_7, _local_13);
                _local_8 = _Str_3687(_local_8, _local_14);
                _local_9 = (_local_9 + 16);
            }
            return new Array(_local_4, _local_5, _local_6, _local_7, _local_8);
        }

        private static function sha1_ft(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            if (k < 20)
            {
                return (_arg_2 & _arg_3) | ((~(_arg_2)) & _arg_4);
            }
            if (k < 40)
            {
                return (_arg_2 ^ _arg_3) ^ _arg_4;
            }
            if (k < 60)
            {
                return ((_arg_2 & _arg_3) | (_arg_2 & _arg_4)) | (_arg_3 & _arg_4);
            }
            return (_arg_2 ^ _arg_3) ^ _arg_4;
        }

        private static function sha1_kt(k:Number):Number
        {
            return (k < 20) ? 1518500249 : ((k < 40) ? 1859775393 : ((k < 60) ? -1894007588 : -899497514));
        }

        private static function _Str_3687(k:Number, _arg_2:Number):Number
        {
            var _local_3:Number = ((k & 0xFFFF) + (_arg_2 & 0xFFFF));
            var _local_4:Number = (((k >> 16) + (_arg_2 >> 16)) + (_local_3 >> 16));
            return (_local_4 << 16) | (_local_3 & 0xFFFF);
        }

        private static function _Str_6749(k:Number, _arg_2:Number):Number
        {
            return (k << _arg_2) | (k >>> (32 - _arg_2));
        }

        private static function _Str_20253(k:String):Array
        {
            var _local_2:Array = new Array();
            var _local_3:Number = ((1 << 8) - 1);
            var _local_4:Number = 0;
            while (_local_4 < (k.length * 8))
            {
                _local_2[(_local_4 >> 5)] = (_local_2[(_local_4 >> 5)] | ((k.charCodeAt((_local_4 / 8)) & _local_3) << (24 - (_local_4 % 32))));
                _local_4 = (_local_4 + 8);
            }
            return _local_2;
        }

        private static function _Str_20761(k:Array):String
        {
            var _local_2:String = new String("");
            var _local_3:String = new String("0123456789abcdef");
            var _local_4:Number = 0;
            while (_local_4 < (k.length * 4))
            {
                _local_2 = (_local_2 + (_local_3.charAt(((k[(_local_4 >> 2)] >> (((3 - (_local_4 % 4)) * 8) + 4)) & 0x0F)) + _local_3.charAt(((k[(_local_4 >> 2)] >> ((3 - (_local_4 % 4)) * 8)) & 0x0F))));
                _local_4++;
            }
            return _local_2;
        }
    }
}
