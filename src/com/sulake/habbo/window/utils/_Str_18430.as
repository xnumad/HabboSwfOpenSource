package com.sulake.habbo.window.utils
{
    public class _Str_18430 
    {


        public static function _Str_25426(k:int, _arg_2:int):uint
        {
            var _local_3:int = (100 * (Number(k) / Number(_arg_2)));
            if (_local_3 >= 92)
            {
                return 4290917164;
            }
            if (_local_3 >= 80)
            {
                return 0xFFFFB11B;
            }
            if (_local_3 >= 50)
            {
                return 0xFFFFB11B;
            }
            if (k > 0)
            {
                return 4284723554;
            }
            return 4291545793;
        }
    }
}
