//com.sulake.habbo.catalog.purse.ActivityPointTypeEnum

package com.sulake.habbo.catalog.purse{
    import com.sulake.core.runtime.ICoreConfiguration;

    public class ActivityPointTypeEnum {

        public static const DUCKET:int;
        public static const SUBSCRIPTION_GIFT_POINTS:int;
        public static const LOYALTY:int;
        public static const SEASONAL_1:int;
        public static const SEASONAL_2:int;
        public static const SEASONAL_3:int;
        public static const SEASONAL_4:int;
        public static const SEASONAL_5:int;
        public static const NO_OP_1:int;
        public static const NO_OP_2:int;
        public static const NO_OP_4:int;

        public function ActivityPointTypeEnum();

        public static function values():Array;

        public static function getIconStyleFor(k:int, _arg_2:ICoreConfiguration, _arg_3:Boolean, _arg_4:Boolean=false):int;

        public static function isVisible(k:int):Boolean;


    }
}//package com.sulake.habbo.catalog.purse

