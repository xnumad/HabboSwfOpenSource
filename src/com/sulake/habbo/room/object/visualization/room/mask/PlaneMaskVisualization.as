package com.sulake.habbo.room.object.visualization.room.mask
{
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaskVisualization 
    {
        public static const MIN_NORMAL_COORDINATE_VALUE:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;

        private var _bitmaps:Array;

        public function PlaneMaskVisualization()
        {
            this._bitmaps = [];
            super();
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneMaskBitmap;
            if (this._bitmaps != null)
            {
                k = 0;
                while (k < this._bitmaps.length)
                {
                    _local_2 = (this._bitmaps[k] as PlaneMaskBitmap);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._bitmaps = null;
            }
        }

        public function addBitmap(k:IGraphicAsset, _arg_2:Number=-1, _arg_3:Number=1, _arg_4:Number=-1, _arg_5:Number=1):void
        {
            var _local_6:PlaneMaskBitmap = new PlaneMaskBitmap(k, _arg_2, _arg_3, _arg_4, _arg_5);
            this._bitmaps.push(_local_6);
        }

        public function getAsset(k:IVector3d):IGraphicAsset
        {
            var _local_3:PlaneMaskBitmap;
            if (k == null)
            {
                return null;
            }
            var _local_2:int;
            while (_local_2 < this._bitmaps.length)
            {
                _local_3 = (this._bitmaps[_local_2] as PlaneMaskBitmap);
                if (_local_3 != null)
                {
                    if (((((k.x >= _local_3.normalMinX) && (k.x <= _local_3.normalMaxX)) && (k.y >= _local_3.normalMinY)) && (k.y <= _local_3.normalMaxY)))
                    {
                        return _local_3.asset;
                    }
                }
                _local_2++;
            }
            return null;
        }
    }
}
