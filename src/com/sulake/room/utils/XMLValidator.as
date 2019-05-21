package com.sulake.room.utils
{
    public class XMLValidator 
    {
        public static function checkRequiredAttributes(k:Object, _arg_2:Array):Boolean
        {
            var _local_4:XML;
            var _local_5:XMLList;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_3:int;
            if ((k is XML))
            {
                _local_4 = (k as XML);
                _local_3 = 0;
                while (_local_3 < _arg_2.length)
                {
                    if (_local_4.attribute(String(_arg_2[_local_3])).length() == 0)
                    {
                        return false;
                    }
                    _local_3++;
                }
            }
            else
            {
                if ((k is XMLList))
                {
                    _local_5 = (k as XMLList);
                    _local_3 = 0;
                    while (_local_3 < _arg_2.length)
                    {
                        if (_local_4.attribute(String(_arg_2[_local_3])).length() == 0)
                        {
                            return false;
                        }
                        _local_3++;
                    }
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
    }
}
