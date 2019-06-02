package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IPlaneVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import com.sulake.core.assets.IAsset;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.enum.AlphaTolerance;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.RoomPlaneData;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
    import com.sulake.room.object.visualization.IRoomPlane;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class RoomVisualization extends RoomObjectSpriteVisualization implements IPlaneVisualization 
    {
        public static const FLOOR_COLOR_LEFT:int = 0xFFFFFF;
        public static const FLOOR_COLOR_RIGHT:int = 0xDDDDDD;
        public static const WALL_COLOR_TOP:int = 0xBBBBBB;
        private static const WALL_COLOR_SIDE:int = 0xFFFFFF;
        private static const WALL_COLOR_BOTTOM:int = 0xCCCCCC;
        private static const WALL_COLOR_BORDER:int = 0x999999;
        private static const LANDSCAPE_COLOR_TOP:int = 0x999999;
        public static const LANDSCAPE_COLOR_SIDE:int = 0xFFFFFF;
        public static const LANDSCAPE_COLOR_BOTTOM:int = 0xCCCCCC;
        public static const _Str_18370:int = 0x999999;
        private static const ROOM_DEPTH_OFFSET:Number = 1000;

        private const _Str_9654:int = 250;

        protected var _data:RoomVisualizationData = null;
        private var _assetLibrary:AssetLibrary = null;
        private var _roomPlaneParser:RoomPlaneParser = null;
        private var _planes:Array;
        private var _planesInitialized:Boolean = false;
        private var _visiblePlanes:Array;
        private var _visiblePlaneSpriteNumbers:Array;
        private var _boundingRectangle:Rectangle = null;
        private var _roomPlaneBitmapMaskParser:RoomPlaneBitmapMaskParser = null;
        private var _wallType:String = null;
        private var _floorType:String = null;
        private var _landscapeType:String = null;
        private var _floorThicknessMultiplier:Number = NaN;
        private var _wallThicknessMultiplier:Number = NaN;
        private var _floorHoleUpdateTime:Number = NaN;
        private var _planeMaskData:String = null;
        private var _backgroundColor:uint = 0xFFFFFF;
        private var _backgroundRed:int = 0xFF;
        private var _backgroundGreen:int = 0xFF;
        private var _backgroundBlue:int = 0xFF;
        private var _colorizeBgOnly:Boolean = true;
        private var _assetUpdateCounter:int = 0;
        private var _geometryUpdateId:int = -1000;
        private var FLOOR_COLOR:int = -1;
        private var _geometryDirX:Number = 0;
        private var _geometryDirY:Number = 0;
        private var _geometryDirZ:Number = 0;
        private var _geometryScale:Number = 0;
        private var _planeTypeVisibilities:Array;

        public function RoomVisualization()
        {
            this._planes = [];
            this._visiblePlanes = [];
            this._visiblePlaneSpriteNumbers = [];
            this._planeTypeVisibilities = [];
            super();
            this._assetLibrary = new AssetLibrary("room visualization");
            this._roomPlaneParser = new RoomPlaneParser();
            this._roomPlaneBitmapMaskParser = new RoomPlaneBitmapMaskParser();
            this._planeTypeVisibilities[RoomPlane.TYPE_WALL] = false;
            this._planeTypeVisibilities[RoomPlane.TYPE_LANDSCAPE] = true;
            this._planeTypeVisibilities[RoomPlane.TYPE_FLOOR] = true;
            this._planeTypeVisibilities[RoomPlane._Str_3272] = true;
        }

        public function get floorRelativeDepth():Number
        {
            return ROOM_DEPTH_OFFSET + 0.1;
        }

        public function get wallRelativeDepth():Number
        {
            return ROOM_DEPTH_OFFSET + 0.5;
        }

        public function get wallAdRelativeDepth():Number
        {
            return ROOM_DEPTH_OFFSET + 0.49;
        }

        public function get _Str_3828():int
        {
            return this._planes.length;
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:IAsset;
            super.dispose();
            if (this._assetLibrary != null)
            {
                k = 0;
                while (k < this._assetLibrary.numAssets)
                {
                    _local_2 = this._assetLibrary.getAssetByIndex(k);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._assetLibrary.dispose();
                this._assetLibrary = null;
            }
            this.resetRoomPlanes();
            this._planes = null;
            this._visiblePlanes = null;
            this._visiblePlaneSpriteNumbers = null;
            if (this._roomPlaneParser != null)
            {
                this._roomPlaneParser.dispose();
                this._roomPlaneParser = null;
            }
            if (this._roomPlaneBitmapMaskParser != null)
            {
                this._roomPlaneBitmapMaskParser.dispose();
                this._roomPlaneBitmapMaskParser = null;
            }
            if (this._data != null)
            {
                this._data._Str_3355();
                this._data = null;
            }
        }

        private function resetRoomPlanes():void
        {
            var k:int;
            var _local_2:RoomPlane;
            if (this._planes != null)
            {
                k = 0;
                while (k < this._planes.length)
                {
                    _local_2 = (this._planes[k] as RoomPlane);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._planes = [];
            }
            this._planesInitialized = false;
            this._assetUpdateCounter = (this._assetUpdateCounter + 1);
            this.reset();
        }

        override protected function reset():void
        {
            super.reset();
            this._wallType = null;
            this._floorType = null;
            this._landscapeType = null;
            this._planeMaskData = null;
            this.FLOOR_COLOR = -1;
            this._geometryScale = 0;
        }

        override public function get boundingRectangle():Rectangle
        {
            if (this._boundingRectangle == null)
            {
                this._boundingRectangle = super.boundingRectangle;
            }
            return new Rectangle(this._boundingRectangle.x, this._boundingRectangle.y, this._boundingRectangle.width, this._boundingRectangle.height);
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this.reset();
            if (((k == null) || (!(k is RoomVisualizationData))))
            {
                return false;
            }
            this._data = (k as RoomVisualizationData);
            this._data._Str_6703(assetCollection);
            return true;
        }

        protected function _Str_18024():void
        {
            var _local_3:RoomPlane;
            var _local_4:IRoomObjectSprite;
            var k:int = this._planes.length;
            createSprites(k);
            var _local_2:int;
            while (_local_2 < k)
            {
                _local_3 = (this._planes[_local_2] as RoomPlane);
                _local_4 = getSprite(_local_2);
                if (((((!(_local_4 == null)) && (!(_local_3 == null))) && (!(_local_3._Str_5424 == null))) && (!(_local_3._Str_4968 == null))))
                {
                    if (((_local_3.type == RoomPlane.TYPE_FLOOR) && ((_local_3._Str_5424.length < 1) || (_local_3._Str_4968.length < 1))))
                    {
                        _local_4._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                    }
                    else
                    {
                        _local_4._Str_4023 = AlphaTolerance.MATCH_OPAQUE_PIXELS;
                    }
                    if (_local_3.type == RoomPlane.TYPE_FLOOR)
                    {
                        _local_4.tag = ("plane.wall@" + (_local_2 + 1));
                    }
                    else
                    {
                        if (_local_3.type == RoomPlane.TYPE_LANDSCAPE)
                        {
                            _local_4.tag = ("plane.floor@" + (_local_2 + 1));
                        }
                        else
                        {
                            _local_4.tag = ("plane@" + (_local_2 + 1));
                        }
                    }
                    _local_4._Str_4918 = RoomObjectSpriteType.ROOM_PLANE;
                }
                _local_2++;
            }
        }

        protected function _Str_25732():void
        {
            var _local_8:IVector3d;
            var _local_9:IVector3d;
            var _local_10:IVector3d;
            var _local_11:Array;
            var _local_12:int;
            var _local_13:RoomPlane;
            var _local_14:IVector3d;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:int;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Number;
            if (this._planesInitialized)
            {
                return;
            }
            var k:IRoomObject = object;
            if (k == null)
            {
                return;
            }
            if (!isNaN(this._floorThicknessMultiplier))
            {
                this._roomPlaneParser._Str_9990 = this._floorThicknessMultiplier;
            }
            if (!isNaN(this._wallThicknessMultiplier))
            {
                this._roomPlaneParser._Str_9955 = this._wallThicknessMultiplier;
            }
            var _local_2:String = k.getModel().getString(RoomObjectVariableEnum.ROOM_PLANE_XML);
            if (!this._roomPlaneParser.initializeFromXML(new XML(_local_2)))
            {
                return;
            }
            var _local_3:Number = this.getLandscapeWidth();
            var _local_4:Number = this.getLandscapeHeight();
            var _local_5:Number = 0;
            var _local_6:int = k.getModel().getNumber(RoomObjectVariableEnum.ROOM_RANDOM_SEED);
            var _local_7:int;
            while (_local_7 < this._roomPlaneParser._Str_3828)
            {
                _local_8 = this._roomPlaneParser.getPlaneLocation(_local_7);
                _local_9 = this._roomPlaneParser.getPlaneLeftSide(_local_7);
                _local_10 = this._roomPlaneParser.getPlaneRightSide(_local_7);
                _local_11 = this._roomPlaneParser.getPlaneSecondaryNormals(_local_7);
                _local_12 = this._roomPlaneParser.getPlaneType(_local_7);
                _local_13 = null;
                if ((((!(_local_8 == null)) && (!(_local_9 == null))) && (!(_local_10 == null))))
                {
                    _local_14 = Vector3d.crossProduct(_local_9, _local_10);
                    _local_6 = ((_local_6 * 7613) + 517);
                    _local_13 = null;
                    if (_local_12 == RoomPlaneData.PLANE_FLOOR)
                    {
                        _local_15 = ((_local_8.x + _local_9.x) + 0.5);
                        _local_16 = ((_local_8.y + _local_10.y) + 0.5);
                        _local_17 = (int(_local_15) - _local_15);
                        _local_18 = (int(_local_16) - _local_16);
                        _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane.TYPE_LANDSCAPE, true, _local_11, _local_6, -(_local_17), -(_local_18));
                        if (_local_14.z != 0)
                        {
                            _local_13.color = FLOOR_COLOR_LEFT;
                        }
                        else
                        {
                            _local_13.color = ((_local_14.x != 0) ? WALL_COLOR_TOP : FLOOR_COLOR_RIGHT);
                        }
                        if (this._data != null)
                        {
                            _local_13.rasterizer = this._data.floorRasterizer;
                        }
                    }
                    else
                    {
                        if (_local_12 == RoomPlaneData.PLANE_WALL)
                        {
                            _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane.TYPE_FLOOR, true, _local_11, _local_6);
                            if (((_local_9.length < 1) || (_local_10.length < 1)))
                            {
                                _local_13._Str_18448 = false;
                            }
                            if (((_local_14.x == 0) && (_local_14.y == 0)))
                            {
                                _local_13.color = LANDSCAPE_COLOR_TOP;
                            }
                            else
                            {
                                if (_local_14.y > 0)
                                {
                                    _local_13.color = WALL_COLOR_SIDE;
                                }
                                else
                                {
                                    if (_local_14.y == 0)
                                    {
                                        _local_13.color = WALL_COLOR_BOTTOM;
                                    }
                                    else
                                    {
                                        _local_13.color = WALL_COLOR_BORDER;
                                    }
                                }
                            }
                            if (this._data != null)
                            {
                                _local_13.rasterizer = this._data.wallRasterizer;
                            }
                        }
                        else
                        {
                            if (_local_12 == RoomPlaneData.PLANE_LANDSCAPE)
                            {
                                _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane._Str_3272, true, _local_11, _local_6, _local_5, 0, _local_3, _local_4);
                                if (_local_14.y > 0)
                                {
                                    _local_13.color = LANDSCAPE_COLOR_SIDE;
                                }
                                else
                                {
                                    if (_local_14.y == 0)
                                    {
                                        _local_13.color = LANDSCAPE_COLOR_BOTTOM;
                                    }
                                    else
                                    {
                                        _local_13.color = _Str_18370;
                                    }
                                }
                                if (this._data != null)
                                {
                                    _local_13.rasterizer = this._data.landscapeRasterizer;
                                }
                                _local_5 = (_local_5 + _local_9.length);
                            }
                            else
                            {
                                if (_local_12 == RoomPlaneData.PLANE_BILLBOARD)
                                {
                                    _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane.TYPE_FLOOR, true, _local_11, _local_6);
                                    if (((_local_9.length < 1) || (_local_10.length < 1)))
                                    {
                                        _local_13._Str_18448 = false;
                                    }
                                    if (((_local_14.x == 0) && (_local_14.y == 0)))
                                    {
                                        _local_13.color = LANDSCAPE_COLOR_TOP;
                                    }
                                    else
                                    {
                                        if (_local_14.y > 0)
                                        {
                                            _local_13.color = WALL_COLOR_SIDE;
                                        }
                                        else
                                        {
                                            if (_local_14.y == 0)
                                            {
                                                _local_13.color = WALL_COLOR_BOTTOM;
                                            }
                                            else
                                            {
                                                _local_13.color = WALL_COLOR_BORDER;
                                            }
                                        }
                                    }
                                    if (this._data != null)
                                    {
                                        _local_13.rasterizer = this._data.wallAdRasterizr;
                                    }
                                }
                            }
                        }
                    }
                    if (_local_13 != null)
                    {
                        _local_13._Str_16279 = this._data._Str_16279;
                        _local_19 = 0;
                        while (_local_19 < this._roomPlaneParser.getPlaneMaskCount(_local_7))
                        {
                            _local_20 = this._roomPlaneParser.getPlaneMaskLeftSideLoc(_local_7, _local_19);
                            _local_21 = this._roomPlaneParser.getPlaneMaskRightSideLoc(_local_7, _local_19);
                            _local_22 = this._roomPlaneParser.getPlaneMaskLeftSideLength(_local_7, _local_19);
                            _local_23 = this._roomPlaneParser.getPlaneMaskRightSideLength(_local_7, _local_19);
                            _local_13.addRectangleMask(_local_20, _local_21, _local_22, _local_23);
                            _local_19++;
                        }
                        this._planes.push(_local_13);
                    }
                }
                else
                {
                    return;
                }
                _local_7++;
            }
            this._planesInitialized = true;
            this._Str_18024();
        }

        private function getLandscapeWidth():Number
        {
            var _local_3:int;
            var _local_4:IVector3d;
            var k:Number = 0;
            var _local_2:int;
            while (_local_2 < this._roomPlaneParser._Str_3828)
            {
                _local_3 = this._roomPlaneParser.getPlaneType(_local_2);
                if (_local_3 == RoomPlaneData.PLANE_LANDSCAPE)
                {
                    _local_4 = this._roomPlaneParser.getPlaneLeftSide(_local_2);
                    k = (k + _local_4.length);
                }
                _local_2++;
            }
            return k;
        }

        private function getLandscapeHeight():Number
        {
            var _local_3:int;
            var _local_4:IVector3d;
            var k:Number = 0;
            var _local_2:int;
            while (_local_2 < this._roomPlaneParser._Str_3828)
            {
                _local_3 = this._roomPlaneParser.getPlaneType(_local_2);
                if (_local_3 == RoomPlaneData.PLANE_LANDSCAPE)
                {
                    _local_4 = this._roomPlaneParser.getPlaneRightSide(_local_2);
                    if (_local_4.length > k)
                    {
                        k = _local_4.length;
                    }
                }
                _local_2++;
            }
            if (k > 5)
            {
                k = 5;
            }
            return k;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_10:int;
            var _local_11:int;
            var _local_12:IRoomObjectSprite;
            var _local_13:RoomPlane;
            var _local_14:uint;
            var _local_15:uint;
            var _local_16:uint;
            var _local_17:uint;
            var _local_18:uint;
            var _local_5:IRoomObject = object;
            if (_local_5 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            var _local_6:Boolean = this.updateGeometry(k);
            var _local_7:IRoomObjectModel = _local_5.getModel();
            var _local_8:Boolean;
            if (this.updatePlaneThicknesses(_local_7))
            {
                _local_8 = true;
            }
            if (this._Str_18134(_local_7))
            {
                _local_8 = true;
            }
            this._Str_25732();
            _local_8 = this.updateMasksAndColors(_local_7);
            var _local_9:int = _arg_2;
            if ((((_local_9 < (this._geometryUpdateId + this._Str_9654)) && (!(_local_6))) && (!(_local_8))))
            {
                return;
            }
            if (this.updatePlaneTexturesAndVisibilities(_local_7))
            {
                _local_8 = true;
            }
            if (this._Str_16913(k, _local_6, _arg_2))
            {
                _local_8 = true;
            }
            if (_local_8)
            {
                _local_10 = 0;
                while (_local_10 < this._visiblePlanes.length)
                {
                    _local_11 = this._visiblePlaneSpriteNumbers[_local_10];
                    _local_12 = getSprite(_local_11);
                    _local_13 = (this._visiblePlanes[_local_10] as RoomPlane);
                    if ((((!(_local_12 == null)) && (!(_local_13 == null))) && (!(_local_13.type == RoomPlane._Str_3272))))
                    {
                        if (this._colorizeBgOnly)
                        {
                            _local_14 = _local_13.color;
                            _local_15 = (((_local_14 & 0xFF) * this._backgroundBlue) / 0xFF);
                            _local_16 = ((((_local_14 >> 8) & 0xFF) * this._backgroundGreen) / 0xFF);
                            _local_17 = ((((_local_14 >> 16) & 0xFF) * this._backgroundRed) / 0xFF);
                            _local_18 = (_local_14 >> 24);
                            _local_14 = ((((_local_18 << 24) + (_local_17 << 16)) + (_local_16 << 8)) + _local_15);
                            _local_12.color = _local_14;
                        }
                        else
                        {
                            _local_12.color = _local_13.color;
                        }
                    }
                    _local_10++;
                }
                increaseUpdateId();
            }
            _modelUpdateID = _local_7.getUpdateID();
            this._geometryUpdateId = _local_9;
        }

        private function updateGeometry(k:IRoomGeometry):Boolean
        {
            var _local_3:IVector3d;
            var _local_2:Boolean;
            if (k.updateId != this.FLOOR_COLOR)
            {
                this.FLOOR_COLOR = k.updateId;
                this._boundingRectangle = null;
                _local_3 = k.direction;
                if (((!(_local_3 == null)) && ((((!(_local_3.x == this._geometryDirX)) || (!(_local_3.y == this._geometryDirY))) || (!(_local_3.z == this._geometryDirZ))) || (!(k.scale == this._geometryScale)))))
                {
                    this._geometryDirX = _local_3.x;
                    this._geometryDirY = _local_3.y;
                    this._geometryDirZ = _local_3.z;
                    this._geometryScale = k.scale;
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        private function updateMasksAndColors(k:IRoomObjectModel):Boolean
        {
            var _local_3:String;
            var _local_4:uint;
            var _local_5:Boolean;
            var _local_2:Boolean;
            if (_modelUpdateID != k.getUpdateID())
            {
                _local_3 = k.getString(RoomObjectVariableEnum.ROOM_PLANE_MASK_XML);
                if (_local_3 != this._planeMaskData)
                {
                    this._Str_15935(_local_3);
                    this._planeMaskData = _local_3;
                    _local_2 = true;
                }
                _local_4 = k.getNumber(RoomObjectVariableEnum.ROOM_BACKGROUND_COLOR);
                if (_local_4 != this._backgroundColor)
                {
                    this._backgroundColor = _local_4;
                    this._backgroundBlue = (this._backgroundColor & 0xFF);
                    this._backgroundGreen = ((this._backgroundColor >> 8) & 0xFF);
                    this._backgroundRed = ((this._backgroundColor >> 16) & 0xFF);
                    _local_2 = true;
                }
                _local_5 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_COLORIZE_BG_ONLY));
                if (_local_5 != this._colorizeBgOnly)
                {
                    this._colorizeBgOnly = _local_5;
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        private function updatePlaneTexturesAndVisibilities(k:IRoomObjectModel):Boolean
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            if (_modelUpdateID != k.getUpdateID())
            {
                _local_2 = k.getString(RoomObjectVariableEnum.ROOM_WALL_TYPE);
                _local_3 = k.getString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                _local_4 = k.getString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                this.updatePlaneTextureTypes(_local_3, _local_2, _local_4);
                _local_5 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_VISIBILITY));
                _local_6 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_WALL_VISIBILITY));
                _local_7 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_LANDSCAPE_VISIBILITY));
                this.updatePlaneTypeVisibilities(_local_5, _local_6, _local_7);
                return true;
            }
            return false;
        }

        private function updatePlaneThicknesses(k:IRoomObjectModel):Boolean
        {
            var _local_2:Number;
            var _local_3:Number;
            if (_modelUpdateID != k.getUpdateID())
            {
                _local_2 = k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_THICKNESS);
                _local_3 = k.getNumber(RoomObjectVariableEnum.ROOM_WALL_THICKNESS);
                if ((((!(isNaN(_local_2))) && (!(isNaN(_local_3)))) && ((!(_local_2 == this._floorThicknessMultiplier)) || (!(_local_3 == this._wallThicknessMultiplier)))))
                {
                    this._floorThicknessMultiplier = _local_2;
                    this._wallThicknessMultiplier = _local_3;
                    this.resetRoomPlanes();
                    return true;
                }
            }
            return false;
        }

        private function _Str_18134(k:IRoomObjectModel):Boolean
        {
            var _local_2:Number;
            if (_modelUpdateID != k.getUpdateID())
            {
                _local_2 = k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_HOLE_UPDATE_TIME);
                if (((!(isNaN(_local_2))) && (!(_local_2 == this._floorHoleUpdateTime))))
                {
                    this._floorHoleUpdateTime = _local_2;
                    this.resetRoomPlanes();
                    return true;
                }
            }
            return false;
        }

        protected function updatePlaneTextureTypes(k:String, _arg_2:String, _arg_3:String):Boolean
        {
            var _local_5:RoomPlane;
            if (k != this._floorType)
            {
                this._floorType = k;
            }
            else
            {
                k = null;
            }
            if (_arg_2 != this._wallType)
            {
                this._wallType = _arg_2;
            }
            else
            {
                _arg_2 = null;
            }
            if (_arg_3 != this._landscapeType)
            {
                this._landscapeType = _arg_3;
            }
            else
            {
                _arg_3 = null;
            }
            if ((((k == null) && (_arg_2 == null)) && (_arg_3 == null)))
            {
                return false;
            }
            var _local_4:int;
            while (_local_4 < this._planes.length)
            {
                _local_5 = (this._planes[_local_4] as RoomPlane);
                if (_local_5 != null)
                {
                    if (((_local_5.type == RoomPlane.TYPE_LANDSCAPE) && (!(k == null))))
                    {
                        _local_5.id = k;
                    }
                    else
                    {
                        if (((_local_5.type == RoomPlane.TYPE_FLOOR) && (!(_arg_2 == null))))
                        {
                            _local_5.id = _arg_2;
                        }
                        else
                        {
                            if (((_local_5.type == RoomPlane._Str_3272) && (!(_arg_3 == null))))
                            {
                                _local_5.id = _arg_3;
                            }
                        }
                    }
                }
                _local_4++;
            }
            return true;
        }

        private function updatePlaneTypeVisibilities(k:Boolean, _arg_2:Boolean, _arg_3:Boolean):void
        {
            if ((((!(k == this._planeTypeVisibilities[RoomPlane.TYPE_LANDSCAPE])) || (!(_arg_2 == this._planeTypeVisibilities[RoomPlane.TYPE_FLOOR]))) || (!(_arg_3 == this._planeTypeVisibilities[RoomPlane._Str_3272]))))
            {
                this._planeTypeVisibilities[RoomPlane.TYPE_LANDSCAPE] = k;
                this._planeTypeVisibilities[RoomPlane.TYPE_FLOOR] = _arg_2;
                this._planeTypeVisibilities[RoomPlane._Str_3272] = _arg_3;
                this._visiblePlanes = [];
                this._visiblePlaneSpriteNumbers = [];
            }
        }

        protected function _Str_16913(k:IRoomGeometry, _arg_2:Boolean, _arg_3:int):Boolean
        {
            var _local_10:int;
            var _local_11:IRoomObjectSprite;
            var _local_12:RoomPlane;
            var _local_13:Number;
            var _local_14:String;
            var _local_4:IRoomObject = object;
            if (_local_4 == null)
            {
                return false;
            }
            if (k == null)
            {
                return false;
            }
            this._assetUpdateCounter++;
            if (_arg_2)
            {
                this._visiblePlanes = [];
                this._visiblePlaneSpriteNumbers = [];
            }
            var _local_5:int = _arg_3;
            var _local_6:Array = this._visiblePlanes;
            if (this._visiblePlanes.length == 0)
            {
                _local_6 = this._planes;
            }
            var _local_7:Boolean;
            var _local_8:* = (this._visiblePlanes.length > 0);
            var _local_9:int;
            while (_local_9 < _local_6.length)
            {
                _local_10 = _local_9;
                if (_local_8)
                {
                    _local_10 = this._visiblePlaneSpriteNumbers[_local_9];
                }
                _local_11 = getSprite(_local_10);
                if (_local_11 != null)
                {
                    _local_12 = (_local_6[_local_9] as RoomPlane);
                    if (_local_12 != null)
                    {
                        _local_11.spriteType = _local_12.uniqueId;
                        if (_local_12.update(k, _local_5))
                        {
                            if (_local_12.visible)
                            {
                                _local_13 = ((_local_12.relativeDepth + this.floorRelativeDepth) + (Number(_local_10) / 1000));
                                if (_local_12.type != RoomPlane.TYPE_LANDSCAPE)
                                {
                                    _local_13 = ((_local_12.relativeDepth + this.wallRelativeDepth) + (Number(_local_10) / 1000));
                                    if (((_local_12._Str_5424.length < 1) || (_local_12._Str_4968.length < 1)))
                                    {
                                        _local_13 = (_local_13 + (ROOM_DEPTH_OFFSET * 0.5));
                                    }
                                }
                                _local_14 = ((("plane " + _local_10) + " ") + k.scale);
                                this.updateSprite(_local_11, _local_12, _local_14, _local_13);
                            }
                            _local_7 = true;
                        }
                        if (_local_11.visible != ((_local_12.visible) && (this._planeTypeVisibilities[_local_12.type])))
                        {
                            _local_11.visible = (!(_local_11.visible));
                            _local_7 = true;
                        }
                        if (_local_11.visible)
                        {
                            if (!_local_8)
                            {
                                this._visiblePlanes.push(_local_12);
                                this._visiblePlaneSpriteNumbers.push(_local_9);
                            }
                        }
                    }
                    else
                    {
                        _local_11.spriteType = 0;
                        if (_local_11.visible)
                        {
                            _local_11.visible = false;
                            _local_7 = true;
                        }
                    }
                }
                _local_9++;
            }
            return _local_7;
        }

        private function updateSprite(k:IRoomObjectSprite, _arg_2:RoomPlane, _arg_3:String, _arg_4:Number):void
        {
            var _local_5:Point = _arg_2.offset;
            k.offsetX = -(_local_5.x);
            k.offsetY = -(_local_5.y);
            k.relativeDepth = _arg_4;
            k.color = _arg_2.color;
            k.asset = this.getPlaneBitmap(_arg_2, _arg_3);
            k.assetName = ((_arg_3 + "_") + this._assetUpdateCounter);
        }

        private function getPlaneBitmap(k:RoomPlane, _arg_2:String):BitmapData
        {
            var _local_3:BitmapDataAsset = (this._assetLibrary.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_3 == null)
            {
                _local_3 = new BitmapDataAsset(this._assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
                this._assetLibrary.setAsset(_arg_2, _local_3);
            }
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            var _local_5:BitmapData = k.copyBitmapData(_local_4);
            if (_local_5 == null)
            {
                _local_5 = k.bitmapData;
                if (_local_5 != null)
                {
                    if (_local_4 != _local_5)
                    {
                        if (_local_4 != null)
                        {
                            _local_4.dispose();
                        }
                        _local_3.setUnknownContent(_local_5);
                    }
                }
            }
            return _local_5;
        }

        protected function _Str_15935(k:String):void
        {
            var _local_10:String;
            var _local_11:IVector3d;
            var _local_12:String;
            var _local_13:int;
            var _local_14:IVector3d;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:int;
            if (k == null)
            {
                return;
            }
            var _local_2:XML = XML(k);
            this._roomPlaneBitmapMaskParser.initialize(_local_2);
            var _local_3:RoomPlane;
            var _local_4:Array = [];
            var _local_5:Array = [];
            var _local_6:Boolean;
            var _local_7:int;
            while (_local_7 < this._planes.length)
            {
                _local_3 = (this._planes[_local_7] as RoomPlane);
                if (_local_3 != null)
                {
                    _local_3.resetBitmapMasks();
                    if (_local_3.type == RoomPlane._Str_3272)
                    {
                        _local_4.push(_local_7);
                    }
                }
                _local_7++;
            }
            var _local_8:int;
            while (_local_8 < this._roomPlaneBitmapMaskParser._Str_6845)
            {
                _local_10 = this._roomPlaneBitmapMaskParser.getMaskType(_local_8);
                _local_11 = this._roomPlaneBitmapMaskParser.getMaskLocation(_local_8);
                _local_12 = this._roomPlaneBitmapMaskParser.getMaskCategory(_local_8);
                if (_local_11 != null)
                {
                    _local_13 = 0;
                    while (_local_13 < this._planes.length)
                    {
                        _local_3 = (this._planes[_local_13] as RoomPlane);
                        if (((_local_3.type == RoomPlane.TYPE_FLOOR) || (_local_3.type == RoomPlane._Str_3272)))
                        {
                            if ((((!(_local_3 == null)) && (!(_local_3.location == null))) && (!(_local_3.normal == null))))
                            {
                                _local_14 = Vector3d.dif(_local_11, _local_3.location);
                                _local_15 = Math.abs(Vector3d.scalarProjection(_local_14, _local_3.normal));
                                if (_local_15 < 0.01)
                                {
                                    if (((!(_local_3._Str_5424 == null)) && (!(_local_3._Str_4968 == null))))
                                    {
                                        _local_16 = Vector3d.scalarProjection(_local_14, _local_3._Str_5424);
                                        _local_17 = Vector3d.scalarProjection(_local_14, _local_3._Str_4968);
                                        if (((_local_3.type == RoomPlane.TYPE_FLOOR) || ((_local_3.type == RoomPlane._Str_3272) && (_local_12 == RoomPlaneBitmapMaskData.HOLE))))
                                        {
                                            _local_3.addBitmapMask(_local_10, _local_16, _local_17);
                                        }
                                        else
                                        {
                                            if (_local_3.type == RoomPlane._Str_3272)
                                            {
                                                if (!_local_3._Str_14801)
                                                {
                                                    _local_6 = true;
                                                }
                                                _local_3._Str_14801 = true;
                                                _local_5.push(_local_13);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        _local_13++;
                    }
                }
                _local_8++;
            }
            var _local_9:int;
            while (_local_9 < _local_4.length)
            {
                _local_18 = _local_4[_local_9];
                if (_local_5.indexOf(_local_18) < 0)
                {
                    _local_3 = (this._planes[_local_18] as RoomPlane);
                    _local_3._Str_14801 = false;
                    _local_6 = true;
                }
                _local_9++;
            }
            if (_local_6)
            {
                this._visiblePlanes = [];
                this._visiblePlaneSpriteNumbers = [];
            }
        }

        public function get _Str_19113():Vector.<IRoomPlane>
        {
            var _local_2:RoomPlane;
            var k:Vector.<IRoomPlane> = new Vector.<IRoomPlane>(0);
            for each (_local_2 in this._visiblePlanes)
            {
                k.push(_local_2);
            }
            return k;
        }
    }
}
