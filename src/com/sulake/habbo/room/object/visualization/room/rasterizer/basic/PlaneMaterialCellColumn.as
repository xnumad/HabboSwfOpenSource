package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Point;

    public class PlaneMaterialCellColumn 
    {
        public static const REPEAT_MODE_NONE:int = 0;
        public static const REPEAT_MODE_ALL:int = 1;
        public static const REPEAT_MODE_BORDERS:int = 2;
        public static const REPEAT_MODE_CENTER:int = 3;
        public static const REPEAT_MODE_FIRST:int = 4;
        public static const REPEAT_MODE_LAST:int = 5;

        private var _cells:Array;
        private var _repeatMode:int = 1;
        private var _width:int = 1;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d = null;
        private var _cachedBitmapDataOffsetX:int;
        private var _cachedBitmapDataOffsetY:int;
        private var _isCached:Boolean = false;
        private var _isStatic:Boolean = true;

        public function PlaneMaterialCellColumn(k:int, _arg_2:Array, _arg_3:int=1)
        {
            var _local_4:int;
            var _local_5:PlaneMaterialCell;
            this._cells = [];
            super();
            if (k < 1)
            {
                k = 1;
            }
            this._width = k;
            if (_arg_2 != null)
            {
                _local_4 = 0;
                while (_local_4 < _arg_2.length)
                {
                    _local_5 = (_arg_2[_local_4] as PlaneMaterialCell);
                    if (_local_5 != null)
                    {
                        this._cells.push(_local_5);
                        if (!_local_5.isStatic)
                        {
                            this._isStatic = false;
                        }
                    }
                    _local_4++;
                }
            }
            this._repeatMode = _arg_3;
        }

        public function get isStatic():Boolean
        {
            return this._isStatic;
        }

        public function _Str_24523():Boolean
        {
            return !(this._repeatMode == REPEAT_MODE_NONE);
        }

        public function get width():int
        {
            return this._width;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneMaterialCell;
            if (this._cells != null)
            {
                k = 0;
                while (k < this._cells.length)
                {
                    _local_2 = (this._cells[k] as PlaneMaterialCell);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._cells = null;
            }
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
                this._cachedBitmapData = null;
            }
            if (this._cachedBitmapNormal != null)
            {
                this._cachedBitmapNormal = null;
            }
        }

        public function _Str_3355():void
        {
            var k:int;
            var _local_2:PlaneMaterialCell;
            if (!this._isCached)
            {
                return;
            }
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
                this._cachedBitmapData = null;
            }
            if (this._cachedBitmapNormal != null)
            {
                this._cachedBitmapNormal.x = 0;
                this._cachedBitmapNormal.y = 0;
                this._cachedBitmapNormal.z = 0;
            }
            if (this._cells != null)
            {
                k = 0;
                while (k < this._cells.length)
                {
                    _local_2 = (this._cells[k] as PlaneMaterialCell);
                    if (_local_2 != null)
                    {
                        _local_2._Str_3355();
                    }
                    k++;
                }
            }
            this._isCached = false;
        }

        public function render(height:int, normal:IVector3d, offsetX:int, offsetY:int):BitmapData
        {
            var ht:int;
            if (this._repeatMode == REPEAT_MODE_NONE)
            {
                ht = this.getCellsHeight(this._cells, normal);
                height = ht;
            }
            if (this._cachedBitmapNormal == null)
            {
                this._cachedBitmapNormal = new Vector3d();
            }
            if (this.isStatic)
            {
                if (this._cachedBitmapData != null)
                {
                    if (((((this._cachedBitmapData.height == height) && (Vector3d.isEqual(this._cachedBitmapNormal, normal))) && (this._cachedBitmapDataOffsetX == offsetX)) && (this._cachedBitmapDataOffsetY == offsetY)))
                    {
                        return this._cachedBitmapData;
                    }
                    this._cachedBitmapData.dispose();
                    this._cachedBitmapData = null;
                }
            }
            else
            {
                if (this._cachedBitmapData != null)
                {
                    if (this._cachedBitmapData.height == height)
                    {
                        this._cachedBitmapData.fillRect(this._cachedBitmapData.rect, 0xFFFFFF);
                    }
                    else
                    {
                        this._cachedBitmapData.dispose();
                        this._cachedBitmapData = null;
                    }
                }
            }
            this._isCached = true;
            if (this._cachedBitmapData == null)
            {
                try
                {
                    this._cachedBitmapData = new BitmapData(this._width, height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    return null;
                }
            }
            this._cachedBitmapNormal.assign(normal);
            this._cachedBitmapDataOffsetX = offsetX;
            this._cachedBitmapDataOffsetY = offsetY;
            if (this._cells.length == 0)
            {
                return this._cachedBitmapData;
            }
            switch (this._repeatMode)
            {
                case REPEAT_MODE_NONE:
                    this.renderRepeatNone(normal);
                    break;
                case REPEAT_MODE_BORDERS:
                    this._Str_18476(normal);
                    break;
                case REPEAT_MODE_CENTER:
                    this._Str_17295(normal);
                    break;
                case REPEAT_MODE_FIRST:
                    this._Str_18019(normal);
                    break;
                case REPEAT_MODE_LAST:
                    this._Str_16099(normal);
                    break;
                default:
                    this._Str_18711(normal, offsetX, offsetY);
            }
            return this._cachedBitmapData;
        }

        private function getCellsHeight(k:Array, _arg_2:IVector3d):int
        {
            var _local_5:PlaneMaterialCell;
            var _local_6:int;
            if (((k == null) || (k.length == 0)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < k.length)
            {
                _local_5 = (k[_local_4] as PlaneMaterialCell);
                if (_local_5 != null)
                {
                    _local_6 = _local_5.getHeight(_arg_2);
                    _local_3 = (_local_3 + _local_6);
                }
                _local_4++;
            }
            return _local_3;
        }

        private function renderCells(k:Array, _arg_2:int, _arg_3:Boolean, _arg_4:IVector3d, _arg_5:int=0, _arg_6:int=0):int
        {
            if ((((k == null) || (k.length == 0)) || (this._cachedBitmapData == null)))
            {
                return _arg_2;
            }
            var _local_7:PlaneMaterialCell;
            var _local_8:BitmapData;
            var _local_9:int;
            while (_local_9 < k.length)
            {
                if (_arg_3)
                {
                    _local_7 = (k[_local_9] as PlaneMaterialCell);
                }
                else
                {
                    _local_7 = (k[((k.length - 1) - _local_9)] as PlaneMaterialCell);
                }
                if (_local_7 != null)
                {
                    _local_8 = _local_7.render(_arg_4, _arg_5, _arg_6);
                    if (_local_8 != null)
                    {
                        if (!_arg_3)
                        {
                            _arg_2 = (_arg_2 - _local_8.height);
                        }
                        this._cachedBitmapData.copyPixels(_local_8, _local_8.rect, new Point(0, _arg_2), _local_8, null, true);
                        if (_arg_3)
                        {
                            _arg_2 = (_arg_2 + _local_8.height);
                        }
                        if ((((_arg_3) && (_arg_2 >= this._cachedBitmapData.height)) || ((!(_arg_3)) && (_arg_2 <= 0))))
                        {
                            return _arg_2;
                        }
                    }
                }
                _local_9++;
            }
            return _arg_2;
        }

        private function renderRepeatNone(k:IVector3d):void
        {
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            this.renderCells(this._cells, 0, true, k);
        }

        private function _Str_18711(k:IVector3d, _arg_2:int, _arg_3:int):void
        {
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            var _local_4:int = this.getCellsHeight(this._cells, k);
            var _local_5:int;
            if (_local_4 > this._cachedBitmapData.height)
            {
            }
            while (_local_5 < this._cachedBitmapData.height)
            {
                _local_5 = this.renderCells(this._cells, _local_5, true, k, _arg_2, _arg_3);
                if (_local_5 == 0)
                {
                    return;
                }
            }
        }

        private function _Str_18476(k:IVector3d):void
        {
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            var _local_2:PlaneMaterialCell;
            var _local_3:BitmapData;
            var _local_4:Array = [];
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            _local_7 = 1;
            while (_local_7 < (this._cells.length - 1))
            {
                _local_2 = (this._cells[_local_7] as PlaneMaterialCell);
                if (_local_2 != null)
                {
                    _local_6 = _local_2.getHeight(k);
                    if (_local_6 > 0)
                    {
                        _local_5 = (_local_5 + _local_6);
                        _local_4.push(_local_2);
                    }
                }
                _local_7++;
            }
            if (this._cells.length == 1)
            {
                _local_2 = (this._cells[0] as PlaneMaterialCell);
                if (_local_2 != null)
                {
                    _local_6 = _local_2.getHeight(k);
                    if (_local_6 > 0)
                    {
                        _local_5 = (_local_5 + _local_6);
                        _local_4.push(_local_2);
                    }
                }
            }
            var _local_8:* = ((this._cachedBitmapData.height - _local_5) >> 1);
            var _local_9:int = this.renderCells(_local_4, _local_8, true, k);
            _local_2 = (this._cells[0] as PlaneMaterialCell);
            if (_local_2 != null)
            {
                _local_4 = [_local_2];
                while (_local_8 >= 0)
                {
                    _local_8 = this.renderCells(_local_4, _local_8, false, k);
                }
            }
            _local_2 = (this._cells[(this._cells.length - 1)] as PlaneMaterialCell);
            if (_local_2 != null)
            {
                _local_4 = [_local_2];
                while (_local_9 < this._cachedBitmapData.height)
                {
                    _local_9 = this.renderCells(_local_4, _local_9, true, k);
                }
            }
        }

        private function _Str_17295(k:IVector3d):void
        {
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:Array;
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            var _local_2:PlaneMaterialCell;
            var _local_3:BitmapData;
            var _local_4:Array = [];
            var _local_5:Array = [];
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            _local_9 = 0;
            while (_local_9 < (this._cells.length >> 1))
            {
                _local_2 = (this._cells[_local_9] as PlaneMaterialCell);
                if (_local_2 != null)
                {
                    _local_8 = _local_2.getHeight(k);
                    if (_local_8 > 0)
                    {
                        _local_6 = (_local_6 + _local_8);
                        _local_4.push(_local_2);
                    }
                }
                _local_9++;
            }
            _local_9 = ((this._cells.length >> 1) + 1);
            while (_local_9 < this._cells.length)
            {
                _local_2 = (this._cells[_local_9] as PlaneMaterialCell);
                if (_local_2 != null)
                {
                    _local_8 = _local_2.getHeight(k);
                    if (_local_8 > 0)
                    {
                        _local_7 = (_local_7 + _local_8);
                        _local_5.push(_local_2);
                    }
                }
                _local_9++;
            }
            var _local_10:int;
            var _local_11:int;
            var _local_12:int = this._cachedBitmapData.height;
            if ((_local_6 + _local_7) > this._cachedBitmapData.height)
            {
                _local_10 = ((_local_6 + _local_7) - this._cachedBitmapData.height);
                _local_11 = (_local_11 - (_local_10 >> 1));
                _local_12 = (_local_12 + (_local_10 - (_local_10 >> 1)));
            }
            if (_local_10 == 0)
            {
                _local_2 = (this._cells[(this._cells.length >> 1)] as PlaneMaterialCell);
                if (_local_2 != null)
                {
                    _local_8 = _local_2.getHeight(k);
                    if (_local_8 > 0)
                    {
                        _local_13 = (this._cachedBitmapData.height - (_local_6 + _local_7));
                        _local_14 = (Math.ceil((_local_13 / _local_8)) * _local_8);
                        _local_11 = (_local_6 - ((_local_14 - _local_13) >> 1));
                        _local_15 = (_local_11 + _local_14);
                        _local_16 = [_local_2];
                        while (_local_11 < _local_15)
                        {
                            _local_11 = this.renderCells(_local_16, _local_11, true, k);
                        }
                    }
                }
            }
            _local_11 = 0;
            this.renderCells(_local_4, _local_11, true, k);
            this.renderCells(_local_5, _local_12, false, k);
        }

        private function _Str_18019(k:IVector3d):void
        {
            var _local_4:Array;
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            var _local_2:PlaneMaterialCell;
            var _local_3:int = this._cachedBitmapData.height;
            _local_3 = this.renderCells(this._cells, _local_3, false, k);
            _local_2 = (this._cells[0] as PlaneMaterialCell);
            if (_local_2 != null)
            {
                _local_4 = [_local_2];
                while (_local_3 >= 0)
                {
                    _local_3 = this.renderCells(_local_4, _local_3, false, k);
                }
            }
        }

        private function _Str_16099(k:IVector3d):void
        {
            var _local_4:Array;
            if (((this._cells.length == 0) || (this._cachedBitmapData == null)))
            {
                return;
            }
            var _local_2:PlaneMaterialCell;
            var _local_3:int;
            _local_3 = this.renderCells(this._cells, _local_3, true, k);
            _local_2 = (this._cells[(this._cells.length - 1)] as PlaneMaterialCell);
            if (_local_2 != null)
            {
                _local_4 = [_local_2];
                while (_local_3 < this._cachedBitmapData.height)
                {
                    _local_3 = this.renderCells(_local_4, _local_3, true, k);
                }
            }
        }

        public function _Str_22299():Array
        {
            return this._cells;
        }
    }
}
