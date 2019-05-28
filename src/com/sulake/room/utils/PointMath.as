package com.sulake.room.utils
{
    import flash.geom.Point;

    public class PointMath 
    {
        public static function sum(k:Point, _arg_2:Point):Point
        {
            return new Point((k.x + _arg_2.x), (k.y + _arg_2.y));
        }

        public static function sub(k:Point, _arg_2:Point):Point
        {
            return new Point((k.x - _arg_2.x), (k.y - _arg_2.y));
        }

        public static function mul(k:Point, _arg_2:Number):Point
        {
            return new Point((k.x * _arg_2), (k.y * _arg_2));
        }
    }
}
