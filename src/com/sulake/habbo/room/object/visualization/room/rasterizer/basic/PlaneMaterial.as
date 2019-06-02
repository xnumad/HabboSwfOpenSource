package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.room.utils.IVector3d;
    import flash.display.BitmapData;

    public class PlaneMaterial 
    {
        public static const MIN_NORMAL_COORDINATE_VALUE:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;

        private var _planeMaterialItems:Array;
        private var _isCached:Boolean = false;

        public function PlaneMaterial()
        {
            this._planeMaterialItems = [];
            super();
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneMaterialCellMatrix;
            if (this._planeMaterialItems != null)
            {
                k = 0;
                while (k < this._planeMaterialItems.length)
                {
                    _local_2 = (this._planeMaterialItems[k] as PlaneMaterialCellMatrix);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._planeMaterialItems = null;
            }
        }

        public function _Str_3355():void
        {
            var k:int;
            var _local_2:PlaneMaterialCellMatrix;
            if (!this._isCached)
            {
                return;
            }
            if (this._planeMaterialItems != null)
            {
                k = 0;
                while (k < this._planeMaterialItems.length)
                {
                    _local_2 = (this._planeMaterialItems[k] as PlaneMaterialCellMatrix);
                    if (_local_2 != null)
                    {
                        _local_2._Str_3355();
                    }
                    k++;
                }
            }
            this._isCached = false;
        }

        public function addMaterialCellMatrix(k:int, _arg_2:int, _arg_3:int, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:Number=-1, _arg_7:Number=1):PlaneMaterialCellMatrix
        {
            var _local_8:PlaneMaterialCellMatrix;
            _local_8 = new PlaneMaterialCellMatrix(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
            this._planeMaterialItems.push(_local_8);
            return _local_8;
        }

        public function getMaterialCellMatrix(k:IVector3d):PlaneMaterialCellMatrix
        {
            var _local_3:PlaneMaterialCellMatrix;
            if (k == null)
            {
                return null;
            }
            var _local_2:int;
            while (_local_2 < this._planeMaterialItems.length)
            {
                _local_3 = (this._planeMaterialItems[_local_2] as PlaneMaterialCellMatrix);
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

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean):BitmapData
        {
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            }
            if (_arg_3 < 1)
            {
                _arg_3 = 1;
            }
            var _local_9:PlaneMaterialCellMatrix = this.getMaterialCellMatrix(_arg_4);
            if (_local_9 != null)
            {
                this._isCached = true;
                return _local_9.render(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
            }
            return null;
        }
    }
}
