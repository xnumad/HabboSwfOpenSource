package com.sulake.habbo.session.enum
{
    public class RoomTradingLevelEnum 
    {
        public static const _Str_12752:int = 0;
        public static const _Str_14475:int = 1;
        public static const FREE_TRADING:int = 2;


        public static function _Str_22614(k:int):String
        {
            switch (k)
            {
                case FREE_TRADING:
                    return "${trading.mode.free}";
                case _Str_14475:
                    return "${trading.mode.controller}";
                case _Str_12752:
                    return "${trading.mode.not.allowed}";
            }
            return "";
        }
    }
}
