package com.sulake.habbo.ui.widget.infostand
{
    public class TimeFormatUtil 
    {
        public static function _Str_22740(k:Number):String
        {
            var _local_2:uint = Math.floor(k);
            var _local_3:uint = Math.floor((_local_2 / 3600));
            var _local_4:int = (_local_3 * 3600);
            var _local_5:uint = ((_local_2 - _local_4) / 60);
            var _local_6:uint = ((_local_2 - _local_4) - (_local_5 * 60));
            var _local_7:* = (_local_3 + ":");
            var _local_8:* = ((((_local_5 < 10) ? "0" : "") + _local_5) + ":");
            var _local_9:String = (((_local_6 < 10) ? "0" : "") + _local_6);
            return (_local_7 + _local_8) + _local_9;
        }
    }
}
