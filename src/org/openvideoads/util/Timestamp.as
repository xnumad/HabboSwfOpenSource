package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;

    public class Timestamp extends Debuggable 
    {


        public static function validate(k:String):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:Array = k.split(":");
            return _local_2.length == 3;
        }

        public static function _Str_16820(k:String):String
        {
            if (k == null)
            {
                return "00:00:00";
            }
            return _Str_4110(int(k));
        }

        public static function _Str_25945(k:int):String
        {
            if (k < 10)
            {
                return "0" + k;
            }
            return "" + k;
        }

        public static function _Str_24782(k:String, _arg_2:Number):String
        {
            var _local_3:int;
            if (_arg_2 > 0)
            {
                _local_3 = timestampToSeconds(k);
                return _Str_4110((_local_3 + _arg_2));
            }
            return k;
        }

        public static function _Str_4110(k:Number):String
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            if (k > 0)
            {
                _local_2 = (k % 60);
                _local_3 = Math.floor(((k % 3600) / 60));
                _local_4 = Math.floor((k / (60 * 60)));
                _local_5 = (((_local_4 == 0) ? "00" : _Str_8262(_local_4)) + ":");
                _local_6 = (_Str_8262(_local_3) + ":");
                _local_7 = _Str_8262(_local_2);
                return (_local_5 + _local_6) + _local_7;
            }
            return "00:00:00";
        }

        private static function _Str_8262(k:uint):String
        {
            if (k < 10)
            {
                return "0" + k;
            }
            return String(k);
        }

        public static function timestampToSeconds(k:String):int
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split(":");
                if (_local_2.length == 3)
                {
                    return ((parseInt(_local_2[0]) * 3600) + (parseInt(_local_2[1]) * 60)) + parseInt(_local_2[2]);
                }
                return parseInt(k);
            }
            return 0;
        }

        public static function _Str_3314(k:String):String
        {
            return new String(Timestamp.timestampToSeconds(k));
        }
    }
}
