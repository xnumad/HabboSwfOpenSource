package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.IRoomPlane;
    import flash.geom.Point;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.utils.Canvas;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMask;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualizationLayer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellMatrix;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellColumn;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCell;
    import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.BitmapDataChannel;
    import flash.display.BlendMode;

    public class RoomPlane implements IRoomPlane 
    {
        private static const ZERO_POINT:Point = new Point(0, 0);
        public static const TYPE_WALL:int = 0;
        public static const TYPE_FLOOR:int = 1;
        public static const TYPE_LANDSCAPE:int = 2;
        public static const _Str_3272:int = 3;
        private static var _Str_10032:int = 1;

        private var _disposed:Boolean = false;
        private var _randomSeed:int = 0;
        private var _origin:Vector3d = null;
        private var _location:Vector3d = null;
        private var _leftSide:Vector3d = null;
        private var _rightSide:Vector3d = null;
        private var _normal:Vector3d = null;
        private var _secondaryNormals:Array;
        private var FLOOR_COLOR:int = -1;
        private var _type:int = 0;
        private var _isVisible:Boolean = false;
        private var _bitmapData:BitmapData = null;
        private var _hasTexture:Boolean = true;
        private var _offset:Point = null;
        private var _relativeDepth:Number = 0;
        private var _color:uint = 0;
        private var _rasterizer:IPlaneRasterizer = null;
        private var _maskManager:PlaneMaskManager = null;
        private var _id:String = null;
        private var _uniqueId:int = 0;
        private var _textureOffsetX:Number = 0;
        private var _textureOffsetY:Number = 0;
        private var _textureMaxX:Number = 0;
        private var _textureMaxY:Number = 0;
        private var _textures:Map = null;
        private var _activeTexture:PlaneBitmapData = null;
        private var _useMask:Boolean = false;
        private var _bitmapMasks:Array;
        private var _rectangleMasks:Array;
        private var _maskChanged:Boolean = false;
        private var _maskBitmapData:BitmapData = null;
        private var _maskBufferBitmapData:BitmapData = null;
        private var _bitmapMasksOld:Array;
        private var _rectangleMasksOld:Array;
        private var _cornerA:Vector3d = null;
        private var _cornerB:Vector3d = null;
        private var _cornerC:Vector3d = null;
        private var _cornerD:Vector3d = null;
        private var _width:Number = 0;
        private var _height:Number = 0;
        private var _canBeVisible:Boolean = true;

        public function RoomPlane(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:Boolean, _arg_7:Array, _arg_8:int, _arg_9:Number=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:Number=0)
        {
            var _local_13:int;
            var _local_14:IVector3d;
            var _local_15:Vector3d;
            this._secondaryNormals = [];
            this._bitmapMasks = [];
            this._rectangleMasks = [];
            this._bitmapMasksOld = [];
            this._rectangleMasksOld = [];
            super();
            this._randomSeed = _arg_8;
            this._origin = new Vector3d();
            this._origin.assign(k);
            this._location = new Vector3d();
            this._location.assign(_arg_2);
            this._leftSide = new Vector3d();
            this._leftSide.assign(_arg_3);
            this._rightSide = new Vector3d();
            this._rightSide.assign(_arg_4);
            this._normal = Vector3d.crossProduct(this._leftSide, this._rightSide);
            if (this._normal.length > 0)
            {
                this._normal.mul((1 / this._normal.length));
            }
            if (_arg_7 != null)
            {
                _local_13 = 0;
                while (_local_13 < _arg_7.length)
                {
                    _local_14 = (_arg_7[_local_13] as IVector3d);
                    if (_local_14 != null)
                    {
                        _local_15 = new Vector3d();
                        _local_15.assign(_local_14);
                        this._secondaryNormals.push(_local_15);
                    }
                    _local_13++;
                }
            }
            this._offset = new Point();
            this._type = _arg_5;
            this._textures = new Map();
            this._cornerA = new Vector3d();
            this._cornerB = new Vector3d();
            this._cornerC = new Vector3d();
            this._cornerD = new Vector3d();
            this._textureOffsetX = _arg_9;
            this._textureOffsetY = _arg_10;
            this._textureMaxX = _arg_11;
            this._textureMaxY = _arg_12;
            this._useMask = _arg_6;
            this._uniqueId = _Str_10032++;
        }

        private static function blend(k:uint, _arg_2:uint):uint
        {
            return Canvas.colorize(_arg_2, (k | 0xFF000000)) & 0xFFFFFF;
        }


        public function set _Str_14801(k:Boolean):void
        {
            if (k != this._canBeVisible)
            {
                if (!this._canBeVisible)
                {
                    this._Str_11000();
                }
                this._canBeVisible = k;
            }
        }

        public function get _Str_14801():Boolean
        {
            return this._canBeVisible;
        }

        public function get bitmapData():BitmapData
        {
            var bitmap:BitmapData;
            if (this.visible)
            {
                if (this._bitmapData != null)
                {
                    try
                    {
                        bitmap = this._bitmapData.clone();
                    }
                    catch(e:Error)
                    {
                        return null;
                    }
                }
            }
            return bitmap;
        }

        public function get visible():Boolean
        {
            return (this._isVisible) && (this._canBeVisible);
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

        public function get type():int
        {
            return this._type;
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
            return this._location;
        }

        public function get normal():IVector3d
        {
            return this._normal;
        }

        public function get _Str_18448():Boolean
        {
            return this._hasTexture;
        }

        public function set _Str_18448(k:Boolean):void
        {
            this._hasTexture = k;
        }

        public function set rasterizer(k:IPlaneRasterizer):void
        {
            this._rasterizer = k;
        }

        public function set _Str_16279(k:PlaneMaskManager):void
        {
            this._maskManager = k;
        }

        public function set id(k:String):void
        {
            if (k != this._id)
            {
                this._Str_11000();
                this._id = k;
            }
        }

        public function get uniqueId():int
        {
            return this._uniqueId;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:PlaneBitmapData;
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
                    _local_2 = (this._textures.getWithIndex(k) as PlaneBitmapData);
                    if (_local_2 != null)
                    {
                        if (_local_2.bitmap != null)
                        {
                            _local_2.bitmap.dispose();
                        }
                        _local_2.dispose();
                    }
                    k++;
                }
                this._textures.dispose();
                this._textures = null;
            }
            this._activeTexture = null;
            this._location = null;
            this._origin = null;
            this._leftSide = null;
            this._rightSide = null;
            this._normal = null;
            this._rasterizer = null;
            this._cornerA = null;
            this._cornerB = null;
            this._cornerC = null;
            this._cornerD = null;
            this._bitmapMasks = null;
            this._rectangleMasks = null;
            if (this._maskBitmapData != null)
            {
                this._maskBitmapData.dispose();
                this._maskBitmapData = null;
            }
            if (this._maskBufferBitmapData != null)
            {
                this._maskBufferBitmapData.dispose();
                this._maskBufferBitmapData = null;
            }
            this._disposed = true;
        }

        public function copyBitmapData(k:BitmapData):BitmapData
        {
            if (this.visible)
            {
                if (((!(this._bitmapData == null)) && (!(k == null))))
                {
                    if (((this._bitmapData.width == k.width) && (this._bitmapData.height == k.height)))
                    {
                        k.copyPixels(this._bitmapData, this._bitmapData.rect, ZERO_POINT);
                        return k;
                    }
                }
            }
            return null;
        }

        private function _Str_17642(k:String, _arg_2:PlaneBitmapData):Boolean
        {
            var _local_3:PlaneBitmapData = (this._textures.remove(k) as PlaneBitmapData);
            if (_local_3 != null)
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.bitmap == _local_3.bitmap))))
                {
                    _local_3.bitmap.dispose();
                }
                _local_3.dispose();
            }
            this._activeTexture = _arg_2;
            this._textures.add(k, _arg_2);
            return true;
        }

        private function _Str_11000(k:BitmapData=null):void
        {
            var _local_2:int;
            var _local_3:PlaneBitmapData;
            if (this._textures != null)
            {
                _local_2 = 0;
                while (_local_2 < this._textures.length)
                {
                    _local_3 = (this._textures.getWithIndex(_local_2) as PlaneBitmapData);
                    if (_local_3 != null)
                    {
                        if (((!(_local_3.bitmap == null)) && (!(_local_3.bitmap == k))))
                        {
                            _local_3.bitmap.dispose();
                        }
                        _local_3.dispose();
                    }
                    _local_2++;
                }
                this._textures.reset();
            }
            this._activeTexture = null;
        }

        private function getTextureIdentifier(k:Number):String
        {
            if (this._rasterizer != null)
            {
                return this._rasterizer.getTextureIdentifier(k, this.normal);
            }
            return String(k);
        }

        private function _Str_10518(k:IRoomGeometry, _arg_2:int):Boolean
        {
            var _local_4:String;
            if (k == null)
            {
                return false;
            }
            var _local_3:PlaneBitmapData = this._activeTexture;
            if (_local_3 == null)
            {
                _local_4 = this.getTextureIdentifier(k.scale);
                _local_3 = (this._textures.getValue(_local_4) as PlaneBitmapData);
            }
            this.updateMaskChangeStatus();
            if (((this._canBeVisible) && (((_local_3 == null) || ((_local_3.timeStamp >= 0) && (_arg_2 > _local_3.timeStamp))) || (this._maskChanged))))
            {
                return true;
            }
            return false;
        }

        private function _Str_10114(k:IRoomGeometry, _arg_2:int):BitmapData
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:IVector3d;
            var _local_8:BitmapData;
            var _local_9:BitmapData;
            if (k == null)
            {
                return null;
            }
            var _local_3:PlaneBitmapData;
            var _local_4:String;
            if (this._Str_10518(k, _arg_2))
            {
                _local_5 = (this._leftSide.length * k.scale);
                _local_6 = (this._rightSide.length * k.scale);
                _local_7 = k.getCoordinatePosition(this._normal);
                _local_4 = this.getTextureIdentifier(k.scale);
                if (this._activeTexture != null)
                {
                    _local_3 = this._activeTexture;
                }
                else
                {
                    _local_3 = (this._textures.getValue(_local_4) as PlaneBitmapData);
                }
                _local_8 = null;
                if (_local_3 != null)
                {
                    _local_8 = _local_3.bitmap;
                }
                if (this._rasterizer != null)
                {
                    _local_3 = this._rasterizer.render(_local_8, this._id, _local_5, _local_6, k.scale, _local_7, this._hasTexture, this._textureOffsetX, this._textureOffsetY, this._textureMaxX, this._textureMaxY, _arg_2);
                    if (_local_3 != null)
                    {
                        if (((!(_local_8 == null)) && (!(_local_3.bitmap == _local_8))))
                        {
                            _local_8.dispose();
                        }
                    }
                }
                else
                {
                    _local_9 = new BitmapData(_local_5, _local_6, true, (0xFF000000 | this._color));
                    _local_3 = new PlaneBitmapData(_local_9, -1);
                }
                if (_local_3 != null)
                {
                    this.updateMask(_local_3.bitmap, k);
                    this._Str_17642(_local_4, _local_3);
                }
            }
            else
            {
                if (this._activeTexture != null)
                {
                    _local_3 = this._activeTexture;
                }
                else
                {
                    _local_4 = this.getTextureIdentifier(k.scale);
                    _local_3 = (this._textures.getValue(_local_4) as PlaneBitmapData);
                }
            }
            if (_local_3 != null)
            {
                this._activeTexture = _local_3;
                return _local_3.bitmap;
            }
            return null;
        }

        private function _Str_23649(k:IRoomGeometry):PlaneDrawingData
        {
            var _local_7:PlaneMask;
            var _local_8:String;
            var _local_9:IVector3d;
            var _local_10:IGraphicAsset;
            var _local_11:Point;
            if (!this._useMask)
            {
                return null;
            }
            var _local_2:RoomPlaneBitmapMask;
            var _local_3:int;
            var _local_4:int;
            var _local_5:PlaneDrawingData = new PlaneDrawingData();
            var _local_6:int;
            while (_local_6 < this._bitmapMasks.length)
            {
                _local_2 = (this._bitmapMasks[_local_6] as RoomPlaneBitmapMask);
                if (_local_2 != null)
                {
                    _local_7 = this._maskManager.getMask(_local_2.type);
                    if (_local_7 != null)
                    {
                        _local_8 = _local_7.getAliasByName(k.scale);
                        if (_local_8 != null)
                        {
                            _local_9 = k.getCoordinatePosition(this._normal);
                            _local_10 = _local_7.getGraphicAsset(k.scale, _local_9);
                            if (_local_10 != null)
                            {
                                _local_3 = (this._maskBitmapData.width * (1 - (_local_2._Str_5120 / this._leftSide.length)));
                                _local_4 = (this._maskBitmapData.height * (1 - (_local_2._Str_4659 / this._rightSide.length)));
                                _local_11 = new Point((_local_3 + _local_10.offsetX), (_local_4 + _local_10.offsetY));
                                _local_5.addMask(_local_8, _local_11, _local_10.flipH, _local_10.flipV);
                            }
                        }
                    }
                }
                _local_6++;
            }
            return _local_5;
        }

        private function _Str_24802(k:IRoomGeometry):int
        {
            var _local_2:Point = k.getScreenPoint(new Vector3d(0, 0, 0));
            var _local_3:Point = k.getScreenPoint(new Vector3d(0, 1, 0));
            return Math.round((this._leftSide.length * Math.abs((_local_2.x - _local_3.x))));
        }

        public function _Str_22136(geometry:IRoomGeometry):Array
        {
            var maskData:PlaneDrawingData;
            var data:PlaneDrawingData;
            var layers:Array;
            var layer:PlaneVisualizationLayer;
            var i:int;
            var normal:IVector3d;
            var cm:PlaneMaterialCellMatrix;
            var column:PlaneMaterialCellColumn;
            var assetNames:Array;
            var cell:PlaneMaterialCell;
            var name:String;
            var drawingDatas:Array = [];
            if (this._isVisible)
            {
                maskData = null;
                try
                {
                    maskData = this._Str_23649(geometry);
                    layers = this._rasterizer._Str_8988(this._id);
                    i = 0;
                    while (i < layers.length)
                    {
                        layer = (layers[i] as PlaneVisualizationLayer);
                        if (layer != null)
                        {
                            if (((this._hasTexture) && (!(layer.material() == null))))
                            {
                                normal = geometry.getCoordinatePosition(this._normal);
                                cm = layer.material().getMaterialCellMatrix(normal);
                                data = new PlaneDrawingData(maskData, blend(this._color, layer._Str_751()), cm._Str_14945());
                                Randomizer.setSeed(this._randomSeed);
                                for each (column in cm._Str_23721(this._Str_24802(geometry)))
                                {
                                    assetNames = [];
                                    for each (cell in column._Str_22299())
                                    {
                                        name = cell.getAliasByName(normal);
                                        if (name != null)
                                        {
                                            assetNames.push(name);
                                        }
                                    }
                                    if (assetNames.length > 0)
                                    {
                                        if (!column._Str_24523())
                                        {
                                            assetNames.push("");
                                        }
                                        data._Str_22862(assetNames);
                                    }
                                }
                                if (data._Str_17636.length > 0)
                                {
                                    drawingDatas.push(data);
                                }
                            }
                            else
                            {
                                data = new PlaneDrawingData(maskData, blend(this._color, layer._Str_751()));
                                drawingDatas.push(data);
                            }
                        }
                        i = (i + 1);
                    }
                }
                catch(e:Error)
                {
                    Logger.log("Error in getting RoomPlane drawing data.", e);
                }
                if (drawingDatas.length == 0)
                {
                    drawingDatas.push(new PlaneDrawingData(maskData, this._color));
                }
            }
            return drawingDatas;
        }

        private function addOutlines(k:PlaneBitmapData):void
        {
        }

        public function update(geometry:IRoomGeometry, timeSinceStartMs:int):Boolean
        {
            var cosAngle:Number;
            var i:int;
            var originPos:IVector3d;
            var originZ:Number;
            var relativeDepth:Number;
            var texture:BitmapData;
            if (((geometry == null) || (this._disposed)))
            {
                return false;
            }
            var geometryChanged:Boolean;
            if (this.FLOOR_COLOR != geometry.updateId)
            {
                geometryChanged = true;
            }
            if (((!(geometryChanged)) || (!(this._canBeVisible))))
            {
                if (!this.visible)
                {
                    return false;
                }
            }
            if (geometryChanged)
            {
                this._activeTexture = null;
                cosAngle = 0;
                cosAngle = Vector3d.cosAngle(geometry.directionAxis, this.normal);
                if (cosAngle > -0.001)
                {
                    if (this._isVisible)
                    {
                        this._isVisible = false;
                        return true;
                    }
                    return false;
                }
                i = 0;
                while (i < this._secondaryNormals.length)
                {
                    cosAngle = Vector3d.cosAngle(geometry.directionAxis, this._secondaryNormals[i]);
                    if (cosAngle > -0.001)
                    {
                        if (this._isVisible)
                        {
                            this._isVisible = false;
                            return true;
                        }
                        return false;
                    }
                    i = (i + 1);
                }
                this._Str_18702(geometry);
                originPos = geometry.getScreenPosition(this._origin);
                originZ = originPos.z;
                relativeDepth = (Math.max(this._cornerA.z, this._cornerB.z, this._cornerC.z, this._cornerD.z) - originZ);
                if (this._type == TYPE_LANDSCAPE)
                {
                    relativeDepth = (relativeDepth - ((this._location.z + Math.min(0, this._leftSide.z, this._rightSide.z)) * 8));
                }
                if (this._type == _Str_3272)
                {
                    relativeDepth = (relativeDepth + 0.02);
                }
                this._relativeDepth = relativeDepth;
                this._isVisible = true;
                this.FLOOR_COLOR = geometry.updateId;
            }
            if (((geometryChanged) || (this._Str_10518(geometry, timeSinceStartMs))))
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
                    try
                    {
                        this._bitmapData = new BitmapData(this._width, this._height, true, 0xFFFFFF);
                    }
                    catch(e:Error)
                    {
                        _bitmapData = null;
                        dispose();
                    }
                    if (this._bitmapData == null)
                    {
                        return false;
                    }
                    this._bitmapData.lock();
                }
                else
                {
                    this._bitmapData.lock();
                    this._bitmapData.fillRect(this._bitmapData.rect, 0xFFFFFF);
                }
                Randomizer.setSeed(this._randomSeed);
                texture = this._Str_10114(geometry, timeSinceStartMs);
                if (texture != null)
                {
                    this._Str_17000(geometry, texture);
                }
                else
                {
                    this.dispose();
                    return false;
                }
                this._bitmapData.unlock();
                return (texture) || (geometryChanged);
            }
            return false;
        }

        private function _Str_18702(k:IRoomGeometry):void
        {
            this._cornerA.assign(k.getScreenPosition(this._location));
            this._cornerB.assign(k.getScreenPosition(Vector3d.sum(this._location, this._rightSide)));
            this._cornerC.assign(k.getScreenPosition(Vector3d.sum(Vector3d.sum(this._location, this._leftSide), this._rightSide)));
            this._cornerD.assign(k.getScreenPosition(Vector3d.sum(this._location, this._leftSide)));
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
            if (((this._type == TYPE_FLOOR) || (this._type == _Str_3272)))
            {
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
                if (((((((_arg_2.a == 1) && (_arg_2.d == 1)) && (_arg_2.c == 0)) && (!(_arg_2.b == 0))) && (Math.abs(_arg_2.b) <= 1)) && ((this._type == TYPE_FLOOR) || (this._type == _Str_3272))))
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

        public function resetBitmapMasks():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._useMask)
            {
                if (this._bitmapMasks.length == 0)
                {
                    return;
                }
                this._maskChanged = true;
                this._bitmapMasks = [];
            }
        }

        public function addBitmapMask(k:String, _arg_2:Number, _arg_3:Number):Boolean
        {
            var _local_4:RoomPlaneBitmapMask;
            var _local_5:int;
            if (this._useMask)
            {
                _local_4 = null;
                _local_5 = 0;
                while (_local_5 < this._bitmapMasks.length)
                {
                    _local_4 = (this._bitmapMasks[_local_5] as RoomPlaneBitmapMask);
                    if (_local_4 != null)
                    {
                        if ((((_local_4.type == k) && (_local_4._Str_5120 == _arg_2)) && (_local_4._Str_4659 == _arg_3)))
                        {
                            return false;
                        }
                    }
                    _local_5++;
                }
                _local_4 = new RoomPlaneBitmapMask(k, _arg_2, _arg_3);
                this._bitmapMasks.push(_local_4);
                this._maskChanged = true;
                return true;
            }
            return false;
        }

        public function resetRectangleMasks():void
        {
            if (this._useMask)
            {
                if (this._rectangleMasks.length == 0)
                {
                    return;
                }
                this._maskChanged = true;
                this._rectangleMasks = [];
            }
        }

        public function addRectangleMask(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Boolean
        {
            var _local_5:RoomPlaneRectangleMask;
            var _local_6:int;
            if (this._useMask)
            {
                _local_5 = null;
                _local_6 = 0;
                while (_local_6 < this._rectangleMasks.length)
                {
                    _local_5 = (this._rectangleMasks[_local_6] as RoomPlaneRectangleMask);
                    if (_local_5 != null)
                    {
                        if (((((_local_5._Str_5120 == k) && (_local_5._Str_4659 == _arg_2)) && (_local_5._Str_9124 == _arg_3)) && (_local_5._Str_12156 == _arg_4)))
                        {
                            return false;
                        }
                    }
                    _local_6++;
                }
                _local_5 = new RoomPlaneRectangleMask(k, _arg_2, _arg_3, _arg_4);
                this._rectangleMasks.push(_local_5);
                this._maskChanged = true;
                return true;
            }
            return false;
        }

        private function updateMaskChangeStatus():void
        {
            var _local_6:Boolean;
            var _local_7:RoomPlaneBitmapMask;
            if (!this._maskChanged)
            {
                return;
            }
            var k:int;
            var _local_2:int;
            var _local_3:Boolean = true;
            var _local_4:RoomPlaneBitmapMask;
            var _local_5:RoomPlaneRectangleMask;
            if (this._bitmapMasks.length == this._bitmapMasksOld.length)
            {
                while (k < this._bitmapMasks.length)
                {
                    _local_4 = (this._bitmapMasks[k] as RoomPlaneBitmapMask);
                    if (_local_4 != null)
                    {
                        _local_6 = false;
                        while (_local_2 < this._bitmapMasksOld.length)
                        {
                            _local_7 = (this._bitmapMasksOld[_local_2] as RoomPlaneBitmapMask);
                            if (_local_7 != null)
                            {
                                if ((((_local_7.type == _local_4.type) && (_local_7._Str_5120 == _local_4._Str_5120)) && (_local_7._Str_4659 == _local_4._Str_4659)))
                                {
                                    _local_6 = true;
                                    break;
                                }
                            }
                            _local_2++;
                        }
                        if (!_local_6)
                        {
                            _local_3 = false;
                            break;
                        }
                    }
                    k++;
                }
            }
            else
            {
                _local_3 = false;
            }
            if (this._rectangleMasks.length > this._rectangleMasksOld.length)
            {
                _local_3 = false;
            }
            if (_local_3)
            {
                this._maskChanged = false;
            }
        }

        private function updateMask(texture:BitmapData, geometry:IRoomGeometry):void
        {
            var normal:IVector3d;
            var posX:int;
            var posY:int;
            var type:String;
            var wd:int;
            var ht:int;
            if ((((!(this._useMask)) || (((this._bitmapMasks.length == 0) && (this._rectangleMasks.length == 0)) && (!(this._maskChanged)))) || (this._maskManager == null)))
            {
                return;
            }
            if (((texture == null) || (geometry == null)))
            {
                return;
            }
            var mask:RoomPlaneBitmapMask;
            var rectMask:RoomPlaneRectangleMask;
            var i:int;
            var j:int;
            this.updateMaskChangeStatus();
            var width:Number = texture.width;
            var height:Number = texture.height;
            if ((((this._maskBitmapData == null) || (!(this._maskBitmapData.width == width))) || (!(this._maskBitmapData.height == height))))
            {
                if (this._maskBitmapData != null)
                {
                    this._maskBitmapData.dispose();
                    this._maskBitmapData = null;
                }
                try
                {
                    this._maskBitmapData = new BitmapData(width, height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    _maskBitmapData = null;
                    return;
                }
                this._maskChanged = true;
            }
            if (this._maskChanged)
            {
                this._bitmapMasksOld = [];
                this._rectangleMasksOld = [];
                if (this._maskBitmapData != null)
                {
                    this._maskBitmapData.fillRect(this._maskBitmapData.rect, 0xFFFFFF);
                }
                this._Str_11000(texture);
                normal = geometry.getCoordinatePosition(this._normal);
                posX = 0;
                posY = 0;
                i = 0;
                while (i < this._bitmapMasks.length)
                {
                    mask = (this._bitmapMasks[i] as RoomPlaneBitmapMask);
                    if (mask != null)
                    {
                        posX = (this._maskBitmapData.width - ((this._maskBitmapData.width * mask._Str_5120) / this._leftSide.length));
                        posY = (this._maskBitmapData.height - ((this._maskBitmapData.height * mask._Str_4659) / this._rightSide.length));
                        type = mask.type;
                        this._maskManager.updateMask(this._maskBitmapData, type, geometry.scale, normal, posX, posY);
                        this._bitmapMasksOld.push(new RoomPlaneBitmapMask(type, mask._Str_5120, mask._Str_4659));
                    }
                    i = (i + 1);
                }
                j = 0;
                while (j < this._rectangleMasks.length)
                {
                    rectMask = (this._rectangleMasks[j] as RoomPlaneRectangleMask);
                    if (rectMask != null)
                    {
                        posX = (this._maskBitmapData.width - ((this._maskBitmapData.width * rectMask._Str_5120) / this._leftSide.length));
                        posY = (this._maskBitmapData.height - ((this._maskBitmapData.height * rectMask._Str_4659) / this._rightSide.length));
                        wd = ((this._maskBitmapData.width * rectMask._Str_9124) / this._leftSide.length);
                        ht = ((this._maskBitmapData.height * rectMask._Str_12156) / this._rightSide.length);
                        this._maskBitmapData.fillRect(new Rectangle((posX - wd), (posY - ht), wd, ht), 0xFF000000);
                        this._rectangleMasksOld.push(new RoomPlaneRectangleMask(rectMask._Str_9124, rectMask._Str_4659, rectMask._Str_9124, rectMask._Str_12156));
                    }
                    j = (j + 1);
                }
                this._maskChanged = false;
            }
            this._Str_24790(texture, this._maskBitmapData);
        }

        private function _Str_24790(texture:BitmapData, mask:BitmapData):void
        {
            if (((texture == null) || (mask == null)))
            {
                return;
            }
            if (((!(this._maskBufferBitmapData == null)) && ((!(this._maskBufferBitmapData.width == texture.width)) || (!(this._maskBufferBitmapData.height == texture.height)))))
            {
                this._maskBufferBitmapData.dispose();
                this._maskBufferBitmapData = null;
            }
            if (this._maskBufferBitmapData == null)
            {
                try
                {
                    this._maskBufferBitmapData = new BitmapData(texture.width, texture.height, true, 0xFFFFFFFF);
                }
                catch(e:Error)
                {
                    if (_maskBufferBitmapData)
                    {
                        _maskBufferBitmapData.dispose();
                    }
                    _maskBufferBitmapData = null;
                    return;
                }
            }
            this._maskBufferBitmapData.copyChannel(texture, texture.rect, ZERO_POINT, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
            this._maskBufferBitmapData.draw(mask, null, null, BlendMode.DARKEN);
            texture.copyChannel(this._maskBufferBitmapData, this._maskBufferBitmapData.rect, ZERO_POINT, BitmapDataChannel.RED, BitmapDataChannel.ALPHA);
        }
    }
}
