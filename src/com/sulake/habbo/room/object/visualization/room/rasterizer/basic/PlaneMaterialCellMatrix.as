package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class PlaneMaterialCellMatrix 
    {
        public static const REPEAT_MODE_ALL:int = 1;
        public static const REPEAT_MODE_BORDERS:int = 2;
        public static const REPEAT_MODE_CENTER:int = 3;
        public static const REPEAT_MODE_FIRST:int = 4;
        public static const REPEAT_MODE_LAST:int = 5;
        public static const REPEAT_MODE_RANDOM:int = 6;
        public static const REPEAT_MODE_DEFAULT:int = REPEAT_MODE_ALL;//1
        public static const MIN_NORMAL_COORDINATE_VALUE:Number = -1;
        public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
        public static const ALIGN_TOP:int = 1;
        public static const ALIGN_BOTTOM:int = 2;
        public static const ALIGN_DEFAULT:int = ALIGN_TOP;//1

        private var _columns:Array;
        private var _repeatMode:int = 1;
        private var _align:int = 1;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d = null;
        private var _cachedBitmapHeight:int = 0;
        private var _isCached:Boolean = false;
        private var _isStatic:Boolean = true;
        private var _normalMinX:Number = -1;
        private var _normalMaxX:Number = 1;
        private var _normalMinY:Number = -1;
        private var _normalMaxY:Number = 1;

        public function PlaneMaterialCellMatrix(k:int, _arg_2:int=1, _arg_3:int=1, _arg_4:Number=-1, _arg_5:Number=1, _arg_6:Number=-1, _arg_7:Number=1)
        {
            this._columns = [];
            super();
            if (k < 1)
            {
                k = 1;
            }
            var _local_8:int;
            while (_local_8 < k)
            {
                this._columns.push(null);
                _local_8++;
            }
            this._repeatMode = _arg_2;
            this._align = _arg_3;
            this._normalMinX = _arg_4;
            this._normalMaxX = _arg_5;
            this._normalMinY = _arg_6;
            this._normalMaxY = _arg_7;
            if (this._repeatMode == REPEAT_MODE_RANDOM)
            {
                this._isStatic = false;
            }
        }

        private static function _Str_12526(k:int):int
        {
            var _local_2:Array = Randomizer.getValues(1, 0, (k * 17631));
            return _local_2[0] % k;
        }


        public function get normalMinX():Number
        {
            return this._normalMinX;
        }

        public function get normalMaxX():Number
        {
            return this._normalMaxX;
        }

        public function get normalMinY():Number
        {
            return this._normalMinY;
        }

        public function get normalMaxY():Number
        {
            return this._normalMaxY;
        }

        public function _Str_14945():Boolean
        {
            return this._align == ALIGN_BOTTOM;
        }

        public function get isStatic():Boolean
        {
            return this._isStatic;
        }

        public function dispose():void
        {
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
            var _local_2:PlaneMaterialCellColumn;
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
            this._cachedBitmapHeight = 0;
            var k:int;
            while (k < this._columns.length)
            {
                _local_2 = (this._columns[k] as PlaneMaterialCellColumn);
                if (_local_2 != null)
                {
                    _local_2._Str_3355();
                }
                k++;
            }
            this._isCached = false;
        }

        public function createColumn(k:int, _arg_2:int, _arg_3:Array, _arg_4:int=1):Boolean
        {
            if (((k < 0) || (k >= this._columns.length)))
            {
                return false;
            }
            var _local_5:PlaneMaterialCellColumn = new PlaneMaterialCellColumn(_arg_2, _arg_3, _arg_4);
            var _local_6:PlaneMaterialCellColumn = (this._columns[k] as PlaneMaterialCellColumn);
            if (_local_6 != null)
            {
                _local_6.dispose();
            }
            this._columns[k] = _local_5;
            if (((!(_local_5 == null)) && (!(_local_5.isStatic))))
            {
                this._isStatic = false;
            }
            return true;
        }

        public function render(canvas:BitmapData, width:int, height:int, normal:IVector3d, useTexture:Boolean, offsetX:int, offsetY:int, topAlign:Boolean):BitmapData
        {
            var column:PlaneMaterialCellColumn;
            var columnBitmapData:BitmapData;
            if (width < 1)
            {
                width = 1;
            }
            if (height < 1)
            {
                height = 1;
            }
            if ((((canvas == null) || (!(canvas.width == width))) || (!(canvas.height == height))))
            {
                canvas = null;
            }
            if (this._cachedBitmapNormal == null)
            {
                this._cachedBitmapNormal = new Vector3d();
            }
            if (this.isStatic)
            {
                if (this._cachedBitmapData != null)
                {
                    if ((((this._cachedBitmapData.width == width) && (this._cachedBitmapData.height == height)) && (Vector3d.isEqual(this._cachedBitmapNormal, normal))))
                    {
                        if (canvas != null)
                        {
                            this.copyCachedBitmapOnCanvas(canvas, this._cachedBitmapHeight, offsetY, topAlign);
                            return canvas;
                        }
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
                    if (((this._cachedBitmapData.width == width) && (this._cachedBitmapData.height == height)))
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
            this._cachedBitmapNormal.assign(normal);
            if (!useTexture)
            {
                this._cachedBitmapHeight = height;
                if (this._cachedBitmapData == null)
                {
                    try
                    {
                        this._cachedBitmapData = new BitmapData(width, height, true, 0xFFFFFFFF);
                    }
                    catch(e:Error)
                    {
                        return null;
                    }
                }
                else
                {
                    this._cachedBitmapData.fillRect(this._cachedBitmapData.rect, 0xFFFFFFFF);
                }
                if (canvas != null)
                {
                    this.copyCachedBitmapOnCanvas(canvas, height, offsetY, topAlign);
                    return canvas;
                }
                return this._cachedBitmapData;
            }
            if (this._cachedBitmapData == null)
            {
                this._cachedBitmapHeight = height;
                try
                {
                    this._cachedBitmapData = new BitmapData(width, height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    _cachedBitmapData = null;
                    return null;
                }
            }
            var columns:Array = [];
            var i:int;
            while (i < this._columns.length)
            {
                column = (this._columns[i] as PlaneMaterialCellColumn);
                if (column != null)
                {
                    columnBitmapData = column.render(height, normal, offsetX, offsetY);
                    if (columnBitmapData != null)
                    {
                        columns.push(columnBitmapData);
                    }
                }
                i = (i + 1);
            }
            if (columns.length == 0)
            {
                if (canvas != null)
                {
                    return canvas;
                }
                return this._cachedBitmapData;
            }
            var maxColumnHeight:int;
            switch (this._repeatMode)
            {
                case REPEAT_MODE_BORDERS:
                    maxColumnHeight = this._Str_18476(this._cachedBitmapData, columns);
                    break;
                case REPEAT_MODE_CENTER:
                    maxColumnHeight = this._Str_17295(this._cachedBitmapData, columns);
                    break;
                case REPEAT_MODE_FIRST:
                    maxColumnHeight = this._Str_18019(this._cachedBitmapData, columns);
                    break;
                case REPEAT_MODE_LAST:
                    maxColumnHeight = this._Str_16099(this._cachedBitmapData, columns);
                    break;
                case REPEAT_MODE_RANDOM:
                    maxColumnHeight = this.renderRepeatRandom(this._cachedBitmapData, columns);
                    break;
                default:
                    maxColumnHeight = this._Str_18711(this._cachedBitmapData, columns);
            }
            this._cachedBitmapHeight = maxColumnHeight;
            if (canvas != null)
            {
                this.copyCachedBitmapOnCanvas(canvas, maxColumnHeight, offsetY, topAlign);
                return canvas;
            }
            return this._cachedBitmapData;
        }

        private function copyCachedBitmapOnCanvas(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:Boolean):void
        {
            if ((((k == null) || (this._cachedBitmapData == null)) || (k == this._cachedBitmapData)))
            {
                return;
            }
            if (!_arg_4)
            {
                _arg_3 = ((k.height - _arg_2) - _arg_3);
            }
            var _local_5:Rectangle;
            if (this._align == ALIGN_TOP)
            {
                _local_5 = new Rectangle(0, 0, this._cachedBitmapData.width, this._cachedBitmapHeight);
            }
            else
            {
                _local_5 = new Rectangle(0, (this._cachedBitmapData.height - this._cachedBitmapHeight), this._cachedBitmapData.width, this._cachedBitmapHeight);
            }
            k.copyPixels(this._cachedBitmapData, _local_5, new Point(0, _arg_3), null, null, true);
        }

        private function getColumnsWidth(k:Array):int
        {
            var _local_4:BitmapData;
            if (((k == null) || (k.length == 0)))
            {
                return 0;
            }
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = (k[_local_3] as BitmapData);
                if (_local_4 != null)
                {
                    _local_2 = (_local_2 + _local_4.width);
                }
                _local_3++;
            }
            return _local_2;
        }

        private function renderColumns(k:BitmapData, _arg_2:Array, _arg_3:int, _arg_4:Boolean):Point
        {
            var _local_8:int;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return new Point(_arg_3, 0);
            }
            var _local_5:int;
            var _local_6:BitmapData;
            var _local_7:int;
            while (_local_7 < _arg_2.length)
            {
                if (_arg_4)
                {
                    _local_6 = (_arg_2[_local_7] as BitmapData);
                }
                else
                {
                    _local_6 = (_arg_2[((_arg_2.length - 1) - _local_7)] as BitmapData);
                }
                if (_local_6 != null)
                {
                    if (!_arg_4)
                    {
                        _arg_3 = (_arg_3 - _local_6.width);
                    }
                    _local_8 = 0;
                    if (this._align == ALIGN_BOTTOM)
                    {
                        _local_8 = (k.height - _local_6.height);
                    }
                    k.copyPixels(_local_6, _local_6.rect, new Point(_arg_3, _local_8), _local_6, null, true);
                    if (_local_6.height > _local_5)
                    {
                        _local_5 = _local_6.height;
                    }
                    if (_arg_4)
                    {
                        _arg_3 = (_arg_3 + _local_6.width);
                    }
                    if ((((_arg_4) && (_arg_3 >= k.width)) || ((!(_arg_4)) && (_arg_3 <= 0))))
                    {
                        return new Point(_arg_3, _local_5);
                    }
                }
                _local_7++;
            }
            return new Point(_arg_3, _local_5);
        }

        private function _Str_18711(k:BitmapData, _arg_2:Array):int
        {
            var _local_6:Point;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:int = this.getColumnsWidth(_arg_2);
            var _local_5:int;
            if (_local_4 > k.width)
            {
            }
            while (_local_5 < k.width)
            {
                _local_6 = this.renderColumns(k, _arg_2, _local_5, true);
                _local_5 = _local_6.x;
                if (_local_6.y > _local_3)
                {
                    _local_3 = _local_6.y;
                }
                if (_local_6.x == 0)
                {
                    return _local_3;
                }
            }
            return _local_3;
        }

        private function _Str_18476(k:BitmapData, _arg_2:Array):int
        {
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:BitmapData;
            var _local_5:Array = [];
            var _local_6:int;
            var _local_7:int;
            _local_7 = 1;
            while (_local_7 < (_arg_2.length - 1))
            {
                _local_4 = (_arg_2[_local_7] as BitmapData);
                if (_local_4 != null)
                {
                    _local_6 = (_local_6 + _local_4.width);
                    _local_5.push(_local_4);
                }
                _local_7++;
            }
            if (this._columns.length == 1)
            {
                _local_4 = (this._columns[0] as BitmapData);
                if (_local_4 != null)
                {
                    _local_6 = _local_4.width;
                    _local_5.push(_local_4);
                }
            }
            var _local_8:* = ((k.width - _local_6) >> 1);
            var _local_9:Point;
            _local_9 = this.renderColumns(k, _local_5, _local_8, true);
            var _local_10:int = _local_9.x;
            if (_local_9.y > _local_3)
            {
                _local_3 = _local_9.y;
            }
            _local_4 = (_arg_2[0] as BitmapData);
            if (_local_4 != null)
            {
                _local_5 = [_local_4];
                while (_local_8 >= 0)
                {
                    _local_9 = this.renderColumns(k, _local_5, _local_8, false);
                    _local_8 = _local_9.x;
                    if (_local_9.y > _local_3)
                    {
                        _local_3 = _local_9.y;
                    }
                }
            }
            _local_4 = (_arg_2[(_arg_2.length - 1)] as BitmapData);
            if (_local_4 != null)
            {
                _local_5 = [_local_4];
                while (_local_10 < k.height)
                {
                    _local_9 = this.renderColumns(k, _local_5, _local_10, true);
                    _local_10 = _local_9.x;
                    if (_local_9.y > _local_3)
                    {
                        _local_3 = _local_9.y;
                    }
                }
            }
            return _local_3;
        }

        private function _Str_17295(k:BitmapData, _arg_2:Array):int
        {
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:Array;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:BitmapData;
            var _local_5:Array = [];
            var _local_6:Array = [];
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            _local_9 = 0;
            while (_local_9 < (_arg_2.length >> 1))
            {
                _local_4 = (_arg_2[_local_9] as BitmapData);
                if (_local_4 != null)
                {
                    _local_7 = (_local_7 + _local_4.width);
                    _local_5.push(_local_4);
                }
                _local_9++;
            }
            _local_9 = ((_arg_2.length >> 1) + 1);
            while (_local_9 < _arg_2.length)
            {
                _local_4 = (_arg_2[_local_9] as BitmapData);
                if (_local_4 != null)
                {
                    _local_8 = (_local_8 + _local_4.width);
                    _local_6.push(_local_4);
                }
                _local_9++;
            }
            var _local_10:Point;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int = k.width;
            if ((_local_7 + _local_8) > k.width)
            {
                _local_11 = ((_local_7 + _local_8) - k.width);
                _local_12 = (_local_12 - (_local_11 >> 1));
                _local_13 = (_local_13 + (_local_11 - (_local_11 >> 1)));
            }
            if (_local_11 == 0)
            {
                _local_4 = (_arg_2[(_arg_2.length >> 1)] as BitmapData);
                if (_local_4 != null)
                {
                    _local_14 = _local_4.width;
                    _local_15 = (k.width - (_local_7 + _local_8));
                    _local_16 = (Math.ceil((_local_15 / _local_14)) * _local_14);
                    _local_12 = (_local_7 - ((_local_16 - _local_15) >> 1));
                    _local_17 = (_local_12 + _local_16);
                    _local_18 = [_local_4];
                    while (_local_12 < _local_17)
                    {
                        _local_10 = this.renderColumns(k, _local_18, _local_12, true);
                        _local_12 = _local_10.x;
                        if (_local_10.y > _local_3)
                        {
                            _local_3 = _local_10.y;
                        }
                    }
                }
            }
            _local_12 = 0;
            _local_10 = this.renderColumns(k, _local_5, _local_12, true);
            if (_local_10.y > _local_3)
            {
                _local_3 = _local_10.y;
            }
            _local_10 = this.renderColumns(k, _local_6, _local_13, false);
            if (_local_10.y > _local_3)
            {
                _local_3 = _local_10.y;
            }
            return _local_3;
        }

        private function _Str_18019(k:BitmapData, _arg_2:Array):int
        {
            var _local_7:Array;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:BitmapData;
            var _local_5:int = k.width;
            var _local_6:Point = this.renderColumns(k, _arg_2, _local_5, false);
            _local_5 = _local_6.x;
            if (_local_6.y > _local_3)
            {
                _local_3 = _local_6.y;
            }
            _local_4 = (_arg_2[0] as BitmapData);
            if (_local_4 != null)
            {
                _local_7 = [_local_4];
                while (_local_5 >= 0)
                {
                    _local_6 = this.renderColumns(k, _local_7, _local_5, false);
                    _local_5 = _local_6.x;
                    if (_local_6.y > _local_3)
                    {
                        _local_3 = _local_6.y;
                    }
                }
            }
            return _local_3;
        }

        private function _Str_16099(k:BitmapData, _arg_2:Array):int
        {
            var _local_7:Array;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:BitmapData;
            var _local_5:int;
            var _local_6:Point = this.renderColumns(k, _arg_2, _local_5, true);
            _local_5 = _local_6.x;
            if (_local_6.y > _local_3)
            {
                _local_3 = _local_6.y;
            }
            _local_4 = (_arg_2[(_arg_2.length - 1)] as BitmapData);
            if (_local_4 != null)
            {
                _local_7 = [_local_4];
                while (_local_5 < k.width)
                {
                    _local_6 = this.renderColumns(k, _local_7, _local_5, true);
                    _local_5 = _local_6.x;
                    if (_local_6.y > _local_3)
                    {
                        _local_3 = _local_6.y;
                    }
                }
            }
            return _local_3;
        }

        private function renderRepeatRandom(k:BitmapData, _arg_2:Array):int
        {
            var _local_6:Array;
            var _local_7:Point;
            if ((((_arg_2 == null) || (_arg_2.length == 0)) || (k == null)))
            {
                return 0;
            }
            var _local_3:int;
            var _local_4:BitmapData;
            var _local_5:int;
            while (_local_5 < k.width)
            {
                _local_4 = (_arg_2[_Str_12526(_arg_2.length)] as BitmapData);
                if (_local_4 != null)
                {
                    _local_6 = [_local_4];
                    _local_7 = this.renderColumns(k, _local_6, _local_5, true);
                    _local_5 = _local_7.x;
                    if (_local_7.y > _local_3)
                    {
                        _local_3 = _local_7.y;
                    }
                }
                else
                {
                    return _local_3;
                }
            }
            return _local_3;
        }

        public function _Str_23721(k:int):Array
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:PlaneMaterialCellColumn;
            if (this._repeatMode == REPEAT_MODE_RANDOM)
            {
                _local_2 = [];
                _local_3 = 0;
                while (_local_3 < k)
                {
                    _local_4 = this._columns[_Str_12526(this._columns.length)];
                    if (_local_4 != null)
                    {
                        _local_2.push(_local_4);
                        if (_local_4.width > 1)
                        {
                            _local_3 = (_local_3 + _local_4.width);
                        }
                        else
                        {
                            break;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                return _local_2;
            }
            return this._columns;
        }
    }
}
