package com.sulake.room.utils
{
    public class RoomId 
    {
        private static const _Str_13456:int = 0x7FFF0000;


        public static function _Str_24114(k:int):int
        {
            return (k & 0xFFFF) + _Str_13456;
        }

        public static function _Str_18235(k:int):Boolean
        {
            return k >= _Str_13456;
        }
    }
}
