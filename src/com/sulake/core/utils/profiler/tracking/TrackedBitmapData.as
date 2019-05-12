package com.sulake.core.utils.profiler.tracking
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class TrackedBitmapData extends BitmapData 
    {
        private static const _Str_1775:int = 0xFFFFFF;
        private static const _Str_1601:int = 8191;
        private static const _Str_1488:int = 8191;
        private static const _Str_1025:int = 1;
        private static const _Str_1564:int = 1;
        public static const _Str_1343:int = 4095;
        private static var _Str_1625:uint = 0;
        private static var _Str_846:uint = 0;
        private static const _Str_1870:Point = new Point();

        private var _Str_1860:Object;
        private var _disposed:Boolean = false;

        public function TrackedBitmapData(k:*, _arg_2:int, _arg_3:int, _arg_4:Boolean=true, _arg_5:uint=0xFFFFFFFF)
        {
            if ((_arg_2 * _arg_3) > _Str_1775)
            {
                _arg_2 = _Str_1343;
                _arg_3 = _Str_1343;
            }
            else
            {
                if (_arg_2 > _Str_1601)
                {
                    _arg_2 = _Str_1601;
                }
                else
                {
                    if (_arg_2 < _Str_1025)
                    {
                        _arg_2 = _Str_1025;
                    }
                }
                if (_arg_3 > _Str_1488)
                {
                    _arg_3 = _Str_1488;
                }
                else
                {
                    if (_arg_3 < _Str_1564)
                    {
                        _arg_3 = _Str_1564;
                    }
                }
            }
            super(_arg_2, _arg_3, _arg_4, _arg_5);
            _Str_1625++;
            _Str_846 = (_Str_846 + ((_arg_2 * _arg_3) * 4));
            this._Str_1860 = k;
        }

        public static function get _Str_1036():uint
        {
            return _Str_1625;
        }

        public static function get _Str_1152():uint
        {
            return _Str_846;
        }


        override public function dispose():void
        {
            if (!this._disposed)
            {
                _Str_846 = (_Str_846 - ((width * height) * 4));
                _Str_1625--;
                this._disposed = true;
                this._Str_1860 = null;
                super.dispose();
            }
        }

        override public function clone():BitmapData
        {
            if (this._disposed)
            {
                return null;
            }
            var copy:TrackedBitmapData = new TrackedBitmapData(this._Str_1860, width, height, transparent);
            copy.copyPixels(this, rect, _Str_1870);
            return copy;
        }
    }
}
