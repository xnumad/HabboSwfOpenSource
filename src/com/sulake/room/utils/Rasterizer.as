package com.sulake.room.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Matrix;

    public class Rasterizer 
    {
        public static function line(k:BitmapData, _arg_2:Point, _arg_3:Point, _arg_4:int):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int = _arg_2.x;
            var _local_12:int = _arg_2.y;
            _local_5 = (_arg_3.x - _arg_2.x);
            _local_6 = (_arg_3.y - _arg_2.y);
            _local_8 = ((_local_5 > 0) ? 1 : -1);
            _local_9 = ((_local_6 > 0) ? 1 : -1);
            _local_5 = Math.abs(_local_5);
            _local_6 = Math.abs(_local_6);
            k.lock();
            k.setPixel32(_local_11, _local_12, _arg_4);
            if (((_local_5 == 0) && (_local_6 == 0)))
            {
                return;
            }
            if (_local_5 > _local_6)
            {
                _local_7 = (_local_5 - 1);
                while (_local_7 >= 0)
                {
                    _local_10 = (_local_10 + _local_6);
                    _local_11 = (_local_11 + _local_8);
                    if (_local_10 >= (_local_5 / 2))
                    {
                        _local_10 = (_local_10 - _local_5);
                        _local_12 = (_local_12 + _local_9);
                    }
                    k.setPixel32(_local_11, _local_12, _arg_4);
                    _local_7--;
                }
            }
            else
            {
                _local_7 = (_local_6 - 1);
                while (_local_7 >= 0)
                {
                    _local_10 = (_local_10 + _local_5);
                    _local_12 = (_local_12 + _local_9);
                    if (_local_10 >= (_local_6 / 2))
                    {
                        _local_10 = (_local_10 - _local_6);
                        _local_11 = (_local_11 + _local_8);
                    }
                    k.setPixel32(_local_11, _local_12, _arg_4);
                    _local_7--;
                }
            }
            k.setPixel32(_arg_3.x, _arg_3.y, _arg_4);
            k.unlock();
        }

        public static function getFlipHBitmapData(k:BitmapData):BitmapData
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:BitmapData;
            _local_2 = new BitmapData(k.width, k.height, true, 0xFFFFFF);
            var _local_3:Matrix = new Matrix();
            _local_3.scale(-1, 1);
            _local_3.translate(k.width, 0);
            _local_2.draw(k, _local_3);
            return _local_2;
        }

        public static function getFlipVBitmapData(k:BitmapData):BitmapData
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:BitmapData;
            _local_2 = new BitmapData(k.width, k.height, true, 0xFFFFFF);
            var _local_3:Matrix = new Matrix();
            _local_3.scale(1, -1);
            _local_3.translate(0, k.height);
            _local_2.draw(k, _local_3);
            return _local_2;
        }

        public static function getFlipHVBitmapData(k:BitmapData):BitmapData
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:BitmapData;
            _local_2 = new BitmapData(k.width, k.height, true, 0xFFFFFF);
            var _local_3:Matrix = new Matrix();
            _local_3.scale(-1, -1);
            _local_3.translate(k.width, k.height);
            _local_2.draw(k, _local_3);
            return _local_2;
        }
    }
}
