package com.sulake.habbo.window.enum
{
    public class _Str_3142 
    {
        public static const _Str_14897:String = "up, left";
        public static const _Str_14331:String = "up, center";
        public static const _Str_13347:String = "up, right";
        public static const _Str_14284:String = "down, left";
        public static const _Str_16868:String = "down, center";
        public static const _Str_12741:String = "down, right";
        public static const _Str_12710:String = "left, top";
        public static const _Str_18275:String = "left, middle";
        public static const _Str_15111:String = "left, bottom";
        public static const _Str_13226:String = "right, top";
        public static const _Str_17619:String = "right, middle";
        public static const _Str_15859:String = "right, bottom";
        public static const ALL:Array = [_Str_14897, _Str_14331, _Str_13347, _Str_14284, _Str_16868, _Str_12741, _Str_12710, _Str_18275, _Str_15111, _Str_13226, _Str_17619, _Str_15859];
        public static const UP:String = "up";
        public static const DOWN:String = "down";
        public static const LEFT:String = "left";
        public static const RIGHT:String = "right";
        public static const MINIMUM:String = "minimum";
        public static const MIDDLE:String = "middle";
        public static const MAXIMUM:String = "maximum";


        public static function _Str_22659(k:String):String
        {
            return k.substr(0, k.indexOf(","));
        }

        public static function _Str_20849(k:String):String
        {
            switch (k)
            {
                case _Str_14897:
                case _Str_14284:
                case _Str_12710:
                case _Str_13226:
                    return MINIMUM;
                case _Str_13347:
                case _Str_12741:
                case _Str_15111:
                case _Str_15859:
                    return MAXIMUM;
                default:
                    return MIDDLE;
            }
        }
    }
}
