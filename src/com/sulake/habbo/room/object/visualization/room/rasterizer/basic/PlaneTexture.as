package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class PlaneTexture 
    {
        public static const MIN_NORMAL_COORDINATE_VALUE:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;

        private var _bitmaps:Array;

        public function PlaneTexture()
        {
            this._bitmaps = [];
            super();
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneTextureBitmap;
            if (this._bitmaps != null)
            {
                k = 0;
                while (k < this._bitmaps.length)
                {
                    _local_2 = (this._bitmaps[k] as PlaneTextureBitmap);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._bitmaps = null;
            }
        }

        public function addBitmap(k:BitmapData, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:String=null):void
        {
            var _local_7:PlaneTextureBitmap = new PlaneTextureBitmap(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
            this._bitmaps.push(_local_7);
        }

        public function getBitmap(k:IVector3d):BitmapData
        {
            var _local_2:PlaneTextureBitmap = this._Str_21702(k);
            return (_local_2 == null) ? null : _local_2.bitmap;
        }

        public function _Str_21702(k:IVector3d):PlaneTextureBitmap
        {
            var _local_3:PlaneTextureBitmap;
            if (k == null)
            {
                return null;
            }
            var _local_2:int;
            while (_local_2 < this._bitmaps.length)
            {
                _local_3 = (this._bitmaps[_local_2] as PlaneTextureBitmap);
                if (_local_3 != null)
                {
                    if (((((k.x >= _local_3.normalMinX) && (k.x <= _local_3.normalMaxX)) && (k.y >= _local_3.normalMinY)) && (k.y <= _local_3.normalMaxY)))
                    {
                        return _local_3;
                    }
                }
                _local_2++;
            }
            return null;
        }

        public function getAliasByName(k:IVector3d):String
        {
            var _local_2:PlaneTextureBitmap = this._Str_21702(k);
            return (_local_2 == null) ? null : _local_2.assetName;
        }
    }
}
