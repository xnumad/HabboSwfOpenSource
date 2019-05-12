package com.sulake.habbo.navigator.view.search
{
    public class FilterModeEnum 
    {
        public static const DEFAULT:int = 0;
        public static const _Str_19005:int = 1;
        public static const _Str_17720:int = 2;
        public static const _Str_17241:int = 3;
        public static const _Str_3783:int = 4;
        public static const _Str_17193:int = 5;
        public static const _Str_7872:Array = ["", "owner:", "roomname:", "tag:", "group:", ""];


        public static function _Str_25167(k:String):int
        {
            var _local_2:int = 1;
            while (_local_2 < _Str_7872.length)
            {
                if (k.indexOf(_Str_7872[_local_2]) == 0)
                {
                    return _local_2;
                }
                _local_2++;
            }
            return DEFAULT;
        }
    }
}
