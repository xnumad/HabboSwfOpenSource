package com.sulake.habbo.utils
{
    public class StringUtil 
    {
        private static const characters:Array = ["p", "e", ",", "i", '"', "r", "", "m", "o", "}", "n", "g", "", "{", "x", "l", ":", "q", "a", "c", ":", "s", "o", " ", "(", "", "p", "t", "i", "v", "h", "f", "", " ", "c", "d", "", "k", ")", "s", "z", "", "y", "w", "b", "-", "t", "j", "", "u", ":", ".", " ", "a", '"', '"', "e", "m", " ", ","];


        public static function _Str_25959(k:String, _arg_2:int):String
        {
            while (k.length < _arg_2)
            {
                k = ("0" + k);
            }
            return k;
        }

        public static function _Str_26117(k:String):String
        {
            var _local_2:RegExp = new RegExp("<font[^>]*>", "ig");
            k = k.replace(_local_2, "");
            var _local_3:RegExp = new RegExp("</font>", "ig");
            k = k.replace(_local_3, "");
            return k;
        }

        public static function trim(k:String):String
        {
            return (k) ? k.replace(/^\s+|\s+$/gs, "") : "";
        }

        public static function _Str_26259(k:String):String
        {
            return (k) ? k.replace(/ /gs, "") : "";
        }

        public static function _Str_26084(k:String):String
        {
            return k.toLowerCase().replace(/\W/g, "");
        }

        public static function _Str_25429(k:String):String
        {
            return (k == null) ? "" : k;
        }

        public static function isEmpty(k:String):Boolean
        {
            return (k == null) || (k.length == 0);
        }

        public static function _Str_5503(k:int, ... _args):String
        {
            var _local_3:String = "";
            var _local_4:int;
            while (_local_4 < _args.length)
            {
                _local_3 = (_local_3 + characters[(_args[_local_4] - k)]);
                _local_4++;
            }
            return _local_3;
        }
    }
}
