package com.sulake.room.renderer.cache
{
    import com.sulake.room.renderer.utils.ExtendedBitmapData;

    public class BitmapDataCacheItem 
    {
        private var _bitmapData:ExtendedBitmapData = null;
        private var _name:String = "";
        private var _memUsage:int = 0;

        public function BitmapDataCacheItem(k:ExtendedBitmapData, _arg_2:String)
        {
            this._bitmapData = k;
            this._name = _arg_2;
            if (k != null)
            {
                k._Str_9215();
                this._memUsage = ((this._bitmapData.width * this._bitmapData.height) * 4);
            }
        }

        public function get bitmapData():ExtendedBitmapData
        {
            return this._bitmapData;
        }

        public function get _Str_16106():int
        {
            return this._memUsage;
        }

        public function get useCount():int
        {
            if (this._bitmapData == null)
            {
                return 0;
            }
            return this._bitmapData.referenceCount;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set bitmapData(k:ExtendedBitmapData):void
        {
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
            }
            this._bitmapData = k;
            if (this._bitmapData != null)
            {
                this._bitmapData._Str_9215();
                this._memUsage = ((this._bitmapData.width * this._bitmapData.height) * 4);
            }
            else
            {
                this._memUsage = 0;
            }
        }

        public function dispose():void
        {
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
            this._memUsage = 0;
        }
    }
}
