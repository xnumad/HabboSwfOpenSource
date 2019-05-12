package org.openvideoads.util
{
    public class NumberUtils 
    {


        private static function _Str_4080(k:String, _arg_2:String):Number
        {
            if (_arg_2.indexOf(k) <= 0)
            {
                return NaN;
            }
            return Number(_arg_2.substring(0, _arg_2.indexOf(k)));
        }

        public static function _Str_5288(k:*):Number
        {
            if ((k is Number))
            {
                return Math.round(k);
            }
            if (k.indexOf("px") < 0)
            {
                k = (k + "px");
            }
            var _local_2:Number = _Str_4080("px", k);
            if (isNaN(_local_2))
            {
                return k.substr(0) as Number;
            }
            return Math.round(_local_2);
        }

        public static function _Str_26058(k:*):Number
        {
            if ((k is Number))
            {
                return k;
            }
            if (k.indexOf("pct") > -1)
            {
                return _Str_4080("pct", k);
            }
            return _Str_4080("%", k);
        }
    }
}
