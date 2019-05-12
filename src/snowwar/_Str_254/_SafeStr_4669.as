package snowwar._Str_254
{
    public class _SafeStr_4669 
    {
        public static function _SafeStr_18715(k:int):int
        {
            var _local_2:int;
            if (k == 0)
            {
                k = -1;
            }
            _local_2 = (k << 13);
            k = (k ^ _local_2);
            _local_2 = (k >> 17);
            k = (k ^ _local_2);
            _local_2 = (k << 5);
            k = (k ^ _local_2);
            return k;
        }

        public static function _SafeStr_22068(k:int, _arg_2:int):int
        {
            if (_arg_2 == 0)
            {
                return 0;
            }
            return ((k < 0) ? (k * -1) : k) % _arg_2;
        }

        protected static function _SafeStr_22069(k:int):String
        {
            var _local_2:String = "";
            var _local_3:int = 31;
            while (_local_3 >= 0)
            {
                _local_2 = (_local_2 + (((k & (1 << _local_3)) > 0) ? "1" : "0"));
                _local_3--;
            }
            return _local_2;
        }
    }
}
