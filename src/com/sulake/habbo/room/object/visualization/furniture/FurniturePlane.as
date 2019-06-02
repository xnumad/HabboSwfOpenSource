package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class FurniturePlane 
    {
        private var _geometryUpdateId:int = -1;
        private var _geometryDirX:Number = 0;
        private var _geometryDirY:Number = 0;
        private var _geometryDirZ:Number = 0;
        private var _geometryScale:Number = 0;
        private var _origin:Vector3d = null;
        private var _loc:Vector3d = null;
        private var _leftSide:Vector3d = null;
        private var _rightSide:Vector3d = null;
        private var _leftSideOriginal:Vector3d = null;
        private var _rightSideOriginal:Vector3d = null;
        private var _normal:Vector3d = null;
        private var _isVisible:Boolean = true;
        private var _bitmapData:BitmapData = null;
        private var _textures:Map = null;
        private var _offset:Point = null;
        private var _relativeDepth:Number = 0;
        private var _color:uint = 0;
        private var _rotated:Boolean = false;
        private var _id:String = null;
        private var _cornerA:Vector3d = null;
        private var _cornerB:Vector3d = null;
        private var _cornerC:Vector3d = null;
        private var _cornerD:Vector3d = null;
        private var _width:Number = 0;
        private var _height:Number = 0;

        public function FurniturePlane(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d)
        {
            this._origin = new Vector3d();
            this._loc = new Vector3d();
            this._loc.assign(k);
            this._leftSide = new Vector3d();
            this._leftSide.assign(_arg_2);
            this._rightSide = new Vector3d();
            this._rightSide.assign(_arg_3);
            this._leftSideOriginal = new Vector3d();
            this._leftSideOriginal.assign(_arg_2);
            this._rightSideOriginal = new Vector3d();
            this._rightSideOriginal.assign(_arg_3);
            this._normal = Vector3d.crossProduct(this._leftSide, this._rightSide);
            if (this._normal.length > 0)
            {
                this._normal.mul((1 / this._normal.length));
            }
            this._offset = new Point();
            this._cornerA = new Vector3d();
            this._cornerB = new Vector3d();
            this._cornerC = new Vector3d();
            this._cornerD = new Vector3d();
            this._textures = new Map();
        }

        public function get bitmapData():BitmapData
        {
            if (this._isVisible)
            {
                if (this._bitmapData != null)
                {
                    return this._bitmapData.clone();
                }
            }
            return null;
        }

        public function get visible():Boolean
        {
            return this._isVisible;
        }

        public function get offset():Point
        {
            return this._offset;
        }

        public function get relativeDepth():Number
        {
            return this._relativeDepth;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function set color(k:uint):void
        {
            this._color = k;
        }

        public function get _Str_5424():IVector3d
        {
            return this._leftSide;
        }

        public function get _Str_4968():IVector3d
        {
            return this._rightSide;
        }

        public function get location():IVector3d
        {
            return this._loc;
        }

        public function get normal():IVector3d
        {
            return this._normal;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:BitmapData;
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
            if (this._textures != null)
            {
                k = 0;
                while (k < this._textures.length)
                {
                    _local_2 = (this._textures.getWithIndex(k) as BitmapData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._textures.dispose();
                this._textures = null;
            }
            this._origin = null;
            this._loc = null;
            this._leftSide = null;
            this._rightSide = null;
            this._leftSideOriginal = null;
            this._rightSideOriginal = null;
            this._normal = null;
            this._cornerA = null;
            this._cornerB = null;
            this._cornerC = null;
            this._cornerD = null;
        }

        public function setRotation(k:Boolean):void
        {
            if (k != this._rotated)
            {
                if (!k)
                {
                    this._leftSide.assign(this._leftSideOriginal);
                    this._rightSide.assign(this._rightSideOriginal);
                }
                else
                {
                    this._leftSide.assign(this._leftSideOriginal);
                    this._leftSide.mul((this._rightSideOriginal.length / this._leftSideOriginal.length));
                    this._rightSide.assign(this._rightSideOriginal);
                    this._rightSide.mul((this._leftSideOriginal.length / this._rightSideOriginal.length));
                }
                this._geometryUpdateId = -1;
                this._geometryDirX = (this._geometryDirX - 1);
                this._rotated = k;
                this._Str_11000();
            }
        }

        private function _Str_17642(k:String, _arg_2:BitmapData):Boolean
        {
            var _local_3:BitmapData = (this._textures.remove(k) as BitmapData);
            if (((!(_local_3 == null)) && (!(_arg_2 == _local_3))))
            {
                _local_3.dispose();
            }
            this._textures.add(k, _arg_2);
            return true;
        }

        private function _Str_11000():void
        {
            var k:int;
            var _local_2:BitmapData;
            if (this._textures != null)
            {
                k = 0;
                while (k < this._textures.length)
                {
                    _local_2 = (this._textures.getWithIndex(k) as BitmapData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._textures.reset();
            }
        }

        private function getTextureIdentifier(k:IRoomGeometry):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:String = String(k.scale);
            return _local_2;
        }

        private function _Str_10518(k:IRoomGeometry):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:String = this.getTextureIdentifier(k);
            var _local_3:BitmapData = (this._textures.getValue(_local_2) as BitmapData);
            if (((this._width > 0) && (this._height > 0)))
            {
                if (_local_3 == null)
                {
                    return true;
                }
            }
            return false;
        }

        private function _Str_10114(k:IRoomGeometry, _arg_2:int):BitmapData
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:IVector3d;
            if (k == null)
            {
                return null;
            }
            var _local_3:String = this.getTextureIdentifier(k);
            var _local_4:BitmapData;
            if (this._Str_10518(k))
            {
                _local_5 = (this._leftSide.length * k.scale);
                _local_6 = (this._rightSide.length * k.scale);
                if (_local_5 < 1)
                {
                    _local_5 = 1;
                }
                if (_local_6 < 1)
                {
                    _local_6 = 1;
                }
                _local_7 = k.getCoordinatePosition(this._normal);
                _local_4 = (this._textures.getValue(_local_3) as BitmapData);
                if (_local_4 == null)
                {
                    _local_4 = new BitmapData(_local_5, _local_6, true, (0xFF000000 | this._color));
                    if (_local_4 != null)
                    {
                        this._Str_17642(_local_3, _local_4);
                    }
                }
            }
            else
            {
                _local_4 = (this._textures.getValue(_local_3) as BitmapData);
            }
            if (_local_4 != null)
            {
                return _local_4;
            }
            return null;
        }

        public function update(k:IRoomGeometry, _arg_2:int):Boolean
        {
            var _local_4:IVector3d;
            var _local_5:Number;
            var _local_6:IVector3d;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:BitmapData;
            if ((((((k == null) || ((this._loc == null) && (!(this._origin == null)))) || (this._leftSide == null)) || (this._rightSide == null)) || (this._normal == null)))
            {
                return false;
            }
            var _local_3:Boolean;
            if (k.updateId != this._geometryUpdateId)
            {
                this._geometryUpdateId = k.updateId;
                _local_4 = k.direction;
                if (((!(_local_4 == null)) && ((((!(_local_4.x == this._geometryDirX)) || (!(_local_4.y == this._geometryDirY))) || (!(_local_4.z == this._geometryDirZ))) || (!(k.scale == this._geometryScale)))))
                {
                    this._geometryDirX = _local_4.x;
                    this._geometryDirY = _local_4.y;
                    this._geometryDirZ = _local_4.z;
                    this._geometryScale = k.scale;
                    _local_3 = true;
                    _local_5 = 0;
                    _local_5 = Vector3d.cosAngle(k.directionAxis, this.normal);
                    if (_local_5 > -0.001)
                    {
                        if (this._isVisible)
                        {
                            this._isVisible = false;
                            return true;
                        }
                        return false;
                    }
                    this._Str_18702(k);
                    _local_6 = k.getScreenPosition(this._origin);
                    _local_7 = _local_6.z;
                    _local_8 = Math.max((this._cornerA.z - _local_7), (this._cornerB.z - _local_7), (this._cornerC.z - _local_7), (this._cornerD.z - _local_7));
                    this._relativeDepth = _local_8;
                    this._isVisible = true;
                }
            }
            if (((this._Str_10518(k)) || (_local_3)))
            {
                if ((((this._bitmapData == null) || (!(this._width == this._bitmapData.width))) || (!(this._height == this._bitmapData.height))))
                {
                    if (this._bitmapData != null)
                    {
                        this._bitmapData.dispose();
                        this._bitmapData = null;
                        if (((this._width < 1) || (this._height < 1)))
                        {
                            return true;
                        }
                    }
                    else
                    {
                        if (((this._width < 1) || (this._height < 1)))
                        {
                            return false;
                        }
                    }
                    this._bitmapData = new BitmapData(this._width, this._height, true, 0xFFFFFF);
                    this._bitmapData.lock();
                }
                else
                {
                    this._bitmapData.lock();
                    this._bitmapData.fillRect(this._bitmapData.rect, 0xFFFFFF);
                }
                _local_9 = this._Str_10114(k, _arg_2);
                if (_local_9 != null)
                {
                    this._Str_17000(k, _local_9);
                }
                this._bitmapData.unlock();
                return true;
            }
            return false;
        }

        private function _Str_18702(k:IRoomGeometry):void
        {
            this._cornerA.assign(k.getScreenPosition(this._loc));
            this._cornerB.assign(k.getScreenPosition(Vector3d.sum(this._loc, this._rightSide)));
            this._cornerC.assign(k.getScreenPosition(Vector3d.sum(Vector3d.sum(this._loc, this._leftSide), this._rightSide)));
            this._cornerD.assign(k.getScreenPosition(Vector3d.sum(this._loc, this._leftSide)));
            this._offset = k.getScreenPoint(this._origin);
            this._cornerA.x = Math.round(this._cornerA.x);
            this._cornerA.y = Math.round(this._cornerA.y);
            this._cornerB.x = Math.round(this._cornerB.x);
            this._cornerB.y = Math.round(this._cornerB.y);
            this._cornerC.x = Math.round(this._cornerC.x);
            this._cornerC.y = Math.round(this._cornerC.y);
            this._cornerD.x = Math.round(this._cornerD.x);
            this._cornerD.y = Math.round(this._cornerD.y);
            this._offset.x = Math.round(this._offset.x);
            this._offset.y = Math.round(this._offset.y);
            var _local_2:Number = Math.min(this._cornerA.x, this._cornerB.x, this._cornerC.x, this._cornerD.x);
            var _local_3:Number = Math.max(this._cornerA.x, this._cornerB.x, this._cornerC.x, this._cornerD.x);
            var _local_4:Number = Math.min(this._cornerA.y, this._cornerB.y, this._cornerC.y, this._cornerD.y);
            var _local_5:Number = Math.max(this._cornerA.y, this._cornerB.y, this._cornerC.y, this._cornerD.y);
            _local_3 = (_local_3 - _local_2);
            this._offset.x = (this._offset.x - _local_2);
            this._cornerA.x = (this._cornerA.x - _local_2);
            this._cornerB.x = (this._cornerB.x - _local_2);
            this._cornerC.x = (this._cornerC.x - _local_2);
            this._cornerD.x = (this._cornerD.x - _local_2);
            _local_5 = (_local_5 - _local_4);
            this._offset.y = (this._offset.y - _local_4);
            this._cornerA.y = (this._cornerA.y - _local_4);
            this._cornerB.y = (this._cornerB.y - _local_4);
            this._cornerC.y = (this._cornerC.y - _local_4);
            this._cornerD.y = (this._cornerD.y - _local_4);
            this._width = _local_3;
            this._height = _local_5;
        }

        private function _Str_17000(k:IRoomGeometry, _arg_2:BitmapData):void
        {
            if (((((((this._cornerA == null) || (this._cornerB == null)) || (this._cornerC == null)) || (this._cornerD == null)) || (_arg_2 == null)) || (this._bitmapData == null)))
            {
                return;
            }
            var _local_3:Number = (this._cornerD.x - this._cornerC.x);
            var _local_4:Number = (this._cornerD.y - this._cornerC.y);
            var _local_5:Number = (this._cornerB.x - this._cornerC.x);
            var _local_6:Number = (this._cornerB.y - this._cornerC.y);
            if (Math.abs((_local_5 - _arg_2.width)) <= 1)
            {
                _local_5 = _arg_2.width;
            }
            if (Math.abs((_local_6 - _arg_2.width)) <= 1)
            {
                _local_6 = _arg_2.width;
            }
            if (Math.abs((_local_3 - _arg_2.height)) <= 1)
            {
                _local_3 = _arg_2.height;
            }
            if (Math.abs((_local_4 - _arg_2.height)) <= 1)
            {
                _local_4 = _arg_2.height;
            }
            var _local_7:Number = (_local_5 / _arg_2.width);
            var _local_8:Number = (_local_6 / _arg_2.width);
            var _local_9:Number = (_local_3 / _arg_2.height);
            var _local_10:Number = (_local_4 / _arg_2.height);
            var _local_11:Matrix = new Matrix();
            _local_11.a = _local_7;
            _local_11.b = _local_8;
            _local_11.c = _local_9;
            _local_11.d = _local_10;
            _local_11.translate(this._cornerC.x, this._cornerC.y);
            this.draw(_arg_2, _local_11);
        }

        private function draw(k:BitmapData, _arg_2:Matrix):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:int;
            if (this._bitmapData != null)
            {
                if ((((((_arg_2.a == 1) && (_arg_2.d == 1)) && (_arg_2.c == 0)) && (!(_arg_2.b == 0))) && (Math.abs(_arg_2.b) <= 1)))
                {
                    _local_3 = 0;
                    _local_4 = 0;
                    _local_5 = 0;
                    _local_6 = 0;
                    if (_arg_2.b > 0)
                    {
                        _arg_2.ty++;
                    }
                    _local_7 = 0;
                    while (_local_3 < k.width)
                    {
                        _local_3++;
                        _local_5 = (_local_5 + Math.abs(_arg_2.b));
                        if (_local_5 >= 1)
                        {
                            this._bitmapData.copyPixels(k, new Rectangle((_local_4 + _local_6), 0, (_local_3 - _local_4), k.height), new Point((_arg_2.tx + _local_4), (_arg_2.ty + _local_7)), null, null, true);
                            _local_4 = _local_3;
                            if (_arg_2.b > 0)
                            {
                                _local_7++;
                            }
                            else
                            {
                                _local_7--;
                            }
                            _local_5 = 0;
                        }
                    }
                    if (_local_5 > 0)
                    {
                        this._bitmapData.copyPixels(k, new Rectangle(_local_4, 0, (_local_3 - _local_4), k.height), new Point((_arg_2.tx + _local_4), (_arg_2.ty + _local_7)), null, null, true);
                    }
                    return;
                }
                this._bitmapData.draw(k, _arg_2, null, null, null, false);
            }
        }
    }
}
