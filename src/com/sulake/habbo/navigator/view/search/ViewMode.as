package com.sulake.habbo.navigator.view.search
{
    public class ViewMode 
    {
        public static const MYWORLD_VIEW:String = "myworld_view";
        public static const HOTEL_VIEW:String = "hotel_view";
        public static const OFFICIAL_VIEW:String = "official_view";
        public static const ROOMADS_VIEW:String = "roomads_view";
        public static const NEW_ADS:String = "new_ads";
        public static const EVENTCATEGORY__:String = "eventcategory__";
        public static const _Str_16624:int = 0;
        public static const _Str_17823:int = 1;
        public static const _Str_17120:int = 2;
        public static const _Str_12908:int = 3;
        public static const _Str_12044:int = 4;


        public static function _Str_20005(k:String):int
        {
            if (k == OFFICIAL_VIEW)
            {
                return _Str_16624;
            }
            if (k == MYWORLD_VIEW)
            {
                return _Str_17823;
            }
            if (k == ROOMADS_VIEW)
            {
                return _Str_12908;
            }
            if (k == NEW_ADS)
            {
                return _Str_12044;
            }
            if (k.indexOf(EVENTCATEGORY__) == 0)
            {
                return _Str_12044;
            }
            return _Str_17120;
        }

        public static function _Str_25096(k:int):Boolean
        {
            return (k == _Str_12908) || (k == _Str_12044);
        }
    }
}
