package com.sulake.habbo.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import __AS3__.vec.Vector;

    public class Canvas extends BitmapData 
    {
        public function Canvas(k:int, _arg_2:int, _arg_3:Boolean=true, _arg_4:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        private static function _Str_22323(k:Point, _arg_2:Point):int
        {
            if (k.y > _arg_2.y)
            {
                return 1;
            }
            if (k.y < _arg_2.y)
            {
                return -1;
            }
            return 0;
        }

        private static function _Str_23302(k:BitmapData, _arg_2:Point, _arg_3:int, _arg_4:int, _arg_5:uint):uint
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:uint;
            if (k)
            {
                _local_6 = (_arg_3 - _arg_2.x);
                _local_7 = (_arg_4 - _arg_2.y);
                _local_8 = (_local_6 % k.width);
                _local_9 = ((_local_7 + (_local_6 / 2)) % k.height);
                _local_10 = k.getPixel32(_local_8, _local_9);
                return colorize(_local_10, _arg_5);
            }
            return _arg_5;
        }

        private static function _Str_24365(k:BitmapData, _arg_2:Point, _arg_3:int, _arg_4:int, _arg_5:uint):uint
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:uint;
            if (k)
            {
                _local_6 = (_arg_3 - _arg_2.x);
                _local_7 = (_arg_4 - _arg_2.y);
                _local_8 = (_local_6 % k.width);
                _local_9 = ((_local_7 - (_local_6 / 2)) % k.height);
                _local_10 = k.getPixel32(_local_8, _local_9);
                return colorize(_local_10, _arg_5);
            }
            return _arg_5;
        }

        private static function _Str_25009(k:BitmapData, _arg_2:Point, _arg_3:int, _arg_4:int, _arg_5:uint):uint
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:uint;
            if (k)
            {
                _local_6 = (_arg_3 - _arg_2.x);
                _local_7 = (_arg_4 - _arg_2.y);
                _local_8 = ((_local_7 + (_local_6 / 2)) % k.width);
                _local_9 = ((_local_7 - (_local_6 / 2)) % k.height);
                _local_10 = k.getPixel32(_local_8, _local_9);
                return colorize(_local_10, _arg_5);
            }
            return _arg_5;
        }

        public static function colorize(k:uint, _arg_2:uint):uint
        {
            if (_arg_2 == 0xFFFFFFFF)
            {
                return k;
            }
            var _local_3:uint = ((_arg_2 >> 16) & 0xFF);
            var _local_4:uint = ((_arg_2 >> 8) & 0xFF);
            var _local_5:uint = (_arg_2 & 0xFF);
            _local_3 = ((((k >> 16) & 0xFF) * _local_3) / 0xFF);
            _local_4 = ((((k >> 8) & 0xFF) * _local_4) / 0xFF);
            _local_5 = (((k & 0xFF) * _local_5) / 0xFF);
            return ((((k) && (0xFF000000)) | (_local_3 << 16)) | (_local_4 << 8)) | _local_5;
        }

        public static function _Str_23439(k:BitmapData):uint
        {
            var _local_7:int;
            var _local_8:uint;
            if (k == null)
            {
                return 0xFFFFFF;
            }
            var _local_2:Number = 0;
            var _local_3:Number = 0;
            var _local_4:Number = 0;
            var _local_5:int;
            var _local_6:int;
            while (_local_6 < k.width)
            {
                _local_7 = 0;
                while (_local_7 < k.height)
                {
                    _local_8 = k.getPixel32(_local_6, _local_7);
                    if (((_local_8 >> 24) & 0xFF) > 0)
                    {
                        _local_2 = (_local_2 + ((_local_8 >> 16) & 0xFF));
                        _local_3 = (_local_3 + ((_local_8 >> 8) & 0xFF));
                        _local_4 = (_local_4 + (_local_8 & 0xFF));
                        _local_5++;
                    }
                    _local_7++;
                }
                _local_6++;
            }
            if (_local_5 == 0)
            {
                return 0xFFFFFF;
            }
            _local_2 = (_local_2 / _local_5);
            _local_3 = (_local_3 / _local_5);
            _local_4 = (_local_4 / _local_5);
            return ((_local_2 << 16) | (_local_3 << 8)) | _local_4;
        }


        public function _Str_25929(k:Vector.<Point>, _arg_2:BitmapData, _arg_3:uint=0xFFFFFFFF):void
        {
            var _local_4:Point;
            var _local_5:Function;
            if (k.length != 4)
            {
                return;
            }
            if (k[1].x == k[3].x)
            {
                _local_4 = k[3];
                if (k[0].y < k[1].y)
                {
                    _local_5 = _Str_23302;
                }
                else
                {
                    _local_5 = _Str_24365;
                }
            }
            else
            {
                _local_4 = k[3];
                _local_5 = _Str_25009;
            }
            this._Str_20595(k.slice(0, 3), _arg_2, _local_4, _local_5, _arg_3);
            this._Str_20595(k.slice(1, 4), _arg_2, _local_4, _local_5, _arg_3);
        }

        public function _Str_20595(k:Vector.<Point>, _arg_2:BitmapData, _arg_3:Point, _arg_4:Function, _arg_5:uint):void
        {
            if (k.length != 3)
            {
                return;
            }
            var _local_6:Vector.<Point> = k.concat();
            _local_6.sort(_Str_22323);
            var _local_7:Point = new Point((_local_6[1].x - _local_6[0].x), (_local_6[1].y - _local_6[0].y));
            var _local_8:Point = new Point((_local_6[2].x - _local_6[0].x), (_local_6[2].y - _local_6[0].y));
            var _local_9:Point = new Point((_local_6[2].x - _local_6[1].x), (_local_6[2].y - _local_6[1].y));
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            if (((!(_local_7.y == 0)) && (!(_local_8.y == 0))))
            {
                _local_10 = 0;
                while (_local_10 < _local_7.y)
                {
                    _local_11 = (_local_6[0].x + ((_local_7.x / _local_7.y) * _local_10));
                    _local_12 = (_local_6[0].x + ((_local_8.x / _local_8.y) * _local_10));
                    this._Str_19454(_local_11, _local_12, (_local_6[0].y + _local_10), _arg_2, _arg_3, _arg_4, _arg_5);
                    _local_10++;
                }
            }
            if (((!(_local_8.y == 0)) && (!(_local_9.y == 0))))
            {
                _local_10 = 0;
                while (_local_10 < _local_9.y)
                {
                    _local_11 = (_local_6[1].x + ((_local_9.x / _local_9.y) * _local_10));
                    _local_12 = (_local_6[0].x + ((_local_8.x / _local_8.y) * (_local_7.y + _local_10)));
                    this._Str_19454(_local_11, _local_12, (_local_6[1].y + _local_10), _arg_2, _arg_3, _arg_4, _arg_5);
                    _local_10++;
                }
            }
        }

        private function _Str_19454(k:int, _arg_2:int, _arg_3:int, _arg_4:BitmapData, _arg_5:Point, _arg_6:Function, _arg_7:uint):void
        {
            var _local_8:int;
            if (k < _arg_2)
            {
                _local_8 = k;
                while (_local_8 < _arg_2)
                {
                    setPixel(_local_8, _arg_3, _arg_6(_arg_4, _arg_5, _local_8, _arg_3, _arg_7));
                    _local_8++;
                }
            }
            else
            {
                _local_8 = _arg_2;
                while (_local_8 < k)
                {
                    setPixel(_local_8, _arg_3, _arg_6(_arg_4, _arg_5, _local_8, _arg_3, _arg_7));
                    _local_8++;
                }
            }
        }
    }
}
