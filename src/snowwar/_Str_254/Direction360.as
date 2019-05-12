package snowwar._Str_254
{
	import com.sulake.core.runtime.IDisposable;

    public class Direction360 implements IDisposable 
    {
        private static const _SafeStr_22076:Number = 1;
        public static const N:int = 0;
        public static const NE:int = 45;
        public static const E:int = 90;
        public static const SE:int = 135;
        public static const S:int = 180;
        public static const SW:int = 225;
        public static const W:int = 270;
        public static const NW:int = 315;
        private static var _SafeStr_22077:Array = [[0, 4, 8, 13, 17, 22, 26, 31, 35, 40, 44, 48, 53, 57, 61, 66, 70, 74, 79, 83, 87, 91, 95, 100, 104, 108, 112, 116, 120, 124, 127, 131, 135, 139, 143, 146, 150, 154, 157, 161, 164, 167, 171, 174, 177, 181, 184, 187, 190, 193, 196, 198, 201, 204, 207, 209, 212, 214, 217, 219, 221, 223, 226, 228, 230, 232, 233, 235, 237, 238, 240, 242, 243, 244, 246, 247, 248, 249, 250, 251, 252, 252, 253, 254, 254, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x0100, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 254, 254, 253, 252, 252, 251, 250, 249, 248, 247, 246, 244, 243, 242, 240, 238, 237, 235, 233, 232, 230, 228, 226, 223, 221, 219, 217, 214, 212, 209, 207, 204, 201, 198, 196, 193, 190, 187, 184, 181, 177, 174, 171, 167, 164, 161, 157, 154, 150, 146, 143, 139, 135, 131, 127, 124, 120, 116, 112, 108, 104, 100, 95, 91, 87, 83, 79, 74, 70, 66, 61, 57, 53, 48, 44, 40, 35, 31, 26, 22, 17, 13, 8, 4, 0, -4, -8, -13, -17, -22, -26, -31, -35, -40, -44, -48, -53, -57, -61, -66, -70, -74, -79, -83, -87, -91, -95, -100, -104, -108, -112, -116, -120, -124, -128, -131, -135, -139, -143, -146, -150, -154, -157, -161, -164, -167, -171, -174, -177, -181, -184, -187, -190, -193, -196, -198, -201, -204, -207, -209, -212, -214, -217, -219, -221, -223, -226, -228, -230, -232, -233, -235, -237, -238, -240, -242, -243, -244, -246, -247, -248, -249, -250, -251, -252, -252, -253, -254, -254, -255, -255, -255, -255, -255, -256, -255, -255, -255, -255, -255, -254, -254, -253, -252, -252, -251, -250, -249, -248, -247, -246, -244, -243, -242, -240, -238, -237, -235, -233, -232, -230, -228, -226, -223, -221, -219, -217, -214, -212, -209, -207, -204, -201, -198, -196, -193, -190, -187, -184, -181, -177, -174, -171, -167, -164, -161, -157, -154, -150, -146, -143, -139, -135, -131, -128, -124, -120, -116, -112, -108, -104, -100, -95, -91, -87, -83, -79, -74, -70, -66, -61, -57, -53, -48, -44, -40, -35, -31, -26, -22, -17, -13, -8, -4], [-256, -255, -255, -255, -255, -255, -254, -254, -253, -252, -252, -251, -250, -249, -248, -247, -246, -244, -243, -242, -240, -238, -237, -235, -233, -232, -230, -228, -226, -223, -221, -219, -217, -214, -212, -209, -207, -204, -201, -198, -196, -193, -190, -187, -184, -181, -177, -174, -171, -167, -164, -161, -157, -154, -150, -146, -143, -139, -135, -131, -128, -124, -120, -116, -112, -108, -104, -100, -95, -91, -87, -83, -79, -74, -70, -66, -61, -57, -53, -48, -44, -40, -35, -31, -26, -22, -17, -13, -8, -4, 0, 4, 8, 13, 17, 22, 26, 31, 35, 40, 44, 48, 53, 57, 61, 66, 70, 74, 79, 83, 87, 91, 95, 100, 104, 108, 112, 116, 120, 124, 127, 131, 135, 139, 143, 146, 150, 154, 157, 161, 164, 167, 171, 174, 177, 181, 184, 187, 190, 193, 196, 198, 201, 204, 207, 209, 212, 214, 217, 219, 221, 223, 226, 228, 230, 232, 233, 235, 237, 238, 240, 242, 243, 244, 246, 247, 248, 249, 250, 251, 252, 252, 253, 254, 254, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x0100, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 254, 254, 253, 252, 252, 251, 250, 249, 248, 247, 246, 244, 243, 242, 240, 238, 237, 235, 233, 232, 230, 228, 226, 223, 221, 219, 217, 214, 212, 209, 207, 204, 201, 198, 196, 193, 190, 187, 184, 181, 177, 174, 171, 167, 164, 161, 157, 154, 150, 146, 143, 139, 135, 131, 128, 124, 120, 116, 112, 108, 104, 100, 95, 91, 87, 83, 79, 74, 70, 66, 61, 57, 53, 48, 44, 40, 35, 31, 26, 22, 17, 13, 8, 4, 0, -4, -8, -13, -17, -22, -26, -31, -35, -40, -44, -48, -53, -57, -61, -66, -70, -74, -79, -83, -87, -91, -95, -100, -104, -108, -112, -116, -120, -124, -128, -131, -135, -139, -143, -146, -150, -154, -157, -161, -164, -167, -171, -174, -177, -181, -184, -187, -190, -193, -196, -198, -201, -204, -207, -209, -212, -214, -217, -219, -221, -223, -226, -228, -230, -232, -233, -235, -237, -238, -240, -242, -243, -244, -246, -247, -248, -249, -250, -251, -252, -252, -253, -254, -254, -255, -255, -255, -255, -255]];
        private static var _SafeStr_22059:Array = [0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 30, 30, 30, 30, 30, 30, 31, 31, 31, 31, 31, 31, 32, 32, 32, 32, 32, 32, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 36, 36, 37, 37, 37, 37, 37, 37, 37, 38, 38, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 39, 39, 39, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45];

        private var _SafeStr_22080:int = 0;
        private var _SafeStr_5041:Boolean = false;

        public function Direction360(k:int)
        {
            this._SafeStr_22080 = k;
        }

        public static function validateDirection360Value(k:int):int
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

        public static function direction360ValueToDirection8(k:int):Direction8
        {
            return Direction8.fromIndex(Direction8.validateDirection8Value((_SafeStr_4667._SafeStr_18698((validateDirection360Value((k - 22)) / 45)) + 1)));
        }

        public static function direction8ToDirection360Value(k:Direction8):int
        {
            switch (k.index())
            {
                case 0:
                    return Direction360.N;
                case 1:
                    return Direction360.NE;
                case 2:
                    return Direction360.E;
                case 3:
                    return Direction360.SE;
                case 4:
                    return Direction360.S;
                case 5:
                    return Direction360.SW;
                case 6:
                    return Direction360.W;
                case 7:
                    return Direction360.NW;
            }
            return -1;
        }

        public static function _SafeStr_19045(k:int):int
        {
            k = validateDirection360Value(k);
            return _SafeStr_22077[0][k];
        }

        public static function _SafeStr_19046(k:int):int
        {
            k = validateDirection360Value(k);
            return _SafeStr_22077[1][k];
        }

        public static function _SafeStr_18792(k:int, _arg_2:int):int
        {
            var _local_3:int;
            if (_SafeStr_22078(k) <= _SafeStr_22078(_arg_2))
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

        public static function _SafeStr_22078(k:int):int
        {
            if (k < 0)
            {
                return -(k);
            }
            return k;
        }

        private static function _SafeStr_22079(k:int, _arg_2:int):int
        {
            return int(Math.atan2(Number(k), ((Number(_arg_2) * 57.295) + 0.5)));
        }


        public function dispose():void
        {
            this._SafeStr_5041 = true;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        public function index():int
        {
            return this._SafeStr_22080;
        }

        public function _SafeStr_19043(k:int):void
        {
            this._SafeStr_22080 = validateDirection360Value(k);
        }

        public function _SafeStr_18854(k:int):void
        {
            this._SafeStr_22080 = (this._SafeStr_22080 + k);
            this._SafeStr_22080 = validateDirection360Value(this._SafeStr_22080);
        }

        public function toString():String
        {
            return ("[" + this._SafeStr_22080) + "]";
        }

        public function direction8Value():Direction8
        {
            return direction360ValueToDirection8(this._SafeStr_22080);
        }

        public function _SafeStr_19045():int
        {
            return _SafeStr_22077[0][this._SafeStr_22080];
        }

        public function _SafeStr_19046():int
        {
            return _SafeStr_22077[1][this._SafeStr_22080];
        }
    }
}
