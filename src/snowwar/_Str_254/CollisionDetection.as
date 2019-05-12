package snowwar._Str_254
{
    public class CollisionDetection 
    {
        public static const _SafeStr_22164:int = 0;
        public static const _SafeStr_22165:int = 1;
        public static const _SafeStr_18853:int = 2;
        public static const _SafeStr_22166:int = 3;
        public static const _SafeStr_22167:int = 4;
        public static const _SafeStr_22168:int = 0;
        public static const _SafeStr_22169:int = 1;
        public static const _SafeStr_22170:int = 2;
        public static const _SafeStr_22171:int = 3;
        public static const _SafeStr_22172:int = 4;
        public static const _SafeStr_22173:int = 5;

        public static function _SafeStr_18806(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            if (_arg_2 == k)
            {
                return false;
            }
            switch (_arg_2.boundingType)
            {
                case _SafeStr_22164:
                    break;
                case _SafeStr_22165:
                    break;
                case _SafeStr_18853:
                    switch (k.boundingType)
                    {
                        case _SafeStr_22165:
                            if (_SafeStr_22174(k, _arg_2))
                            {
                                return true;
                            }
                            break;
                        case _SafeStr_18853:
                            if (_SafeStr_22175(k, _arg_2))
                            {
                                return true;
                            }
                            break;
                        case _SafeStr_22167:
                            if (_SafeStr_22176(_arg_2, k))
                            {
                                return true;
                            }
                            break;
                    }
                    break;
                case _SafeStr_22167:
                    switch (k.boundingType)
                    {
                        case _SafeStr_22165:
                            if (_SafeStr_22177(k, _arg_2))
                            {
                                return true;
                            }
                            break;
                        case _SafeStr_18853:
                            if (_SafeStr_22176(k, _arg_2))
                            {
                                return true;
                            }
                            break;
                        case _SafeStr_22167:
                            if (_SafeStr_22178(k, _arg_2))
                            {
                                return true;
                            }
                            break;
                    }
                    break;
                case _SafeStr_22166:
                    if (k.boundingType == _SafeStr_22165)
                    {
                        if (_SafeStr_22179(k, _arg_2))
                        {
                            return true;
                        }
                    }
                    break;
            }
            return false;
        }

        private static function _SafeStr_22174(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            return k.location3D._SafeStr_18791(_arg_2.location3D, _arg_2.boundingData[0]);
        }

        private static function _SafeStr_22179(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            var _local_3:Array = _arg_2.boundingData;
            if (((((k.location3D.x > (_arg_2.location3D.x + _local_3[0])) && (k.location3D.x < (_arg_2.location3D.x + _local_3[2]))) && (k.location3D.y > (_arg_2.location3D.y + _local_3[1]))) && (k.location3D.y < (_arg_2.location3D.y + _local_3[3]))))
            {
                return true;
            }
            return false;
        }

        private static function _SafeStr_22175(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            return k.location3D._SafeStr_18791(_arg_2.location3D, (k.boundingData[0] + _arg_2.boundingData[0]));
        }

        private static function _SafeStr_22177(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            var _local_3:int = _SafeStr_22078((_arg_2.location3D.x - k.location3D.x));
            if (_local_3 > _arg_2.boundingData[5])
            {
                return false;
            }
            var _local_4:int = _SafeStr_22078((_arg_2.location3D.y - k.location3D.y));
            if (_local_4 > _arg_2.boundingData[5])
            {
                return false;
            }
            var _local_5:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[3]) / 0x0100)));
            var _local_6:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[3]) / 0x0100)));
            if (Location._SafeStr_18786(_local_5, _local_6, k.location3D.x, k.location3D.y, _arg_2.boundingData[0]))
            {
                return true;
            }
            if (Location._SafeStr_18786(_arg_2.location3D.x, _arg_2.location3D.y, k.location3D.x, k.location3D.y, _arg_2.boundingData[1]))
            {
                return true;
            }
            var _local_7:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[4]) / 0x0100)));
            var _local_8:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[4]) / 0x0100)));
            if (Location._SafeStr_18786(_local_7, _local_8, k.location3D.x, k.location3D.y, _arg_2.boundingData[2]))
            {
                return true;
            }
            return false;
        }

        private static function _SafeStr_22176(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            var _local_3:int = _SafeStr_22078((_arg_2.location3D.x - k.location3D.x));
            if (_local_3 > (k.boundingData[0] + _arg_2.boundingData[5]))
            {
                return false;
            }
            var _local_4:int = _SafeStr_22078((_arg_2.location3D.y - k.location3D.y));
            if (_local_4 > (k.boundingData[0] + _arg_2.boundingData[5]))
            {
                return false;
            }
            var _local_5:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[3]) / 0x0100)));
            var _local_6:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[3]) / 0x0100)));
            if (Location._SafeStr_18786(_local_5, _local_6, k.location3D.x, k.location3D.y, (_arg_2.boundingData[0] + k.boundingData[0])))
            {
                return true;
            }
            if (Location._SafeStr_18786(_arg_2.location3D.x, _arg_2.location3D.y, k.location3D.x, k.location3D.y, (_arg_2.boundingData[1] + k.boundingData[0])))
            {
                return true;
            }
            var _local_7:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[4]) / 0x0100)));
            var _local_8:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[4]) / 0x0100)));
            if (Location._SafeStr_18786(_local_7, _local_8, k.location3D.x, k.location3D.y, (_arg_2.boundingData[2] + k.boundingData[0])))
            {
                return true;
            }
            return false;
        }

        private static function _SafeStr_22178(k:_SafeStr_4030, _arg_2:_SafeStr_4030):Boolean
        {
            var _local_3:int = _SafeStr_22078((_arg_2.location3D.x - k.location3D.x));
            if (_local_3 > (k.boundingData[_SafeStr_22173] + _arg_2.boundingData[_SafeStr_22173]))
            {
                return false;
            }
            var _local_4:int = _SafeStr_22078((_arg_2.location3D.y - k.location3D.y));
            if (_local_4 > (k.boundingData[_SafeStr_22173] + _arg_2.boundingData[_SafeStr_22173]))
            {
                return false;
            }
            var _local_5:int = (k.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(k.direction360.index()) * k.boundingData[_SafeStr_22171]) / 0x0100)));
            var _local_6:int = (k.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(k.direction360.index()) * k.boundingData[_SafeStr_22171]) / 0x0100)));
            var _local_7:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[_SafeStr_22171]) / 0x0100)));
            var _local_8:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[_SafeStr_22171]) / 0x0100)));
            if (Location._SafeStr_18786(_local_5, _local_6, _local_7, _local_8, (k.boundingData[_SafeStr_22168] + _arg_2.boundingData[_SafeStr_22168])))
            {
                return true;
            }
            if (Location._SafeStr_18786(_local_5, _local_6, _arg_2.location3D.x, _arg_2.location3D.y, (k.boundingData[_SafeStr_22168] + _arg_2.boundingData[_SafeStr_22169])))
            {
                return true;
            }
            var _local_9:int = (_arg_2.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(_arg_2.direction360.index()) * _arg_2.boundingData[_SafeStr_22172]) / 0x0100)));
            var _local_10:int = (_arg_2.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(_arg_2.direction360.index()) * _arg_2.boundingData[_SafeStr_22172]) / 0x0100)));
            if (Location._SafeStr_18786(_local_5, _local_6, _local_9, _local_10, (k.boundingData[_SafeStr_22168] + _arg_2.boundingData[_SafeStr_22170])))
            {
                return true;
            }
            if (Location._SafeStr_18786(k.location3D.x, k.location3D.y, _local_7, _local_8, (k.boundingData[_SafeStr_22169] + _arg_2.boundingData[_SafeStr_22168])))
            {
                return true;
            }
            if (Location._SafeStr_18786(k.location3D.x, k.location3D.y, _arg_2.location3D.x, _arg_2.location3D.y, (k.boundingData[_SafeStr_22169] + _arg_2.boundingData[_SafeStr_22169])))
            {
                return true;
            }
            if (Location._SafeStr_18786(k.location3D.x, k.location3D.y, _local_9, _local_10, (k.boundingData[_SafeStr_22169] + _arg_2.boundingData[_SafeStr_22170])))
            {
                return true;
            }
            var _local_11:int = (k.location3D.x + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19045(k.direction360.index()) * k.boundingData[_SafeStr_22172]) / 0x0100)));
            var _local_12:int = (k.location3D.y + _SafeStr_4667._SafeStr_18698(((Direction360._SafeStr_19046(k.direction360.index()) * k.boundingData[_SafeStr_22172]) / 0x0100)));
            if (Location._SafeStr_18786(_local_11, _local_12, _local_7, _local_8, (k.boundingData[_SafeStr_22170] + _arg_2.boundingData[_SafeStr_22168])))
            {
                return true;
            }
            if (Location._SafeStr_18786(_local_11, _local_12, _arg_2.location3D.x, _arg_2.location3D.y, (k.boundingData[_SafeStr_22170] + _arg_2.boundingData[_SafeStr_22169])))
            {
                return true;
            }
            if (Location._SafeStr_18786(_local_11, _local_12, _local_9, _local_10, (k.boundingData[_SafeStr_22170] + _arg_2.boundingData[_SafeStr_22170])))
            {
                return true;
            }
            return false;
        }

        protected static function _SafeStr_22078(k:int):int
        {
            if (k < 0)
            {
                return -(k);
            }
            return k;
        }
    }
}
