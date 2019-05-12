package com.apdevblog.utils
{
    import flash.display.Shape;
    import flash.display.BitmapData;
    import flash.display.Graphics;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import flash.display.InterpolationMethod;

    public class _Str_3771 
    {
        public static var _Str_1761:int = 1;
        public static var _Str_2059:int = 2;
        public static const _Str_5603:Number = (Math.PI / 180);//0.0174532925199433


        public static function _Str_25985(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:BitmapData, _arg_5:Number=1):Shape
        {
            var _local_6:Shape = new Shape();
            _local_6.graphics.beginBitmapFill(_arg_4);
            _local_6.graphics.moveTo((k + _arg_3), _arg_2);
            _local_6.graphics.curveTo((_arg_3 + k), ((Math.tan((Math.PI / 8)) * _arg_3) + _arg_2), ((Math.sin((Math.PI / 4)) * _arg_3) + k), ((Math.sin((Math.PI / 4)) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo(((Math.tan((Math.PI / 8)) * _arg_3) + k), (_arg_3 + _arg_2), k, (_arg_3 + _arg_2));
            _local_6.graphics.curveTo(((-(Math.tan((Math.PI / 8))) * _arg_3) + k), (_arg_3 + _arg_2), ((-(Math.sin((Math.PI / 4))) * _arg_3) + k), ((Math.sin((Math.PI / 4)) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo((-(_arg_3) + k), ((Math.tan((Math.PI / 8)) * _arg_3) + _arg_2), (-(_arg_3) + k), _arg_2);
            _local_6.graphics.curveTo((-(_arg_3) + k), ((-(Math.tan((Math.PI / 8))) * _arg_3) + _arg_2), ((-(Math.sin((Math.PI / 4))) * _arg_3) + k), ((-(Math.sin((Math.PI / 4))) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo(((-(Math.tan((Math.PI / 8))) * _arg_3) + k), (-(_arg_3) + _arg_2), k, (-(_arg_3) + _arg_2));
            _local_6.graphics.curveTo(((Math.tan((Math.PI / 8)) * _arg_3) + k), (-(_arg_3) + _arg_2), ((Math.sin((Math.PI / 4)) * _arg_3) + k), ((-(Math.sin((Math.PI / 4))) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo((_arg_3 + k), ((-(Math.tan((Math.PI / 8))) * _arg_3) + _arg_2), (_arg_3 + k), _arg_2);
            _local_6.graphics.endFill();
            _local_6.alpha = _arg_5;
            return _local_6;
        }

        public static function _Str_26095(k:int, _arg_2:int, _arg_3:BitmapData, _arg_4:Number):Shape
        {
            var _local_5:Shape = new Shape();
            _local_5.graphics.beginBitmapFill(_arg_3);
            _local_5.graphics.drawRect(0, 0, k, _arg_2);
            _local_5.graphics.endFill();
            _local_5.alpha = _arg_4;
            return _local_5;
        }

        public static function _Str_26445(k:int, _arg_2:int, _arg_3:int, _arg_4:BitmapData, _arg_5:Number):Shape
        {
            var _local_6:Shape = new Shape();
            var _local_7:Graphics = _local_6.graphics;
            _local_7.beginBitmapFill(_arg_4);
            _local_7.moveTo(_arg_3, 0);
            _local_7.curveTo((k - _arg_3), 0, (k - _arg_3), 0);
            _local_7.curveTo(k, 0, k, _arg_3);
            _local_7.curveTo(k, (_arg_2 - _arg_3), k, (_arg_2 - _arg_3));
            _local_7.curveTo(k, _arg_2, (k - _arg_3), _arg_2);
            _local_7.curveTo(_arg_3, _arg_2, _arg_3, _arg_2);
            _local_7.curveTo(0, _arg_2, 0, (_arg_2 - _arg_3));
            _local_7.curveTo(0, _arg_3, 0, _arg_3);
            _local_7.curveTo(0, 0, _arg_3, 0);
            _local_7.endFill();
            _local_6.alpha = _arg_5;
            return _local_6;
        }

        public static function _Str_26172(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint, _arg_5:Number=1):Shape
        {
            var _local_6:Shape = new Shape();
            var _local_7:Graphics = _local_6.graphics;
            var _local_8:BitmapData = new BitmapData(2, 2, true);
            _local_8.lock();
            _local_8.setPixel32(0, 0, _arg_3);
            _local_8.setPixel32(1, 0, _arg_4);
            _local_8.setPixel32(0, 1, _arg_4);
            _local_8.setPixel32(1, 1, _arg_3);
            _local_8.unlock();
            _local_7.clear();
            _local_7.beginBitmapFill(_local_8);
            _local_7.drawRect(0, 0, k, _arg_2);
            _local_7.endFill();
            _local_6.alpha = _arg_5;
            return _local_6;
        }

        public static function _Str_26227(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number=1):Shape
        {
            var _local_6:Shape = new Shape();
            _local_6.graphics.beginFill(_arg_4, 1);
            _local_6.graphics.moveTo((k + _arg_3), _arg_2);
            _local_6.graphics.curveTo((_arg_3 + k), ((Math.tan((Math.PI / 8)) * _arg_3) + _arg_2), ((Math.sin((Math.PI / 4)) * _arg_3) + k), ((Math.sin((Math.PI / 4)) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo(((Math.tan((Math.PI / 8)) * _arg_3) + k), (_arg_3 + _arg_2), k, (_arg_3 + _arg_2));
            _local_6.graphics.curveTo(((-(Math.tan((Math.PI / 8))) * _arg_3) + k), (_arg_3 + _arg_2), ((-(Math.sin((Math.PI / 4))) * _arg_3) + k), ((Math.sin((Math.PI / 4)) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo((-(_arg_3) + k), ((Math.tan((Math.PI / 8)) * _arg_3) + _arg_2), (-(_arg_3) + k), _arg_2);
            _local_6.graphics.curveTo((-(_arg_3) + k), ((-(Math.tan((Math.PI / 8))) * _arg_3) + _arg_2), ((-(Math.sin((Math.PI / 4))) * _arg_3) + k), ((-(Math.sin((Math.PI / 4))) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo(((-(Math.tan((Math.PI / 8))) * _arg_3) + k), (-(_arg_3) + _arg_2), k, (-(_arg_3) + _arg_2));
            _local_6.graphics.curveTo(((Math.tan((Math.PI / 8)) * _arg_3) + k), (-(_arg_3) + _arg_2), ((Math.sin((Math.PI / 4)) * _arg_3) + k), ((-(Math.sin((Math.PI / 4))) * _arg_3) + _arg_2));
            _local_6.graphics.curveTo((_arg_3 + k), ((-(Math.tan((Math.PI / 8))) * _arg_3) + _arg_2), (_arg_3 + k), _arg_2);
            _local_6.graphics.endFill();
            _local_6.alpha = _arg_5;
            return _local_6;
        }

        public static function _Str_1645(k:int, _arg_2:int, _arg_3:int, _arg_4:Number=1, _arg_5:int=2):Shape
        {
            var _local_6:Shape = new Shape();
            var _local_7:Graphics = _local_6.graphics;
            _local_7.lineStyle(_arg_5, _arg_3);
            _local_7.lineTo(k, _arg_2);
            _local_7.moveTo(0, _arg_2);
            _local_7.lineTo(k, 0);
            _local_7.endFill();
            _local_6.alpha = _arg_4;
            return _local_6;
        }

        public static function _Str_25390(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:int, _arg_5:Number):Shape
        {
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_6:Shape = new Shape();
            var _local_7:Graphics = _local_6.graphics;
            _local_7.beginFill(_arg_4, 1);
            _local_7.moveTo(0, 0);
            _local_7.lineTo(k, 0);
            var _local_8:Number = Math.tan(((1 * Math.PI) * 180));
            _local_9 = 0;
            while (_local_9 < _arg_3)
            {
                _local_10 = (k * Math.cos(((_local_9 + 1) * _Str_5603)));
                _local_11 = (k * Math.sin(((_local_9 + 1) * _Str_5603)));
                _local_12 = (_local_10 + ((k * _local_8) * Math.cos((((_local_9 + 1) - 90) * _Str_5603))));
                _local_13 = (_local_11 + ((k * _local_8) * Math.sin((((_local_9 + 1) - 90) * _Str_5603))));
                _local_7.curveTo(_local_12, _local_13, _local_10, _local_11);
                _local_9++;
            }
            _local_7.moveTo(0, 0);
            _local_7.lineTo(_arg_2, 0);
            _local_9 = 0;
            while (_local_9 < _arg_3)
            {
                _local_10 = (_arg_2 * Math.cos(((_local_9 + 1) * _Str_5603)));
                _local_11 = (_arg_2 * Math.sin(((_local_9 + 1) * _Str_5603)));
                _local_12 = (_local_10 + ((_arg_2 * _local_8) * Math.cos((((_local_9 + 1) - 90) * _Str_5603))));
                _local_13 = (_local_11 + ((_arg_2 * _local_8) * Math.sin((((_local_9 + 1) - 90) * _Str_5603))));
                _local_7.curveTo(_local_12, _local_13, _local_10, _local_11);
                _local_9++;
            }
            _local_6.alpha = _arg_5;
            return _local_6;
        }

        public static function _Str_25926(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint, _arg_5:int=1, _arg_6:int=1, _arg_7:Number=1):Shape
        {
            var _local_8:Shape = new Shape();
            var _local_9:Graphics = _local_8.graphics;
            var _local_10:int = ((_arg_2 == _Str_2059) ? k : 1);
            var _local_11:int = ((_arg_2 == _Str_2059) ? 1 : k);
            var _local_12:BitmapData = new BitmapData((_arg_5 + _arg_6), 1, true);
            _local_12.lock();
            var _local_13:int;
            while (_local_13 < _arg_5)
            {
                _local_12.setPixel32(_local_13, 0, _arg_3);
                _local_13++;
            }
            while (_local_13 < (_arg_5 + _arg_6))
            {
                _local_12.setPixel32(_local_13, 0, _arg_4);
                _local_13++;
            }
            _local_12.unlock();
            var _local_14:Matrix = new Matrix();
            if (_arg_2 == _Str_1761)
            {
                _local_14.rotate(((90 * Math.PI) / 180));
            }
            _local_9.clear();
            _local_9.beginBitmapFill(_local_12, _local_14);
            _local_9.drawRect(0, 0, _local_10, _local_11);
            _local_9.endFill();
            _local_8.alpha = _arg_7;
            return _local_8;
        }

        public static function _Str_13333(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number=1, _arg_7:Number=1):Shape
        {
            var _local_8:Shape = new Shape();
            var _local_9:Graphics = _local_8.graphics;
            var _local_10:Array = [_arg_4, _arg_5];
            var _local_11:String = GradientType.LINEAR;
            var _local_12:Array = [_arg_6, _arg_7];
            var _local_13:Array = [0, 0xFF];
            var _local_14:String = SpreadMethod.PAD;
            var _local_15:String = InterpolationMethod.RGB;
            var _local_16:Matrix = new Matrix();
            _local_16.createGradientBox(k, _arg_2, ((_arg_3 * Math.PI) / 180), 0, 0);
            _local_9.beginGradientFill(_local_11, _local_10, _local_12, _local_13, _local_16, _local_14, _local_15);
            _local_9.drawRect(0, 0, k, _arg_2);
            return _local_8;
        }

        public static function rect(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=1, _arg_5:Number=0, _arg_6:Number=0):Shape
        {
            var _local_7:Shape = new Shape();
            _local_7.graphics.beginFill(_arg_3, 1);
            _local_7.graphics.moveTo(0, 0);
            _local_7.graphics.lineTo(k, 0);
            _local_7.graphics.lineTo(k, _arg_2);
            _local_7.graphics.lineTo(0, _arg_2);
            _local_7.graphics.lineTo(0, 0);
            _local_7.graphics.endFill();
            _local_7.alpha = _arg_4;
            _local_7.x = _arg_5;
            _local_7.y = _arg_6;
            return _local_7;
        }

        public static function _Str_25924(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):Shape
        {
            var _local_8:Shape = new Shape();
            var _local_9:Graphics = _local_8.graphics;
            _local_9.beginFill(_arg_6, 1);
            _local_9.moveTo((k + _arg_5), _arg_2);
            _local_9.curveTo(((k + _arg_3) - _arg_5), _arg_2, ((k + _arg_3) - _arg_5), _arg_2);
            _local_9.curveTo((k + _arg_3), _arg_2, (k + _arg_3), (_arg_2 + _arg_5));
            _local_9.curveTo((k + _arg_3), ((_arg_2 + _arg_4) - _arg_5), (k + _arg_3), ((_arg_2 + _arg_4) - _arg_5));
            _local_9.curveTo((k + _arg_3), (_arg_2 + _arg_4), ((k + _arg_3) - _arg_5), (_arg_2 + _arg_4));
            _local_9.curveTo((k + _arg_5), (_arg_2 + _arg_4), (k + _arg_5), (_arg_2 + _arg_4));
            _local_9.curveTo(k, (_arg_2 + _arg_4), k, ((_arg_2 + _arg_4) - _arg_5));
            _local_9.curveTo(k, (_arg_2 + _arg_5), k, (_arg_2 + _arg_5));
            _local_9.curveTo(k, _arg_2, (k + _arg_5), _arg_2);
            _local_9.endFill();
            _local_8.alpha = _arg_7;
            return _local_8;
        }

        public static function outline(k:int, _arg_2:int, _arg_3:int, _arg_4:Number):Shape
        {
            var _local_5:Shape = new Shape();
            var _local_6:Graphics = _local_5.graphics;
            _local_6.beginFill(_arg_3, 1);
            _local_6.drawRect(0, 0, k, 1);
            _local_6.drawRect(0, 1, 1, (_arg_2 - 1));
            _local_6.drawRect((k - 1), 1, 1, (_arg_2 - 1));
            _local_6.drawRect(1, (_arg_2 - 1), (k - 2), 1);
            _local_6.endFill();
            _local_5.alpha = _arg_4;
            return _local_5;
        }
    }
}
