package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;

    public class RoomEntryUtils 
    {


        public static function _Str_25339(k:int):String
        {
            switch (k)
            {
                case RoomSettingsData.DOORMODE_CLOSED:
                    return "newnavigator_doormode_doorbell_small";
                case RoomSettingsData.DOORMODE_PASSWORD:
                    return "newnavigator_doormode_password_small";
                case RoomSettingsData.DOORMODE_INVISIBLE:
                    return "newnavigator_doormode_invisible_small";
            }
            return "";
        }

        public static function _Str_24293(k:int, _arg_2:uint):uint
        {
            if (k == -1)
            {
                return _arg_2;
            }
            var _local_3:Number = (uint(((0xFF0000 & _arg_2) >> 16)) / 0xFF);
            var _local_4:Number = (uint(((0xFF00 & _arg_2) >> 8)) / 0xFF);
            var _local_5:Number = (uint((0xFF & _arg_2)) / 0xFF);
            var _local_6:Number = (uint(((0xFF0000 & k) >> 16)) / 0xFF);
            var _local_7:Number = (uint(((0xFF00 & k) >> 8)) / 0xFF);
            var _local_8:Number = (uint((0xFF & k)) / 0xFF);
            var _local_9:Number = (_local_3 * Math.min(1, (_local_6 * 1.5)));
            var _local_10:Number = (_local_4 * Math.min(1, (_local_7 * 1.5)));
            var _local_11:Number = (_local_5 * Math.min(1, (_local_8 * 1.5)));
            var _local_12:uint = ((((uint((_local_9 * 0xFF)) << 16) + (uint((_local_10 * 0xFF)) << 8)) + uint((_local_11 * 0xFF))) + 0xFF000000);
            return _local_12;
        }

        public static function _Str_25708(k:Boolean):String
        {
            return "newnavigator_icon_fav_" + ((k) ? "yes" : "no");
        }
    }
}
