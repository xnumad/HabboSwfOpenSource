package org.openvideoads.util
{
    import adobe.serialization.json.JSON;

    public class ArrayUtils 
    {


        public static function _Str_8734(k:Object):Array
        {
            var _local_2:*;
            if ((k is Array))
            {
                return k as Array;
            }
            if ((k is String))
            {
                _local_2 = adobe.serialization.json.JSON.decode((k as String));
                if ((_local_2 is Array))
                {
                    return _local_2;
                }
                if ((_local_2 is String))
                {
                    return _local_2.split(",");
                }
            }
            return new Array();
        }

        public static function toUpperCase(k:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = new Array();
            if (k != null)
            {
                _local_3 = 0;
                while (_local_3 < k.length)
                {
                    if ((k[_local_3] is String))
                    {
                        _local_2.push(k[_local_3].toUpperCase());
                    }
                    else
                    {
                        _local_2.push(k[_local_3].toJSObject());
                    }
                    _local_3++;
                }
            }
            return _local_2;
        }

        public static function _Str_6975(k:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = new Array();
            if (k != null)
            {
                _local_3 = 0;
                while (_local_3 < k.length)
                {
                    _local_2.push(k[_local_3].toJSObject());
                    _local_3++;
                }
            }
            return _local_2;
        }
    }
}
