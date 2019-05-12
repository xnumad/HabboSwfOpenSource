package com.sulake.habbo.communication.demo.utils
{
    public class KeyObfuscator 
    {
        private static var _Str_10063:Array = [(((("%1F%0E@%5D%0Cn%0ARu%17cBP%0E-_Qi%5B%16%1D%1B%7BYX%03Ba%1BfU%1F@%23%10SWWJo" + "%11%1A%19r%5D%17m%01R6%23lZmX%087B%1D%13BQMX%0DbR%01uNhG%00%5E%7B_%0AmTJO%19u%5B%0FT%10fMmQ%1D%1BrM%02PP%1C%3B%") + "14KMsY%17m%02W4v%3E%5Ea%5BXbE%14@%1DU%12%0F%06g%02%04%7EK%3EBV%0C-%04%0Ag%0F%1E%1DNs%0D%5EW%10%60%18g%07%10%10t%") + "1E%05%02%08Ko%15%1AI%20%5CChVZ2%22n%0F%3C%05%097%10H%14%1D%03%10%08Pb%06T/IcCP%0FqS_j%0FN%1EIu%5C%5CS%1A3%18b%07%") + "10%1B%26J%00%02%06%18n%10%19%1D%25%08Il%0CQiwl%0Bl%5C%5C0%16%19%15%1EUMZ%0Cd%06Uz%1C%3E%15%05_%7D%5E"), "J%07D%09%05"];


        private static function _Str_573(k:String):String
        {
            return _Str_11274(_Str_11274(k));
        }

        private static function _Str_11274(k:String):String
        {
            var _local_2:String = "{7t94V37M/[wcjIgh^m/|*Cii6#QzT0)\"E(a51yZ'||Ciq_4cPAX<X=:S$-w";
            var _local_3:Array = new Array();
            var _local_4:int;
            while (_local_4 < k.length)
            {
                _local_3.push(String.fromCharCode((k.charCodeAt(_local_4) ^ _local_2.charCodeAt((_local_4 % _local_2.length)))));
                _local_4++;
            }
            return _local_3.join("");
        }

        public static function _Str_23865():Array
        {
            return _Str_10063;
        }

        public static function _Str_24303():String
        {
            return _Str_573(_Str_10063[0]);
        }

        public static function _Str_22440():String
        {
            return _Str_573(_Str_10063[1]);
        }
    }
}
