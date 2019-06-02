package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public class Twinkle implements AnimationObject, IDisposable 
    {
        private static const _Str_17554:int = 100;
        private static const _Str_15029:Array = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1];
        private static const _Str_18234:int = -1;
        private static const _Str_14452:int = -2;
        private static const _Str_14372:Point = new Point(44, 44);

        private var _twinkleImages:TwinkleImages;
        private var _startTimeInMsecs:int;
        private var _position:Point;

        public function Twinkle(k:TwinkleImages, _arg_2:int)
        {
            this._twinkleImages = k;
            this._startTimeInMsecs = _arg_2;
        }

        public function dispose():void
        {
            this._twinkleImages = null;
            this._position = null;
        }

        public function get disposed():Boolean
        {
            return this._twinkleImages == null;
        }

        public function _Str_21940():void
        {
            this._position = new Point(Math.round((Math.random() * _Str_14372.x)), Math.round((Math.random() * _Str_14372.y)));
        }

        public function getPosition(k:int):Point
        {
            return this._position;
        }

        public function _Str_22065(k:int):Boolean
        {
            return this._Str_2259(k) == _Str_14452;
        }

        public function getBitmap(k:int):BitmapData
        {
            var _local_2:int = this._Str_2259(k);
            var _local_3:BitmapData = this._twinkleImages.getImage(_Str_15029[_local_2]);
            return _local_3;
        }

        private function _Str_2259(k:int):int
        {
            var _local_2:int = (k - this._startTimeInMsecs);
            if (_local_2 < 0)
            {
                return _Str_18234;
            }
            var _local_3:int = Math.floor((_local_2 / _Str_17554));
            if (_local_3 >= _Str_15029.length)
            {
                return _Str_14452;
            }
            return _local_3;
        }
    }
}
