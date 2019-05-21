package com.sulake.room.utils
{
    public class RoomId 
    {
        private static const PREVIEW_ROOM_ID_BASE:int = 0x7FFF0000;


        public static function makeRoomPreviewerId(k:int):int
        {
            return (k & 0xFFFF) + PREVIEW_ROOM_ID_BASE;
        }

        public static function isRoomPreviewerId(k:int):Boolean
        {
            return k >= PREVIEW_ROOM_ID_BASE;
        }
    }
}
