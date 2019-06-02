//com.sulake.habbo.utils.FriendlyTime

package com.sulake.habbo.utils{
    import com.sulake.habbo.localization.IHabboLocalizationManager;

    public class FriendlyTime {

        private static const MINUTE_IN_SECONDS:uint;
        private static const HOUR_IN_SECONDS:uint;
        private static const DAY_IN_SECONDS:uint;
        private static const WEEK_IN_SECONDS:uint;
        private static const MONTH_IN_SECONDS:uint;
        private static const YEAR_IN_SECONDS:uint;

        public function FriendlyTime();

        public static function getFriendlyTime(k:IHabboLocalizationManager, _arg_2:Number, _arg_3:String="", _arg_4:int=3):String;

        public static function getShortFriendlyTime(k:IHabboLocalizationManager, _arg_2:Number, _arg_3:String="", _arg_4:int=3):String;

        public static function getLocalization(k:IHabboLocalizationManager, _arg_2:String, _arg_3:int):String;


    }
}//package com.sulake.habbo.utils

