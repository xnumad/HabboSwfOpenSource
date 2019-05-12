package com.sulake.habbo.catalog.purse
{
    import com.sulake.core.runtime.IHabboConfigurationManager;

    public class ActivityPointTypeEnum 
    {
        public static const _Str_4627:int = 0;
        public static const _Str_17089:int = 3;
        public static const _Str_7340:int = 5;
        public static const SEASONAL_1:int = 101;
        public static const SEASONAL_2:int = 102;
        public static const SEASONAL_3:int = 103;
        public static const SEASONAL_4:int = 104;
        public static const SEASONAL_5:int = 105;
        public static const NO_OP_1:int = 1;
        public static const NO_OP_2:int = 2;
        public static const NO_OP_4:int = 4;


        public static function _Str_24355():Array
        {
            return [_Str_4627, SEASONAL_1, SEASONAL_2, SEASONAL_3, SEASONAL_4, SEASONAL_5, NO_OP_1, NO_OP_2, NO_OP_4];
        }

        public static function _Str_5251(k:int, _arg_2:IHabboConfigurationManager, _arg_3:Boolean, _arg_4:Boolean=false):int
        {
            var _local_5:String;
            if (k == -1)
            {
                return (_arg_3) ? 34 : 35;
            }
            if (k == _Str_4627)
            {
                return (_arg_3) ? 32 : 33;
            }
            if (k == _Str_17089)
            {
                return (_arg_3) ? 36 : 37;
            }
            if (k == _Str_7340)
            {
                if (_arg_2.getBoolean("diamonds.enabled"))
                {
                    return (_arg_3) ? 41 : 42;
                }
                return (_arg_3) ? 53 : 54;
            }
            _local_5 = (((("currencyiconstyle." + ((_arg_3) ? "big" : "small")) + ".") + k) + ((_arg_4) ? ".combo" : ""));
            return _arg_2.getInteger(_local_5, 0);
        }

        public static function _Str_2719(k:int):Boolean
        {
            if ([NO_OP_1, NO_OP_2, NO_OP_4].indexOf(k) != 1)
            {
                return false;
            }
            return true;
        }
    }
}
