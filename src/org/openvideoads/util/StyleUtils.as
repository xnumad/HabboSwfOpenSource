package org.openvideoads.util
{
    public class StyleUtils 
    {


        public static function _Str_12804(k:String):uint
        {
            if (!k)
            {
                return 0xFFFFFF;
            }
            return parseInt(("0x" + k.substr(1)));
        }

        public static function _Str_11604(k:String):Array
        {
            return k.split(" ");
        }

        public static function _Str_26127(k:String, _arg_2:String):String
        {
            var _local_3:Array = _Str_11604(k);
            var _local_4:Number = 0;
            while (_local_4 < _local_3.length)
            {
                if (((_local_3[_local_4] is String) && (String(_local_3[_local_4]).indexOf(_arg_2) == 0)))
                {
                    return _local_3[_local_4] as String;
                }
                _local_4++;
            }
            return null;
        }
    }
}
