package com.sulake.habbo.configuration.enum
{
    public class HabboComponentFlags 
    {
        public static const ROOM_VIEWER_MODE:int = 1;


        public static function isRoomViewerMode(k:int):Boolean
        {
            return !((k & ROOM_VIEWER_MODE) == 0);
        }
    }
}
