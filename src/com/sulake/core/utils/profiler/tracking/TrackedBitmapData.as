package com.sulake.core.utils.profiler.tracking
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class TrackedBitmapData extends BitmapData 
    {
        private static const MAX_SIZE:int = 0xFFFFFF;
        private static const MAX_WIDTH:int = 8191;
        private static const MAX_HEIGHT:int = 8191;
        private static const MIN_SIZE:int = 1;
        private static const MIN_WIDTH:int = 1;
        public static const MIN_HEIGHT:int = 4095;
        private static var _numInstances:uint = 0;
        private static var _allocatedByteCount:uint = 0;
        private static const ZERO_POINT:Point = new Point();

        private var _owner:Object;
        private var _disposed:Boolean = false;

        public function TrackedBitmapData(k:*, _arg_2:int, _arg_3:int, _arg_4:Boolean=true, _arg_5:uint=0xFFFFFFFF)
        {
            if ((_arg_2 * _arg_3) > MAX_SIZE)
            {
                _arg_2 = MIN_HEIGHT;
                _arg_3 = MIN_HEIGHT;
            }
            else
            {
                if (_arg_2 > MAX_WIDTH)
                {
                    _arg_2 = MAX_WIDTH;
                }
                else
                {
                    if (_arg_2 < MIN_SIZE)
                    {
                        _arg_2 = MIN_SIZE;
                    }
                }
                if (_arg_3 > MAX_HEIGHT)
                {
                    _arg_3 = MAX_HEIGHT;
                }
                else
                {
                    if (_arg_3 < MIN_WIDTH)
                    {
                        _arg_3 = MIN_WIDTH;
                    }
                }
            }
            super(_arg_2, _arg_3, _arg_4, _arg_5);
            _numInstances++;
            _allocatedByteCount = (_allocatedByteCount + ((_arg_2 * _arg_3) * 4));
            this._owner = k;
        }

        public static function get numInstances():uint
        {
            return _numInstances;
        }

        public static function get allocatedByteCount():uint
        {
            return _allocatedByteCount;
        }


        override public function dispose():void
        {
            if (!this._disposed)
            {
                _allocatedByteCount = (_allocatedByteCount - ((width * height) * 4));
                _numInstances--;
                this._disposed = true;
                this._owner = null;
                super.dispose();
            }
        }

        override public function clone():BitmapData
        {
            if (this._disposed)
            {
                return null;
            }
            var copy:TrackedBitmapData = new TrackedBitmapData(this._owner, width, height, transparent);
            copy.copyPixels(this, rect, ZERO_POINT);
            return copy;
        }
    }
}
