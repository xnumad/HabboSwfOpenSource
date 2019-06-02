package com.sulake.room.renderer.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class ExtendedBitmapData extends BitmapData 
    {
        private static const ZERO_POINT:Point = new Point(0, 0);

        private var _referenceCount:int = 0;
        private var _disposed:Boolean = false;

        public function ExtendedBitmapData(k:int, _arg_2:int, _arg_3:Boolean=true, _arg_4:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function get referenceCount():int
        {
            return this._referenceCount;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_9215():void
        {
            this._referenceCount++;
        }

        override public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (--this._referenceCount <= 0)
            {
                super.dispose();
                this._disposed = true;
            }
        }

        override public function clone():BitmapData
        {
            var data:ExtendedBitmapData;
            try
            {
                data = new ExtendedBitmapData(width, height, true, 0xFFFFFF);
                data.copyPixels(this, rect, ZERO_POINT, null, null, true);
            }
            catch(e:Error)
            {
                data = new ExtendedBitmapData(1, 1, true, 0xFFFFFF);
            }
            return data;
        }
    }
}
