package snowwar._Str_254
{
    public class Direction8 
    {
        public static var DIRECTIONS:Array = [];
        public static const N:Direction8 = new Direction8(0, "N", 0, -1);
        public static const NE:Direction8 = new Direction8(1, "NE", 1, -1);
        public static const E:Direction8 = new Direction8(2, "E", 1, 0);
        public static const SE:Direction8 = new Direction8(3, "SE", 1, 1);
        public static const S:Direction8 = new Direction8(4, "S", 0, 1);
        public static const SW:Direction8 = new Direction8(5, "SW", -1, 1);
        public static const W:Direction8 = new Direction8(6, "W", -1, 0);
        public static const NW:Direction8 = new Direction8(7, "NW", -1, -1);
        public static const _SafeStr_22057:Direction8 = S;
        public static const _SafeStr_22058:Direction8 = SW;
        private static var _SafeStr_22059:Array = [0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 30, 30, 30, 30, 30, 30, 31, 31, 31, 31, 31, 31, 32, 32, 32, 32, 32, 32, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 36, 36, 37, 37, 37, 37, 37, 37, 37, 38, 38, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 39, 39, 39, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45];

        private var _index:int;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _code:String;

        public function Direction8(index:int, code:String, offsetX:int, offsetY:int)
        {
            this._index = index;
            this._code = code;
            this._offsetX = offsetX;
            this._offsetY = offsetY;
            DIRECTIONS[index] = this;
        }

        public static function fromIndex(k:int):Direction8 //_SafeStr_18744
        {
            if (((k < 0) || (k > 7)))
            {
                return null;
            }
            return DIRECTIONS[k];
        }

        public static function validateDirection8Value(k:int):int
        {
            return k & 0x07;
        }

        public static function directionFromPointToPoint(fromX:int, fromY:int, toX:int, toY:int):Direction8 //_SafeStr_22060
        {
            var dX:int = (toX - fromX);
            var dY:int = (toY - fromY);
            if (((dX == 0) && (dY < 0)))
            {
                return N;
            }
            if (((dX == 0) && (dY > 0)))
            {
                return S;
            }
            if (((dX > 0) && (dY < 0)))
            {
                return NE;
            }
            if (((dX > 0) && (dY == 0)))
            {
                return E;
            }
            if (((dX > 0) && (dY > 0)))
            {
                return SE;
            }
            if (((dX < 0) && (dY < 0)))
            {
                return NW;
            }
            if (((dX < 0) && (dY == 0)))
            {
                return W;
            }
            if (((dX < 0) && (dY > 0)))
            {
                return SW;
            }
            return null;
        }

        private static function validateDirection360Value(k:int):int
        {
            if (k > 359)
            {
                k = (k % 360);
            }
            else
            {
                if (k < 0)
                {
                    k = (360 + (k % 360));
                }
            }
            return k;
        }

        private static function _SafeStr_18792(k:int, _arg_2:int):int
        {
            var _local_3:int;
            if (Math.abs(k) <= Math.abs(_arg_2))
            {
                if (_arg_2 == 0)
                {
                    _arg_2 = 1;
                }
                k = (k * 0x0100);
                _local_3 = _SafeStr_4667._SafeStr_18698((k / _arg_2));
                if (_local_3 < 0)
                {
                    _local_3 = -(_local_3);
                }
                if (_local_3 > 0xFF)
                {
                    _local_3 = 0xFF;
                }
                if (_arg_2 < 0)
                {
                    if (k > 0)
                    {
                        return _SafeStr_22059[_local_3];
                    }
                    return 360 - _SafeStr_22059[_local_3];
                }
                if (k > 0)
                {
                    return 180 - _SafeStr_22059[_local_3];
                }
                return 180 + _SafeStr_22059[_local_3];
            }
            if (k == 0)
            {
                k = 1;
            }
            _arg_2 = (_arg_2 * 0x0100);
            _local_3 = _SafeStr_4667._SafeStr_18698((_arg_2 / k));
            if (_local_3 < 0)
            {
                _local_3 = -(_local_3);
            }
            if (_local_3 > 0xFF)
            {
                _local_3 = 0xFF;
            }
            if (_arg_2 < 0)
            {
                if (k > 0)
                {
                    return 90 - _SafeStr_22059[_local_3];
                }
                return 270 + _SafeStr_22059[_local_3];
            }
            if (k > 0)
            {
                return 90 + _SafeStr_22059[_local_3];
            }
            return 270 - _SafeStr_22059[_local_3];
        }


        public function index():int //index
        {
            return this._index;
        }

        public function rotateDirection180Degrees():Direction8 //_SafeStr_18699
        {
            return this._SafeStr_18854(4);
        }

        public function rotateDirection45Degrees(k:Boolean):Direction8
        {
            return this._SafeStr_18854(((k) ? 1 : -1));
        }

        public function rotateDirection90Degrees(k:Boolean):Direction8
        {
            return this._SafeStr_18854(((k) ? 2 : -2));
        }

        public function _SafeStr_18701():Boolean
        {
            return (this._index % 2) == 0;
        }

        public function _SafeStr_18790():int //Maybe hashcode just like Location._SafeStr_18790
        {
            return this._index;
        }

        public function _SafeStr_18854(k:int):Direction8
        {
            var _local_2:int = (this._index + k);
            _local_2 = validateDirection8Value(_local_2);
            return DIRECTIONS[_local_2];
        }

        public function toString():String
        {
            return ((this._code + "(") + this._index.toString()) + ")";
        }

        public function code():String //_SafeStr_22064
        {
            return this._code;
        }

        public function offsetX():int //_SafeStr_18738
        {
            return this._offsetX;
        }

        public function offsetY():int //_SafeStr_18739
        {
            return this._offsetY;
        }
    }
}
