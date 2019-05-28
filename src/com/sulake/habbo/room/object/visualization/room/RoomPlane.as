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
    import com.sulake.room.utils.IVector3D;
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
        private static const _Str_1870:Point = new Point(0, 0);
        public static const _Str_16830:int = 0;
        public static const _Str_3587:int = 1;
        public static const _Str_3258:int = 2;
        public static const _Str_3272:int = 3;
        private static var _Str_10032:int = 1;

        private var _disposed:Boolean = false;
        private var _Str_16308:int = 0;
        private var _Str_5221:Vector3d = null;
        private var _location:Vector3d = null;
        private var _Str_2920:Vector3d = null;
        private var _Str_2943:Vector3d = null;
        private var _normal:Vector3d = null;
        private var _Str_5886:Array;
        private var _Str_3406:int = -1;
        private var _type:int = 0;
        private var _Str_3816:Boolean = false;
        private var _Str_1049:BitmapData = null;
        private var _Str_13946:Boolean = true;
        private var _offset:Point = null;
        private var _relativeDepth:Number = 0;
        private var _color:uint = 0;
        private var _rasterizer:IPlaneRasterizer = null;
        private var _Str_4795:PlaneMaskManager = null;
        private var _Str_576:String = null;
        private var _uniqueId:int = 0;
        private var _Str_20541:Number = 0;
        private var _Str_19707:Number = 0;
        private var _Str_21079:Number = 0;
        private var _Str_22024:Number = 0;
        private var _Str_2708:Map = null;
        private var _Str_5545:PlaneBitmapData = null;
        private var _Str_4542:Boolean = false;
        private var _Str_4047:Array;
        private var _Str_5088:Array;
        private var _Str_4891:Boolean = false;
        private var _Str_2730:BitmapData = null;
        private var _Str_3616:BitmapData = null;
        private var _Str_8341:Array;
        private var _Str_14495:Array;
        private var _Str_2820:Vector3d = null;
        private var _Str_2745:Vector3d = null;
        private var _Str_2639:Vector3d = null;
        private var _Str_2766:Vector3d = null;
        private var _Str_1720:Number = 0;
        private var _height:Number = 0;
        private var _Str_7367:Boolean = true;

        public function RoomPlane(k:IVector3D, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:IVector3D, _arg_5:int, _arg_6:Boolean, _arg_7:Array, _arg_8:int, _arg_9:Number=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:Number=0)
        {
            var _local_13:int;
            var _local_14:IVector3D;
            var _local_15:Vector3d;
            this._Str_5886 = [];
            this._Str_4047 = [];
            this._Str_5088 = [];
            this._Str_8341 = [];
            this._Str_14495 = [];
            super();
            this._Str_16308 = _arg_8;
            this._Str_5221 = new Vector3d();
            this._Str_5221.assign(k);
            this._location = new Vector3d();
            this._location.assign(_arg_2);
            this._Str_2920 = new Vector3d();
            this._Str_2920.assign(_arg_3);
            this._Str_2943 = new Vector3d();
            this._Str_2943.assign(_arg_4);
            this._normal = Vector3d.crossProduct(this._Str_2920, this._Str_2943);
            if (this._normal.length > 0)
            {
                this._normal.mul((1 / this._normal.length));
            }
            if (_arg_7 != null)
            {
                _local_13 = 0;
                while (_local_13 < _arg_7.length)
                {
                    _local_14 = (_arg_7[_local_13] as IVector3D);
                    if (_local_14 != null)
                    {
                        _local_15 = new Vector3d();
                        _local_15.assign(_local_14);
                        this._Str_5886.push(_local_15);
                    }
                    _local_13++;
                }
            }
            this._offset = new Point();
            this._type = _arg_5;
            this._Str_2708 = new Map();
            this._Str_2820 = new Vector3d();
            this._Str_2745 = new Vector3d();
            this._Str_2639 = new Vector3d();
            this._Str_2766 = new Vector3d();
            this._Str_20541 = _arg_9;
            this._Str_19707 = _arg_10;
            this._Str_21079 = _arg_11;
            this._Str_22024 = _arg_12;
            this._Str_4542 = _arg_6;
            this._uniqueId = _Str_10032++;
        }

        private static function blend(k:uint, _arg_2:uint):uint
        {
            return Canvas.colorize(_arg_2, (k | 0xFF000000)) & 0xFFFFFF;
        }


        public function set _Str_14801(k:Boolean):void
        {
            if (k != this._Str_7367)
            {
                if (!this._Str_7367)
                {
                    this._Str_11000();
                }
                this._Str_7367 = k;
            }
        }

        public function get _Str_14801():Boolean
        {
            return this._Str_7367;
        }

        public function get bitmapData():BitmapData
        {
            var bitmap:BitmapData;
            if (this.visible)
            {
                if (this._Str_1049 != null)
                {
                    try
                    {
                        bitmap = this._Str_1049.clone();
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
            return (this._Str_3816) && (this._Str_7367);
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

        public function get _Str_5424():IVector3D
        {
            return this._Str_2920;
        }

        public function get _Str_4968():IVector3D
        {
            return this._Str_2943;
        }

        public function get location():IVector3D
        {
            return this._location;
        }

        public function get normal():IVector3D
        {
            return this._normal;
        }

        public function get _Str_18448():Boolean
        {
            return this._Str_13946;
        }

        public function set _Str_18448(k:Boolean):void
        {
            this._Str_13946 = k;
        }

        public function set rasterizer(k:IPlaneRasterizer):void
        {
            this._rasterizer = k;
        }

        public function set _Str_16279(k:PlaneMaskManager):void
        {
            this._Str_4795 = k;
        }

        public function set id(k:String):void
        {
            if (k != this._Str_576)
            {
                this._Str_11000();
                this._Str_576 = k;
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
            if (this._Str_1049 != null)
            {
                this._Str_1049.dispose();
                this._Str_1049 = null;
            }
            if (this._Str_2708 != null)
            {
                k = 0;
                while (k < this._Str_2708.length)
                {
                    _local_2 = (this._Str_2708.getWithIndex(k) as PlaneBitmapData);
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
                this._Str_2708.dispose();
                this._Str_2708 = null;
            }
            this._Str_5545 = null;
            this._location = null;
            this._Str_5221 = null;
            this._Str_2920 = null;
            this._Str_2943 = null;
            this._normal = null;
            this._rasterizer = null;
            this._Str_2820 = null;
            this._Str_2745 = null;
            this._Str_2639 = null;
            this._Str_2766 = null;
            this._Str_4047 = null;
            this._Str_5088 = null;
            if (this._Str_2730 != null)
            {
                this._Str_2730.dispose();
                this._Str_2730 = null;
            }
            if (this._Str_3616 != null)
            {
                this._Str_3616.dispose();
                this._Str_3616 = null;
            }
            this._disposed = true;
        }

        public function _Str_24896(k:BitmapData):BitmapData
        {
            if (this.visible)
            {
                if (((!(this._Str_1049 == null)) && (!(k == null))))
                {
                    if (((this._Str_1049.width == k.width) && (this._Str_1049.height == k.height)))
                    {
                        k.copyPixels(this._Str_1049, this._Str_1049.rect, _Str_1870);
                        return k;
                    }
                }
            }
            return null;
        }

        private function _Str_17642(k:String, _arg_2:PlaneBitmapData):Boolean
        {
            var _local_3:PlaneBitmapData = (this._Str_2708.remove(k) as PlaneBitmapData);
            if (_local_3 != null)
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.bitmap == _local_3.bitmap))))
                {
                    _local_3.bitmap.dispose();
                }
                _local_3.dispose();
            }
            this._Str_5545 = _arg_2;
            this._Str_2708.add(k, _arg_2);
            return true;
        }

        private function _Str_11000(k:BitmapData=null):void
        {
            var _local_2:int;
            var _local_3:PlaneBitmapData;
            if (this._Str_2708 != null)
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2708.length)
                {
                    _local_3 = (this._Str_2708.getWithIndex(_local_2) as PlaneBitmapData);
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
                this._Str_2708.reset();
            }
            this._Str_5545 = null;
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
            var _local_3:PlaneBitmapData = this._Str_5545;
            if (_local_3 == null)
            {
                _local_4 = this.getTextureIdentifier(k.scale);
                _local_3 = (this._Str_2708.getValue(_local_4) as PlaneBitmapData);
            }
            this._Str_19336();
            if (((this._Str_7367) && (((_local_3 == null) || ((_local_3.timeStamp >= 0) && (_arg_2 > _local_3.timeStamp))) || (this._Str_4891))))
            {
                return true;
            }
            return false;
        }

        private function _Str_10114(k:IRoomGeometry, _arg_2:int):BitmapData
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:IVector3D;
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
                _local_5 = (this._Str_2920.length * k.scale);
                _local_6 = (this._Str_2943.length * k.scale);
                _local_7 = k.getCoordinatePosition(this._normal);
                _local_4 = this.getTextureIdentifier(k.scale);
                if (this._Str_5545 != null)
                {
                    _local_3 = this._Str_5545;
                }
                else
                {
                    _local_3 = (this._Str_2708.getValue(_local_4) as PlaneBitmapData);
                }
                _local_8 = null;
                if (_local_3 != null)
                {
                    _local_8 = _local_3.bitmap;
                }
                if (this._rasterizer != null)
                {
                    _local_3 = this._rasterizer.render(_local_8, this._Str_576, _local_5, _local_6, k.scale, _local_7, this._Str_13946, this._Str_20541, this._Str_19707, this._Str_21079, this._Str_22024, _arg_2);
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
                    this._Str_17859(_local_3.bitmap, k);
                    this._Str_17642(_local_4, _local_3);
                }
            }
            else
            {
                if (this._Str_5545 != null)
                {
                    _local_3 = this._Str_5545;
                }
                else
                {
                    _local_4 = this.getTextureIdentifier(k.scale);
                    _local_3 = (this._Str_2708.getValue(_local_4) as PlaneBitmapData);
                }
            }
            if (_local_3 != null)
            {
                this._Str_5545 = _local_3;
                return _local_3.bitmap;
            }
            return null;
        }

        private function _Str_23649(k:IRoomGeometry):PlaneDrawingData
        {
            var _local_7:PlaneMask;
            var _local_8:String;
            var _local_9:IVector3D;
            var _local_10:IGraphicAsset;
            var _local_11:Point;
            if (!this._Str_4542)
            {
                return null;
            }
            var _local_2:RoomPlaneBitmapMask;
            var _local_3:int;
            var _local_4:int;
            var _local_5:PlaneDrawingData = new PlaneDrawingData();
            var _local_6:int;
            while (_local_6 < this._Str_4047.length)
            {
                _local_2 = (this._Str_4047[_local_6] as RoomPlaneBitmapMask);
                if (_local_2 != null)
                {
                    _local_7 = this._Str_4795._Str_8361(_local_2.type);
                    if (_local_7 != null)
                    {
                        _local_8 = _local_7.getAliasByName(k.scale);
                        if (_local_8 != null)
                        {
                            _local_9 = k.getCoordinatePosition(this._normal);
                            _local_10 = _local_7._Str_21021(k.scale, _local_9);
                            if (_local_10 != null)
                            {
                                _local_3 = (this._Str_2730.width * (1 - (_local_2._Str_5120 / this._Str_2920.length)));
                                _local_4 = (this._Str_2730.height * (1 - (_local_2._Str_4659 / this._Str_2943.length)));
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
            return Math.round((this._Str_2920.length * Math.abs((_local_2.x - _local_3.x))));
        }

        public function _Str_22136(geometry:IRoomGeometry):Array
        {
            var maskData:PlaneDrawingData;
            var data:PlaneDrawingData;
            var layers:Array;
            var layer:PlaneVisualizationLayer;
            var i:int;
            var normal:IVector3D;
            var cm:PlaneMaterialCellMatrix;
            var column:PlaneMaterialCellColumn;
            var assetNames:Array;
            var cell:PlaneMaterialCell;
            var name:String;
            var drawingDatas:Array = [];
            if (this._Str_3816)
            {
                maskData = null;
                try
                {
                    maskData = this._Str_23649(geometry);
                    layers = this._rasterizer._Str_8988(this._Str_576);
                    i = 0;
                    while (i < layers.length)
                    {
                        layer = (layers[i] as PlaneVisualizationLayer);
                        if (layer != null)
                        {
                            if (((this._Str_13946) && (!(layer._Str_8547() == null))))
                            {
                                normal = geometry.getCoordinatePosition(this._normal);
                                cm = layer._Str_8547()._Str_21968(normal);
                                data = new PlaneDrawingData(maskData, blend(this._color, layer._Str_751()), cm._Str_14945());
                                Randomizer._Str_17384(this._Str_16308);
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

        private function _Str_25956(k:PlaneBitmapData):void
        {
        }

        public function update(geometry:IRoomGeometry, timeSinceStartMs:int):Boolean
        {
            var cosAngle:Number;
            var i:int;
            var originPos:IVector3D;
            var originZ:Number;
            var relativeDepth:Number;
            var texture:BitmapData;
            if (((geometry == null) || (this._disposed)))
            {
                return false;
            }
            var geometryChanged:Boolean;
            if (this._Str_3406 != geometry.updateId)
            {
                geometryChanged = true;
            }
            if (((!(geometryChanged)) || (!(this._Str_7367))))
            {
                if (!this.visible)
                {
                    return false;
                }
            }
            if (geometryChanged)
            {
                this._Str_5545 = null;
                cosAngle = 0;
                cosAngle = Vector3d.cosAngle(geometry.directionAxis, this.normal);
                if (cosAngle > -0.001)
                {
                    if (this._Str_3816)
                    {
                        this._Str_3816 = false;
                        return true;
                    }
                    return false;
                }
                i = 0;
                while (i < this._Str_5886.length)
                {
                    cosAngle = Vector3d.cosAngle(geometry.directionAxis, this._Str_5886[i]);
                    if (cosAngle > -0.001)
                    {
                        if (this._Str_3816)
                        {
                            this._Str_3816 = false;
                            return true;
                        }
                        return false;
                    }
                    i = (i + 1);
                }
                this._Str_18702(geometry);
                originPos = geometry.getScreenPosition(this._Str_5221);
                originZ = originPos.z;
                relativeDepth = (Math.max(this._Str_2820.z, this._Str_2745.z, this._Str_2639.z, this._Str_2766.z) - originZ);
                if (this._type == _Str_3258)
                {
                    relativeDepth = (relativeDepth - ((this._location.z + Math.min(0, this._Str_2920.z, this._Str_2943.z)) * 8));
                }
                if (this._type == _Str_3272)
                {
                    relativeDepth = (relativeDepth + 0.02);
                }
                this._relativeDepth = relativeDepth;
                this._Str_3816 = true;
                this._Str_3406 = geometry.updateId;
            }
            if (((geometryChanged) || (this._Str_10518(geometry, timeSinceStartMs))))
            {
                if ((((this._Str_1049 == null) || (!(this._Str_1720 == this._Str_1049.width))) || (!(this._height == this._Str_1049.height))))
                {
                    if (this._Str_1049 != null)
                    {
                        this._Str_1049.dispose();
                        this._Str_1049 = null;
                        if (((this._Str_1720 < 1) || (this._height < 1)))
                        {
                            return true;
                        }
                    }
                    else
                    {
                        if (((this._Str_1720 < 1) || (this._height < 1)))
                        {
                            return false;
                        }
                    }
                    try
                    {
                        this._Str_1049 = new BitmapData(this._Str_1720, this._height, true, 0xFFFFFF);
                    }
                    catch(e:Error)
                    {
                        _Str_1049 = null;
                        dispose();
                    }
                    if (this._Str_1049 == null)
                    {
                        return false;
                    }
                    this._Str_1049.lock();
                }
                else
                {
                    this._Str_1049.lock();
                    this._Str_1049.fillRect(this._Str_1049.rect, 0xFFFFFF);
                }
                Randomizer._Str_17384(this._Str_16308);
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
                this._Str_1049.unlock();
                return (texture) || (geometryChanged);
            }
            return false;
        }

        private function _Str_18702(k:IRoomGeometry):void
        {
            this._Str_2820.assign(k.getScreenPosition(this._location));
            this._Str_2745.assign(k.getScreenPosition(Vector3d.sum(this._location, this._Str_2943)));
            this._Str_2639.assign(k.getScreenPosition(Vector3d.sum(Vector3d.sum(this._location, this._Str_2920), this._Str_2943)));
            this._Str_2766.assign(k.getScreenPosition(Vector3d.sum(this._location, this._Str_2920)));
            this._offset = k.getScreenPoint(this._Str_5221);
            this._Str_2820.x = Math.round(this._Str_2820.x);
            this._Str_2820.y = Math.round(this._Str_2820.y);
            this._Str_2745.x = Math.round(this._Str_2745.x);
            this._Str_2745.y = Math.round(this._Str_2745.y);
            this._Str_2639.x = Math.round(this._Str_2639.x);
            this._Str_2639.y = Math.round(this._Str_2639.y);
            this._Str_2766.x = Math.round(this._Str_2766.x);
            this._Str_2766.y = Math.round(this._Str_2766.y);
            this._offset.x = Math.round(this._offset.x);
            this._offset.y = Math.round(this._offset.y);
            var _local_2:Number = Math.min(this._Str_2820.x, this._Str_2745.x, this._Str_2639.x, this._Str_2766.x);
            var _local_3:Number = Math.max(this._Str_2820.x, this._Str_2745.x, this._Str_2639.x, this._Str_2766.x);
            var _local_4:Number = Math.min(this._Str_2820.y, this._Str_2745.y, this._Str_2639.y, this._Str_2766.y);
            var _local_5:Number = Math.max(this._Str_2820.y, this._Str_2745.y, this._Str_2639.y, this._Str_2766.y);
            _local_3 = (_local_3 - _local_2);
            this._offset.x = (this._offset.x - _local_2);
            this._Str_2820.x = (this._Str_2820.x - _local_2);
            this._Str_2745.x = (this._Str_2745.x - _local_2);
            this._Str_2639.x = (this._Str_2639.x - _local_2);
            this._Str_2766.x = (this._Str_2766.x - _local_2);
            _local_5 = (_local_5 - _local_4);
            this._offset.y = (this._offset.y - _local_4);
            this._Str_2820.y = (this._Str_2820.y - _local_4);
            this._Str_2745.y = (this._Str_2745.y - _local_4);
            this._Str_2639.y = (this._Str_2639.y - _local_4);
            this._Str_2766.y = (this._Str_2766.y - _local_4);
            this._Str_1720 = _local_3;
            this._height = _local_5;
        }

        private function _Str_17000(k:IRoomGeometry, _arg_2:BitmapData):void
        {
            if (((((((this._Str_2820 == null) || (this._Str_2745 == null)) || (this._Str_2639 == null)) || (this._Str_2766 == null)) || (_arg_2 == null)) || (this._Str_1049 == null)))
            {
                return;
            }
            var _local_3:Number = (this._Str_2766.x - this._Str_2639.x);
            var _local_4:Number = (this._Str_2766.y - this._Str_2639.y);
            var _local_5:Number = (this._Str_2745.x - this._Str_2639.x);
            var _local_6:Number = (this._Str_2745.y - this._Str_2639.y);
            if (((this._type == _Str_3587) || (this._type == _Str_3272)))
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
            _local_11.translate(this._Str_2639.x, this._Str_2639.y);
            this.draw(_arg_2, _local_11);
        }

        private function draw(k:BitmapData, _arg_2:Matrix):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:int;
            if (this._Str_1049 != null)
            {
                if (((((((_arg_2.a == 1) && (_arg_2.d == 1)) && (_arg_2.c == 0)) && (!(_arg_2.b == 0))) && (Math.abs(_arg_2.b) <= 1)) && ((this._type == _Str_3587) || (this._type == _Str_3272))))
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
                            this._Str_1049.copyPixels(k, new Rectangle((_local_4 + _local_6), 0, (_local_3 - _local_4), k.height), new Point((_arg_2.tx + _local_4), (_arg_2.ty + _local_7)), null, null, true);
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
                        this._Str_1049.copyPixels(k, new Rectangle(_local_4, 0, (_local_3 - _local_4), k.height), new Point((_arg_2.tx + _local_4), (_arg_2.ty + _local_7)), null, null, true);
                    }
                    return;
                }
                this._Str_1049.draw(k, _arg_2, null, null, null, false);
            }
        }

        public function _Str_25213():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._Str_4542)
            {
                if (this._Str_4047.length == 0)
                {
                    return;
                }
                this._Str_4891 = true;
                this._Str_4047 = [];
            }
        }

        public function _Str_24569(k:String, _arg_2:Number, _arg_3:Number):Boolean
        {
            var _local_4:RoomPlaneBitmapMask;
            var _local_5:int;
            if (this._Str_4542)
            {
                _local_4 = null;
                _local_5 = 0;
                while (_local_5 < this._Str_4047.length)
                {
                    _local_4 = (this._Str_4047[_local_5] as RoomPlaneBitmapMask);
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
                this._Str_4047.push(_local_4);
                this._Str_4891 = true;
                return true;
            }
            return false;
        }

        public function _Str_25934():void
        {
            if (this._Str_4542)
            {
                if (this._Str_5088.length == 0)
                {
                    return;
                }
                this._Str_4891 = true;
                this._Str_5088 = [];
            }
        }

        public function _Str_24758(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Boolean
        {
            var _local_5:RoomPlaneRectangleMask;
            var _local_6:int;
            if (this._Str_4542)
            {
                _local_5 = null;
                _local_6 = 0;
                while (_local_6 < this._Str_5088.length)
                {
                    _local_5 = (this._Str_5088[_local_6] as RoomPlaneRectangleMask);
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
                this._Str_5088.push(_local_5);
                this._Str_4891 = true;
                return true;
            }
            return false;
        }

        private function _Str_19336():void
        {
            var _local_6:Boolean;
            var _local_7:RoomPlaneBitmapMask;
            if (!this._Str_4891)
            {
                return;
            }
            var k:int;
            var _local_2:int;
            var _local_3:Boolean = true;
            var _local_4:RoomPlaneBitmapMask;
            var _local_5:RoomPlaneRectangleMask;
            if (this._Str_4047.length == this._Str_8341.length)
            {
                while (k < this._Str_4047.length)
                {
                    _local_4 = (this._Str_4047[k] as RoomPlaneBitmapMask);
                    if (_local_4 != null)
                    {
                        _local_6 = false;
                        while (_local_2 < this._Str_8341.length)
                        {
                            _local_7 = (this._Str_8341[_local_2] as RoomPlaneBitmapMask);
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
            if (this._Str_5088.length > this._Str_14495.length)
            {
                _local_3 = false;
            }
            if (_local_3)
            {
                this._Str_4891 = false;
            }
        }

        private function _Str_17859(texture:BitmapData, geometry:IRoomGeometry):void
        {
            var normal:IVector3D;
            var posX:int;
            var posY:int;
            var type:String;
            var wd:int;
            var ht:int;
            if ((((!(this._Str_4542)) || (((this._Str_4047.length == 0) && (this._Str_5088.length == 0)) && (!(this._Str_4891)))) || (this._Str_4795 == null)))
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
            this._Str_19336();
            var width:Number = texture.width;
            var height:Number = texture.height;
            if ((((this._Str_2730 == null) || (!(this._Str_2730.width == width))) || (!(this._Str_2730.height == height))))
            {
                if (this._Str_2730 != null)
                {
                    this._Str_2730.dispose();
                    this._Str_2730 = null;
                }
                try
                {
                    this._Str_2730 = new BitmapData(width, height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    _Str_2730 = null;
                    return;
                }
                this._Str_4891 = true;
            }
            if (this._Str_4891)
            {
                this._Str_8341 = [];
                this._Str_14495 = [];
                if (this._Str_2730 != null)
                {
                    this._Str_2730.fillRect(this._Str_2730.rect, 0xFFFFFF);
                }
                this._Str_11000(texture);
                normal = geometry.getCoordinatePosition(this._normal);
                posX = 0;
                posY = 0;
                i = 0;
                while (i < this._Str_4047.length)
                {
                    mask = (this._Str_4047[i] as RoomPlaneBitmapMask);
                    if (mask != null)
                    {
                        posX = (this._Str_2730.width - ((this._Str_2730.width * mask._Str_5120) / this._Str_2920.length));
                        posY = (this._Str_2730.height - ((this._Str_2730.height * mask._Str_4659) / this._Str_2943.length));
                        type = mask.type;
                        this._Str_4795._Str_17859(this._Str_2730, type, geometry.scale, normal, posX, posY);
                        this._Str_8341.push(new RoomPlaneBitmapMask(type, mask._Str_5120, mask._Str_4659));
                    }
                    i = (i + 1);
                }
                j = 0;
                while (j < this._Str_5088.length)
                {
                    rectMask = (this._Str_5088[j] as RoomPlaneRectangleMask);
                    if (rectMask != null)
                    {
                        posX = (this._Str_2730.width - ((this._Str_2730.width * rectMask._Str_5120) / this._Str_2920.length));
                        posY = (this._Str_2730.height - ((this._Str_2730.height * rectMask._Str_4659) / this._Str_2943.length));
                        wd = ((this._Str_2730.width * rectMask._Str_9124) / this._Str_2920.length);
                        ht = ((this._Str_2730.height * rectMask._Str_12156) / this._Str_2943.length);
                        this._Str_2730.fillRect(new Rectangle((posX - wd), (posY - ht), wd, ht), 0xFF000000);
                        this._Str_14495.push(new RoomPlaneRectangleMask(rectMask._Str_9124, rectMask._Str_4659, rectMask._Str_9124, rectMask._Str_12156));
                    }
                    j = (j + 1);
                }
                this._Str_4891 = false;
            }
            this._Str_24790(texture, this._Str_2730);
        }

        private function _Str_24790(texture:BitmapData, mask:BitmapData):void
        {
            if (((texture == null) || (mask == null)))
            {
                return;
            }
            if (((!(this._Str_3616 == null)) && ((!(this._Str_3616.width == texture.width)) || (!(this._Str_3616.height == texture.height)))))
            {
                this._Str_3616.dispose();
                this._Str_3616 = null;
            }
            if (this._Str_3616 == null)
            {
                try
                {
                    this._Str_3616 = new BitmapData(texture.width, texture.height, true, 0xFFFFFFFF);
                }
                catch(e:Error)
                {
                    if (_Str_3616)
                    {
                        _Str_3616.dispose();
                    }
                    _Str_3616 = null;
                    return;
                }
            }
            this._Str_3616.copyChannel(texture, texture.rect, _Str_1870, BitmapDataChannel.ALPHA, BitmapDataChannel.RED);
            this._Str_3616.draw(mask, null, null, BlendMode.DARKEN);
            texture.copyChannel(this._Str_3616, this._Str_3616.rect, _Str_1870, BitmapDataChannel.RED, BitmapDataChannel.ALPHA);
        }
    }
}
