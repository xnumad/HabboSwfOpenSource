package com.sulake.habbo.utils
{
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import __AS3__.vec.*;

    public class Base64 
    {
        private static const _Str_8412:Vector.<int> = _Str_20895();


        public static function decode(k:String):String
        {
            var _local_2:ByteArray = _Str_19248(k);
            return _local_2.readUTFBytes(_local_2.length);
        }

        public static function _Str_19248(k:String):ByteArray
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int = k.length;
            var _local_8:ByteArray = new ByteArray();
            _local_8.writeUTFBytes(k);
            var _local_9:int;
            while (_local_6 < _local_7)
            {
                _local_2 = _Str_8412[int(_local_8[_local_6++])];
                if (_local_2 == -1)
                {
                    break;
                }
                _local_3 = _Str_8412[int(_local_8[_local_6++])];
                if (_local_3 == -1)
                {
                    break;
                }
                _local_8[int(_local_9++)] = ((_local_2 << 2) | ((_local_3 & 0x30) >> 4));
                _local_4 = _local_8[int(_local_6++)];
                if (_local_4 == 61)
                {
                    break;
                }
                _local_4 = _Str_8412[int(_local_4)];
                if (_local_4 == -1)
                {
                    break;
                }
                _local_8[int(_local_9++)] = (((_local_3 & 0x0F) << 4) | ((_local_4 & 0x3C) >> 2));
                _local_5 = _local_8[int(_local_6++)];
                if (_local_5 == 61)
                {
                    break;
                }
                _local_5 = _Str_8412[int(_local_5)];
                if (_local_5 == -1)
                {
                    break;
                }
                _local_8[int(_local_9++)] = (((_local_4 & 0x03) << 6) | _local_5);
            }
            _local_8.length = _local_9;
            _local_8.position = 0;
            return _local_8;
        }

        private static function _Str_26194():Vector.<int>
        {
            var k:Vector.<int> = new Vector.<int>(64, true);
            var _local_2:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            var _local_3:int;
            while (_local_3 < 64)
            {
                k[_local_3] = _local_2.charCodeAt(_local_3);
                _local_3++;
            }
            return k;
        }

        private static function _Str_20895():Vector.<int>
        {
            var k:Vector.<int> = new <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
            return k;
        }
    }
}
