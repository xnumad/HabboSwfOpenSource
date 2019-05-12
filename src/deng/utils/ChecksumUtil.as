package deng.utils
{
    import flash.utils.ByteArray;

    public class ChecksumUtil 
    {
        private static var _Str_982:Array = _Str_1021();


        private static function _Str_1021():Array
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint;
            var k:Array = [];
            _local_2 = 0;
            while (_local_2 < 0x0100)
            {
                _local_4 = _local_2;
                _local_3 = 0;
                while (_local_3 < 8)
                {
                    if ((_local_4 & 0x01))
                    {
                        _local_4 = (3988292384 ^ (_local_4 >>> 1));
                    }
                    else
                    {
                        _local_4 = (_local_4 >>> 1);
                    }
                    _local_3++;
                }
                k.push(_local_4);
                _local_2++;
            }
            return k;
        }

        public static function _Str_1999(k:ByteArray, _arg_2:uint=0, _arg_3:uint=0):uint
        {
            var _local_4:uint;
            if (_arg_2 >= k.length)
            {
                _arg_2 = k.length;
            }
            if (_arg_3 == 0)
            {
                _arg_3 = (k.length - _arg_2);
            }
            if ((_arg_3 + _arg_2) > k.length)
            {
                _arg_3 = (k.length - _arg_2);
            }
            var _local_5:uint = 0xFFFFFFFF;
            _local_4 = _arg_2;
            while (_local_4 < _arg_3)
            {
                _local_5 = (uint(_Str_982[((_local_5 ^ k[_local_4]) & 0xFF)]) ^ (_local_5 >>> 8));
                _local_4++;
            }
            return _local_5 ^ 0xFFFFFFFF;
        }

        public static function _Str_1386(k:ByteArray, _arg_2:uint=0, _arg_3:uint=0):uint
        {
            if (_arg_2 >= k.length)
            {
                _arg_2 = k.length;
            }
            if (_arg_3 == 0)
            {
                _arg_3 = (k.length - _arg_2);
            }
            if ((_arg_3 + _arg_2) > k.length)
            {
                _arg_3 = (k.length - _arg_2);
            }
            var _local_4:uint = _arg_2;
            var _local_5:uint = 1;
            var _local_6:uint;
            while (_local_4 < (_arg_2 + _arg_3))
            {
                _local_5 = ((_local_5 + k[_local_4]) % 65521);
                _local_6 = ((_local_5 + _local_6) % 65521);
                _local_4++;
            }
            return (_local_6 << 16) | _local_5;
        }
    }
}
