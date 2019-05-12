package com.sulake.habbo.utils
{
    import com.sulake.habbo.localization.IHabboLocalizationManager;

    public class FriendlyTime 
    {
        private static const MINUTE:uint = 60;
        private static const HOUR:uint = (60 * MINUTE);//3600
        private static const DAY:uint = (24 * HOUR);//86400
        private static const WEEK:uint = (7 * DAY);//604800
        private static const MONTH:uint = (30 * DAY);//0x278D00
        private static const YEAR:uint = (365 * DAY);//31536000


        public static function format(localization:IHabboLocalizationManager, seconds:Number, key:String="", threshold:int=3):String
        {
            if (seconds > (threshold * YEAR))
            {
                return getLocalization(localization, ("friendlytime.years" + key), Math.round((seconds / YEAR)));
            }
            if (seconds > (threshold * MONTH))
            {
                return getLocalization(localization, ("friendlytime.months" + key), Math.round((seconds / MONTH)));
            }
            if (seconds > (threshold * DAY))
            {
                return getLocalization(localization, ("friendlytime.days" + key), Math.round((seconds / DAY)));
            }
            if (seconds > (threshold * HOUR))
            {
                return getLocalization(localization, ("friendlytime.hours" + key), Math.round((seconds / HOUR)));
            }
            if (seconds > (threshold * MINUTE))
            {
                return getLocalization(localization, ("friendlytime.minutes" + key), Math.round((seconds / MINUTE)));
            }
            return getLocalization(localization, ("friendlytime.seconds" + key), Math.round(seconds));
        }

        public static function shortFormat(k:IHabboLocalizationManager, _arg_2:Number, _arg_3:String="", _arg_4:int=3):String
        {
            if (_arg_2 > (_arg_4 * YEAR))
            {
                return getLocalization(k, ("friendlytime.years.short" + _arg_3), Math.round((_arg_2 / YEAR)));
            }
            if (_arg_2 > (_arg_4 * MONTH))
            {
                return getLocalization(k, ("friendlytime.months.short" + _arg_3), Math.round((_arg_2 / MONTH)));
            }
            if (_arg_2 > (_arg_4 * DAY))
            {
                return getLocalization(k, ("friendlytime.days.short" + _arg_3), Math.round((_arg_2 / DAY)));
            }
            if (_arg_2 > (_arg_4 * HOUR))
            {
                return getLocalization(k, ("friendlytime.hours.short" + _arg_3), Math.round((_arg_2 / HOUR)));
            }
            if (_arg_2 > (_arg_4 * MINUTE))
            {
                return getLocalization(k, ("friendlytime.minutes.short" + _arg_3), Math.round((_arg_2 / MINUTE)));
            }
            return getLocalization(k, ("friendlytime.seconds.short" + _arg_3), Math.round(_arg_2));
        }

        public static function getLocalization(k:IHabboLocalizationManager, _arg_2:String, _arg_3:int):String
        {
            return k.getLocalizationWithParams(_arg_2, _arg_2, "amount", _arg_3.toString());
        }
    }
}
