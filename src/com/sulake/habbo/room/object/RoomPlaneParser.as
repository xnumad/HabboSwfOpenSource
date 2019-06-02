package com.sulake.habbo.room.object
{
    import com.sulake.core.utils.Map;
    import flash.geom.Point;
    import __AS3__.vec.Vector;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.XMLValidator;
    import __AS3__.vec.*;

    public class RoomPlaneParser 
    {
        private static const FLOOR_THICKNESS:Number = 0.25;
        private static const WALL_THICKNESS:Number = 0.25;
        private static const MAX_WALL_ADDITIONAL_HEIGHT:Number = 20;
        public static const TILE_BLOCKED:int = -110;
        public static const TILE_HOLE:int = -100;

        private var _tileMatrix:Array;
        private var _tileMatrixOriginal:Array;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _minX:int = 0;
        private var _maxX:int = 0;
        private var _minY:int = 0;
        private var _maxY:int = 0;
        private var _planes:Array;
        private var _wallHeight:Number = 0;
        private var _wallThicknessMultiplier:Number = 1;
        private var _floorThicknessMultiplier:Number = 1;
        private var _fixedWallHeight:int = -1;
        private var _floorHeight:Number = 0;
        private var _floorHoles:Map = null;
        private var _floorHoleMatrix:Array;

        public function RoomPlaneParser()
        {
            this._tileMatrix = [];
            this._tileMatrixOriginal = [];
            this._planes = [];
            this._floorHoleMatrix = [];
            super();
            this._wallHeight = 3.6;
            this._wallThicknessMultiplier = 1;
            this._floorThicknessMultiplier = 1;
            this._floorHoles = new Map();
        }

        private static function getFloorHeight(k:Array):Number
        {
            var _local_8:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int = k.length;
            var _local_6:int;
            if (_local_5 == 0)
            {
                return 0;
            }
            var _local_7:Number = 0;
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_4 = (k[_local_3] as Array);
                _local_2 = 0;
                while (_local_2 < _local_4.length)
                {
                    _local_8 = Number(_local_4[_local_2]);
                    if (_local_8 > _local_7)
                    {
                        _local_7 = _local_8;
                    }
                    _local_2++;
                }
                _local_3++;
            }
            return _local_7;
        }

        private static function findEntranceTile(k:Array):Point
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:int;
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int = k.length;
            if (_local_5 == 0)
            {
                return null;
            }
            var _local_6:Array = [];
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_4 = (k[_local_3] as Array);
                if (((_local_4 == null) || (_local_4.length == 0)))
                {
                    return null;
                }
                _local_2 = 0;
                while (_local_2 < _local_4.length)
                {
                    if (Number(_local_4[_local_2]) >= 0)
                    {
                        _local_6.push(_local_2);
                        break;
                    }
                    _local_2++;
                }
                if (_local_6.length < (_local_3 + 1))
                {
                    _local_6.push((_local_4.length + 1));
                }
                _local_3++;
            }
            _local_3 = 1;
            while (_local_3 < (_local_6.length - 1))
            {
                if (((int(_local_6[_local_3]) <= (int(_local_6[(_local_3 - 1)]) - 1)) && (int(_local_6[_local_3]) <= (int(_local_6[(_local_3 + 1)]) - 1))))
                {
                    return new Point(int(_local_6[_local_3]), _local_3);
                }
                _local_3++;
            }
            return null;
        }

        private static function expandFloorTiles(k:Vector.<Vector.<int>>):Vector.<Vector.<int>>
        {
            var _local_2:uint;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            _local_2 = k.length;
            var _local_3:uint = k[0].length;
            var _local_4:Vector.<Vector.<int>> = new Vector.<Vector.<int>>((_local_2 * 4));
            _local_6 = 0;
            while (_local_6 < (_local_2 * 4))
            {
                _local_4[_local_6] = new Vector.<int>((_local_3 * 4));
                _local_6++;
            }
            var _local_9:int;
            _local_6 = 0;
            while (_local_6 < _local_2)
            {
                _local_10 = 0;
                _local_5 = 0;
                while (_local_5 < _local_3)
                {
                    _local_11 = k[_local_6][_local_5];
                    if (((_local_11 < 0) || (_local_11 <= 0xFF)))
                    {
                        _local_8 = 0;
                        while (_local_8 < 4)
                        {
                            _local_7 = 0;
                            while (_local_7 < 4)
                            {
                                _local_4[(_local_9 + _local_8)][(_local_10 + _local_7)] = ((_local_11 < 0) ? _local_11 : (_local_11 * 4));
                                _local_7++;
                            }
                            _local_8++;
                        }
                    }
                    else
                    {
                        _local_12 = ((_local_11 & 0xFF) * 4);
                        _local_13 = (_local_12 + (((_local_11 >> 11) & 0x01) * 3));
                        _local_14 = (_local_12 + (((_local_11 >> 10) & 0x01) * 3));
                        _local_15 = (_local_12 + (((_local_11 >> 9) & 0x01) * 3));
                        _local_16 = (_local_12 + (((_local_11 >> 8) & 0x01) * 3));
                        _local_7 = 0;
                        while (_local_7 < 3)
                        {
                            _local_17 = (_local_7 + 1);
                            _local_4[_local_9][(_local_10 + _local_7)] = (((_local_13 * (3 - _local_7)) + (_local_14 * _local_7)) / 3);
                            _local_4[(_local_9 + 3)][(_local_10 + _local_17)] = (((_local_15 * (3 - _local_17)) + (_local_16 * _local_17)) / 3);
                            _local_4[(_local_9 + _local_17)][_local_10] = (((_local_13 * (3 - _local_17)) + (_local_15 * _local_17)) / 3);
                            _local_4[(_local_9 + _local_7)][(_local_10 + 3)] = (((_local_14 * (3 - _local_7)) + (_local_16 * _local_7)) / 3);
                            _local_7++;
                        }
                        _local_4[(_local_9 + 1)][(_local_10 + 1)] = ((_local_13 > _local_12) ? (_local_12 + 2) : (_local_12 + 1));
                        _local_4[(_local_9 + 1)][(_local_10 + 2)] = ((_local_14 > _local_12) ? (_local_12 + 2) : (_local_12 + 1));
                        _local_4[(_local_9 + 2)][(_local_10 + 1)] = ((_local_15 > _local_12) ? (_local_12 + 2) : (_local_12 + 1));
                        _local_4[(_local_9 + 2)][(_local_10 + 2)] = ((_local_16 > _local_12) ? (_local_12 + 2) : (_local_12 + 1));
                    }
                    _local_10 = (_local_10 + 4);
                    _local_5++;
                }
                _local_9 = (_local_9 + 4);
                _local_6++;
            }
            return _local_4;
        }

        private static function addTileTypes(k:Vector.<Vector.<int>>):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_2:uint = (k.length - 1);
            var _local_3:uint = (k[0].length - 1);
            _local_5 = 1;
            while (_local_5 < _local_2)
            {
                _local_4 = 1;
                while (_local_4 < _local_3)
                {
                    _local_6 = k[_local_5][_local_4];
                    if (_local_6 < 0)
                    {
                    }
                    else
                    {
                        _local_7 = (k[(_local_5 - 1)][(_local_4 - 1)] & 0xFF);
                        _local_8 = (k[(_local_5 - 1)][_local_4] & 0xFF);
                        _local_9 = (k[(_local_5 - 1)][(_local_4 + 1)] & 0xFF);
                        _local_10 = (k[_local_5][(_local_4 - 1)] & 0xFF);
                        _local_11 = (k[_local_5][(_local_4 + 1)] & 0xFF);
                        _local_12 = (k[(_local_5 + 1)][(_local_4 - 1)] & 0xFF);
                        _local_13 = (k[(_local_5 + 1)][_local_4] & 0xFF);
                        _local_14 = (k[(_local_5 + 1)][(_local_4 + 1)] & 0xFF);
                        _local_15 = (_local_6 + 1);
                        _local_16 = (_local_6 - 1);
                        _local_17 = (((((((_local_7 == _local_15) || (_local_8 == _local_15)) || (_local_10 == _local_15)) ? 8 : 0) | ((((_local_9 == _local_15) || (_local_8 == _local_15)) || (_local_11 == _local_15)) ? 4 : 0)) | ((((_local_12 == _local_15) || (_local_13 == _local_15)) || (_local_10 == _local_15)) ? 2 : 0)) | ((((_local_14 == _local_15) || (_local_13 == _local_15)) || (_local_11 == _local_15)) ? 1 : 0));
                        if (_local_17 == 15)
                        {
                            _local_17 = 0;
                        }
                        k[_local_5][_local_4] = (_local_6 | (_local_17 << 8));
                    }
                    _local_4++;
                }
                _local_5++;
            }
        }

        private static function unpadHeightMap(k:Vector.<Vector.<int>>):void
        {
            var _local_2:Vector.<int>;
            k.shift();
            k.pop();
            for each (_local_2 in k)
            {
                _local_2.shift();
                _local_2.pop();
            }
        }

        private static function padHeightMap(k:Vector.<Vector.<int>>):void
        {
            var _local_4:Vector.<int>;
            var _local_5:int;
            var _local_2:Vector.<int> = new Vector.<int>(0);
            var _local_3:Vector.<int> = new Vector.<int>(0);
            for each (_local_4 in k)
            {
                _local_4.push(TILE_BLOCKED);
                _local_4.unshift(TILE_BLOCKED);
            }
            for each (_local_5 in k[0])
            {
                _local_2.push(TILE_BLOCKED);
                _local_3.push(TILE_BLOCKED);
            }
            k.push(_local_3);
            k.unshift(_local_2);
        }


        public function get minX():int
        {
            return this._minX;
        }

        public function get maxX():int
        {
            return this._maxX;
        }

        public function get minY():int
        {
            return this._minY;
        }

        public function get maxY():int
        {
            return this._maxY;
        }

        public function get tileMapWidth():int
        {
            return this._width;
        }

        public function get tileMapHeight():int
        {
            return this._height;
        }

        public function get _Str_3828():int
        {
            return this._planes.length;
        }

        public function get floorHeight():Number
        {
            if (this._fixedWallHeight != -1)
            {
                return this._fixedWallHeight;
            }
            return this._floorHeight;
        }

        public function get wallHeight():Number
        {
            if (this._fixedWallHeight != -1)
            {
                return this._fixedWallHeight + 3.6;
            }
            return this._wallHeight;
        }

        public function set wallHeight(k:Number):void
        {
            if (k < 0)
            {
                k = 0;
            }
            this._wallHeight = k;
        }

        public function get _Str_9955():Number
        {
            return this._wallThicknessMultiplier;
        }

        public function set _Str_9955(k:Number):void
        {
            if (k < 0)
            {
                k = 0;
            }
            this._wallThicknessMultiplier = k;
        }

        public function get _Str_9990():Number
        {
            return this._floorThicknessMultiplier;
        }

        public function set _Str_9990(k:Number):void
        {
            if (k < 0)
            {
                k = 0;
            }
            this._floorThicknessMultiplier = k;
        }

        public function dispose():void
        {
            this._planes = null;
            this._tileMatrix = null;
            this._tileMatrixOriginal = null;
            this._floorHoleMatrix = null;
            if (this._floorHoles != null)
            {
                this._floorHoles.dispose();
                this._floorHoles = null;
            }
        }

        public function reset():void
        {
            this._planes = [];
            this._tileMatrix = [];
            this._tileMatrixOriginal = [];
            this._tileMatrix = [];
            this._tileMatrixOriginal = [];
            this._width = 0;
            this._height = 0;
            this._minX = 0;
            this._maxX = 0;
            this._minY = 0;
            this._maxY = 0;
            this._floorHeight = 0;
            this._floorHoleMatrix = [];
        }

        public function initializeTileMap(k:int, _arg_2:int):Boolean
        {
            var _local_4:Array;
            var _local_5:Array;
            var _local_6:Array;
            var _local_7:int;
            if (k < 0)
            {
                k = 0;
            }
            if (_arg_2 < 0)
            {
                _arg_2 = 0;
            }
            this._tileMatrix = [];
            this._tileMatrixOriginal = [];
            this._floorHoleMatrix = [];
            var _local_3:int;
            while (_local_3 < _arg_2)
            {
                _local_4 = [];
                _local_5 = [];
                _local_6 = [];
                _local_7 = 0;
                while (_local_7 < k)
                {
                    _local_4[_local_7] = TILE_BLOCKED;
                    _local_5[_local_7] = TILE_BLOCKED;
                    _local_6[_local_7] = false;
                    _local_7++;
                }
                this._tileMatrix.push(_local_4);
                this._tileMatrixOriginal.push(_local_5);
                this._floorHoleMatrix.push(_local_6);
                _local_3++;
            }
            this._width = k;
            this._height = _arg_2;
            this._minX = this._width;
            this._maxX = -1;
            this._minY = this._height;
            this._maxY = -1;
            return true;
        }

        public function _Str_3982(k:int, _arg_2:int, _arg_3:Number):Boolean
        {
            var _local_4:Array;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:int;
            if (((((k >= 0) && (k < this._width)) && (_arg_2 >= 0)) && (_arg_2 < this._height)))
            {
                _local_4 = (this._tileMatrix[_arg_2] as Array);
                _local_4[k] = _arg_3;
                if (_arg_3 >= 0)
                {
                    if (k < this._minX)
                    {
                        this._minX = k;
                    }
                    if (k > this._maxX)
                    {
                        this._maxX = k;
                    }
                    if (_arg_2 < this._minY)
                    {
                        this._minY = _arg_2;
                    }
                    if (_arg_2 > this._maxY)
                    {
                        this._maxY = _arg_2;
                    }
                }
                else
                {
                    if (((k == this._minX) || (k == this._maxX)))
                    {
                        _local_5 = false;
                        _local_6 = this._minY;
                        while (_local_6 < this._maxY)
                        {
                            if (this.getTileHeightInternal(k, _local_6) >= 0)
                            {
                                _local_5 = true;
                                break;
                            }
                            _local_6++;
                        }
                        if (!_local_5)
                        {
                            if (k == this._minX)
                            {
                                this._minX++;
                            }
                            if (k == this._maxX)
                            {
                                this._maxX--;
                            }
                        }
                    }
                    if (((_arg_2 == this._minY) || (_arg_2 == this._maxY)))
                    {
                        _local_7 = false;
                        _local_8 = this._minX;
                        while (_local_8 < this._maxX)
                        {
                            if (this._Str_2754(_local_8, _arg_2) >= 0)
                            {
                                _local_7 = true;
                                break;
                            }
                            _local_8++;
                        }
                        if (!_local_7)
                        {
                            if (_arg_2 == this._minY)
                            {
                                this._minY++;
                            }
                            if (_arg_2 == this._maxY)
                            {
                                this._maxY--;
                            }
                        }
                    }
                }
                return true;
            }
            return false;
        }

        public function _Str_2754(k:int, _arg_2:int):Number
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return TILE_BLOCKED;
            }
            var _local_3:Array = (this._tileMatrix[_arg_2] as Array);
            return Math.abs((_local_3[k] as Number));
        }

        private function getTileHeightOriginal(k:int, _arg_2:int):Number
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return TILE_BLOCKED;
            }
            if (this._floorHoleMatrix[_arg_2][k])
            {
                return TILE_HOLE;
            }
            var _local_3:Array = (this._tileMatrixOriginal[_arg_2] as Array);
            return _local_3[k] as Number;
        }

        private function getTileHeightInternal(k:int, _arg_2:int):Number
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return TILE_BLOCKED;
            }
            var _local_3:Array = (this._tileMatrix[_arg_2] as Array);
            return _local_3[k] as Number;
        }

        public function initializeFromTileData(k:int=-1):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            this._fixedWallHeight = k;
            _local_3 = 0;
            while (_local_3 < this._height)
            {
                _local_2 = 0;
                while (_local_2 < this._width)
                {
                    this._tileMatrixOriginal[_local_3][_local_2] = this._tileMatrix[_local_3][_local_2];
                    _local_2++;
                }
                _local_3++;
            }
            var _local_4:Point = findEntranceTile(this._tileMatrix);
            _local_3 = 0;
            while (_local_3 < this._height)
            {
                _local_2 = 0;
                while (_local_2 < this._width)
                {
                    if (this._floorHoleMatrix[_local_3][_local_2])
                    {
                        this._Str_3982(_local_2, _local_3, TILE_HOLE);
                    }
                    _local_2++;
                }
                _local_3++;
            }
            return this.initialize(_local_4);
        }

        private function initialize(k:Point):Boolean
        {
            var _local_4:Array;
            var _local_5:Vector.<Vector.<int>>;
            var _local_2:int;
            if (k != null)
            {
                _local_2 = this._Str_2754(k.x, k.y);
                this._Str_3982(k.x, k.y, TILE_BLOCKED);
            }
            this._floorHeight = getFloorHeight(this._tileMatrix);
            this.createWallPlanes();
            var _local_3:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(0);
            for each (_local_4 in this._tileMatrix)
            {
                _local_3.push(Vector.<int>(_local_4));
            }
            padHeightMap(_local_3);
            addTileTypes(_local_3);
            unpadHeightMap(_local_3);
            _local_5 = expandFloorTiles(_local_3);
            this.extractPlanes(_local_5);
            if (k != null)
            {
                this._Str_3982(k.x, k.y, _local_2);
                this.addFloor(new Vector3d((k.x + 0.5), (k.y + 0.5), _local_2), new Vector3d(-1, 0, 0), new Vector3d(0, -1, 0), false, false, false, false);
            }
            return true;
        }

        private function generateWallData(k:Point, _arg_2:Boolean):RoomWallData
        {
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:int;
            var _local_11:Point;
            var _local_12:int;
            var _local_3:RoomWallData = new RoomWallData();
            var _local_4:Array = [this.extractTopWall, this.extractRightWall, this.extractBottomWall, this.extractLeftWall];
            var _local_5:int;
            var _local_6:Point = new Point(k.x, k.y);
            var _local_7:int;
            while (_local_7++ < 1000)
            {
                _local_8 = false;
                _local_9 = false;
                _local_10 = _local_5;
                if (((((_local_6.x < this.minX) || (_local_6.x > this.maxX)) || (_local_6.y < this.minY)) || (_local_6.y > this.maxY)))
                {
                    _local_8 = true;
                }
                _local_11 = _local_4[_local_5](_local_6, _arg_2);
                if (_local_11 == null)
                {
                    return null;
                }
                _local_12 = (Math.abs((_local_11.x - _local_6.x)) + Math.abs((_local_11.y - _local_6.y)));
                if (((_local_6.x == _local_11.x) || (_local_6.y == _local_11.y)))
                {
                    _local_5 = (((_local_5 - 1) + _local_4.length) % _local_4.length);
                    _local_12 = (_local_12 + 1);
                    _local_9 = true;
                }
                else
                {
                    _local_5 = ((_local_5 + 1) % _local_4.length);
                    _local_12--;
                }
                _local_3._Str_17862(_local_6, _local_10, _local_12, _local_8, _local_9);
                if ((((_local_11.x == k.x) && (_local_11.y == k.y)) && ((!(_local_11.x == _local_6.x)) || (!(_local_11.y == _local_6.y)))))
                {
                    break;
                }
                _local_6 = _local_11;
            }
            if (_local_3.count == 0)
            {
                return null;
            }
            return _local_3;
        }

        private function hidePeninsulaWallChains(k:RoomWallData):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:int;
            var _local_2:int;
            var _local_3:int = k.count;
            while (_local_2 < _local_3)
            {
                _local_4 = _local_2;
                _local_5 = _local_2;
                _local_6 = 0;
                _local_7 = false;
                while (((!(k.getBorder(_local_2))) && (_local_2 < _local_3)))
                {
                    if (k.getLeftTurn(_local_2))
                    {
                        _local_6++;
                    }
                    else
                    {
                        if (_local_6 > 0)
                        {
                            _local_6--;
                        }
                    }
                    if (_local_6 > 1)
                    {
                        _local_7 = true;
                    }
                    _local_5 = _local_2;
                    _local_2++;
                }
                if (_local_7)
                {
                    _local_8 = _local_4;
                    while (_local_8 <= _local_5)
                    {
                        k.setHideWall(_local_8, true);
                        _local_8++;
                    }
                }
                _local_2++;
            }
        }

        private function updateWallsNextToHoles(k:RoomWallData):void
        {
            var _local_4:Point;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IVector3d;
            var _local_8:IVector3d;
            var _local_9:int;
            var _local_10:int;
            var _local_2:int = k.count;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                if (!k.getHideWall(_local_3))
                {
                    _local_4 = k.getCorner(_local_3);
                    _local_5 = k.getDirection(_local_3);
                    _local_6 = k.getLength(_local_3);
                    _local_7 = RoomWallData._Str_5077[_local_5];
                    _local_8 = RoomWallData._Str_5543[_local_5];
                    _local_9 = 0;
                    _local_10 = 0;
                    while (_local_10 < _local_6)
                    {
                        if (this.getTileHeightInternal(((_local_4.x + (_local_10 * _local_7.x)) - _local_8.x), ((_local_4.y + (_local_10 * _local_7.y)) - _local_8.y)) == TILE_HOLE)
                        {
                            if (((_local_10 > 0) && (_local_9 == 0)))
                            {
                                k.setLength(_local_3, _local_10);
                                break;
                            }
                            _local_9++;
                        }
                        else
                        {
                            if (_local_9 > 0)
                            {
                                k.moveCorner(_local_3, _local_9);
                                break;
                            }
                        }
                        _local_10++;
                    }
                    if (_local_9 == _local_6)
                    {
                        k.setHideWall(_local_3, true);
                    }
                }
                _local_3++;
            }
        }

        private function resolveOriginalWallIndex(k:Point, _arg_2:Point, _arg_3:RoomWallData):int
        {
            var _local_10:Point;
            var _local_11:Point;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_4:int = Math.min(k.y, _arg_2.y);
            var _local_5:int = Math.max(k.y, _arg_2.y);
            var _local_6:int = Math.min(k.x, _arg_2.x);
            var _local_7:int = Math.max(k.x, _arg_2.x);
            var _local_8:int = _arg_3.count;
            var _local_9:int;
            while (_local_9 < _local_8)
            {
                _local_10 = _arg_3.getCorner(_local_9);
                _local_11 = _arg_3.getEndPoint(_local_9);
                if (k.x == _arg_2.x)
                {
                    if (((_local_10.x == k.x) && (_local_11.x == k.x)))
                    {
                        _local_12 = Math.min(_local_10.y, _local_11.y);
                        _local_13 = Math.max(_local_10.y, _local_11.y);
                        if (((_local_12 <= _local_4) && (_local_5 <= _local_13)))
                        {
                            return _local_9;
                        }
                    }
                }
                else
                {
                    if (k.y == _arg_2.y)
                    {
                        if (((_local_10.y == k.y) && (_local_11.y == k.y)))
                        {
                            _local_14 = Math.min(_local_10.x, _local_11.x);
                            _local_15 = Math.max(_local_10.x, _local_11.x);
                            if (((_local_14 <= _local_6) && (_local_7 <= _local_15)))
                            {
                                return _local_9;
                            }
                        }
                    }
                }
                _local_9++;
            }
            return -1;
        }

        private function hideOriginallyHiddenWalls(k:RoomWallData, _arg_2:RoomWallData):void
        {
            var _local_5:Point;
            var _local_6:Point;
            var _local_7:IVector3d;
            var _local_8:int;
            var _local_9:int;
            var _local_3:int = k.count;
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                if (!k.getHideWall(_local_4))
                {
                    _local_5 = k.getCorner(_local_4);
                    _local_6 = new Point(_local_5.x, _local_5.y);
                    _local_7 = RoomWallData._Str_5077[k.getDirection(_local_4)];
                    _local_8 = k.getLength(_local_4);
                    _local_6.x = (_local_6.x + (_local_7.x * _local_8));
                    _local_6.y = (_local_6.y + (_local_7.y * _local_8));
                    _local_9 = this.resolveOriginalWallIndex(_local_5, _local_6, _arg_2);
                    if (_local_9 >= 0)
                    {
                        if (_arg_2.getHideWall(_local_9))
                        {
                            k.setHideWall(_local_4, true);
                        }
                    }
                    else
                    {
                        k.setHideWall(_local_4, true);
                    }
                }
                _local_4++;
            }
        }

        private function checkWallHiding(k:RoomWallData, _arg_2:RoomWallData):void
        {
            this.hidePeninsulaWallChains(_arg_2);
            this.updateWallsNextToHoles(k);
            this.hideOriginallyHiddenWalls(k, _arg_2);
        }

        private function addWalls(k:RoomWallData, _arg_2:RoomWallData):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_8:Point;
            var _local_9:int;
            var _local_10:int;
            var _local_11:IVector3d;
            var _local_12:IVector3d;
            var _local_13:Number;
            var _local_14:int;
            var _local_15:Number;
            var _local_16:Vector3d;
            var _local_17:Number;
            var _local_18:Vector3d;
            var _local_19:Vector3d;
            var _local_20:int;
            var _local_21:Vector3d;
            var _local_22:Boolean;
            var _local_23:Boolean;
            var _local_24:Boolean;
            var _local_25:Boolean;
            var _local_26:Boolean;
            var _local_27:Number;
            var _local_3:int = k.count;
            var _local_4:int = _arg_2.count;
            var _local_7:int;
            while (_local_7 < _local_3)
            {
                if (!k.getHideWall(_local_7))
                {
                    _local_8 = k.getCorner(_local_7);
                    _local_9 = k.getDirection(_local_7);
                    _local_10 = k.getLength(_local_7);
                    _local_11 = RoomWallData._Str_5077[_local_9];
                    _local_12 = RoomWallData._Str_5543[_local_9];
                    _local_13 = -1;
                    _local_14 = 0;
                    while (_local_14 < _local_10)
                    {
                        _local_27 = this.getTileHeightInternal(((_local_8.x + (_local_14 * _local_11.x)) + _local_12.x), ((_local_8.y + (_local_14 * _local_11.y)) + _local_12.y));
                        if (((_local_27 >= 0) && ((_local_27 < _local_13) || (_local_13 < 0))))
                        {
                            _local_13 = _local_27;
                        }
                        _local_14++;
                    }
                    _local_15 = _local_13;
                    _local_16 = new Vector3d(_local_8.x, _local_8.y, _local_15);
                    _local_16 = Vector3d.sum(_local_16, Vector3d.product(_local_12, 0.5));
                    _local_16 = Vector3d.sum(_local_16, Vector3d.product(_local_11, -0.5));
                    _local_17 = ((this.wallHeight + Math.min(MAX_WALL_ADDITIONAL_HEIGHT, this.floorHeight)) - _local_13);
                    _local_18 = Vector3d.product(_local_11, -(_local_10));
                    _local_19 = new Vector3d(0, 0, _local_17);
                    _local_16 = Vector3d.dif(_local_16, _local_18);
                    _local_20 = this.resolveOriginalWallIndex(_local_8, k.getEndPoint(_local_7), _arg_2);
                    if (_local_20 >= 0)
                    {
                        _local_5 = _arg_2.getDirection(((_local_20 + 1) % _local_4));
                        _local_6 = _arg_2.getDirection((((_local_20 - 1) + _local_4) % _local_4));
                    }
                    else
                    {
                        _local_5 = k.getDirection(((_local_7 + 1) % _local_3));
                        _local_6 = k.getDirection((((_local_7 - 1) + _local_3) % _local_3));
                    }
                    _local_21 = null;
                    if ((((_local_5 - _local_9) + 4) % 4) == 3)
                    {
                        _local_21 = RoomWallData._Str_5543[_local_5];
                    }
                    else
                    {
                        if ((((_local_9 - _local_6) + 4) % 4) == 3)
                        {
                            _local_21 = RoomWallData._Str_5543[_local_6];
                        }
                    }
                    _local_22 = k.getLeftTurn(_local_7);
                    _local_23 = k.getLeftTurn((((_local_7 - 1) + _local_3) % _local_3));
                    _local_24 = k.getHideWall(((_local_7 + 1) % _local_3));
                    _local_25 = k.getManuallyLeftCut(_local_7);
                    _local_26 = k.getManuallyRightCut(_local_7);
                    this._Str_17862(_local_16, _local_18, _local_19, _local_21, ((!(_local_23)) || (_local_25)), ((!(_local_22)) || (_local_26)), (!(_local_24)));
                }
                _local_7++;
            }
        }

        private function createWallPlanes():Boolean
        {
            var _local_13:int;
            var _local_14:int;
            var k:Array = this._tileMatrix;
            if (k == null)
            {
                return false;
            }
            var _local_2:int;
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int = k.length;
            var _local_6:int;
            if (_local_5 == 0)
            {
                return false;
            }
            _local_2 = 0;
            while (_local_2 < _local_5)
            {
                _local_4 = (k[_local_2] as Array);
                if (((_local_4 == null) || (_local_4.length == 0)))
                {
                    return false;
                }
                if (_local_6 > 0)
                {
                    _local_6 = Math.min(_local_6, _local_4.length);
                }
                else
                {
                    _local_6 = _local_4.length;
                }
                _local_2++;
            }
            var _local_7:Number = Math.min(MAX_WALL_ADDITIONAL_HEIGHT, ((this._fixedWallHeight != -1) ? this._fixedWallHeight : getFloorHeight(k)));
            var _local_8:int = this.minX;
            var _local_9:int = this.minY;
            _local_9 = this.minY;
            while (_local_9 <= this.maxY)
            {
                if (this.getTileHeightInternal(_local_8, _local_9) > TILE_HOLE)
                {
                    _local_9--;
                    break;
                }
                _local_9++;
            }
            if (_local_9 > this.maxY)
            {
                return false;
            }
            var _local_10:Point = new Point(_local_8, _local_9);
            var _local_11:RoomWallData = this.generateWallData(_local_10, true);
            var _local_12:RoomWallData = this.generateWallData(_local_10, false);
            if (_local_11 != null)
            {
                _local_13 = _local_11.count;
                _local_14 = _local_12.count;
                this.checkWallHiding(_local_11, _local_12);
                this.addWalls(_local_11, _local_12);
            }
            _local_3 = 0;
            while (_local_3 < this.tileMapHeight)
            {
                _local_2 = 0;
                while (_local_2 < this.tileMapWidth)
                {
                    if (this.getTileHeightInternal(_local_2, _local_3) < 0)
                    {
                        this._Str_3982(_local_2, _local_3, -(_local_7 + this.wallHeight));
                    }
                    _local_2++;
                }
                _local_3++;
            }
            return true;
        }

        private function extractTopWall(k:Point, _arg_2:Boolean):Point
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:int = 1;
            var _local_4:int = TILE_HOLE;
            if (!_arg_2)
            {
                _local_4 = TILE_BLOCKED;
            }
            while (_local_3 < 1000)
            {
                if (this.getTileHeightInternal((k.x + _local_3), k.y) > _local_4)
                {
                    return new Point(((k.x + _local_3) - 1), k.y);
                }
                if (this.getTileHeightInternal((k.x + _local_3), (k.y + 1)) <= _local_4)
                {
                    return new Point((k.x + _local_3), (k.y + 1));
                }
                _local_3++;
            }
            return null;
        }

        private function extractRightWall(k:Point, _arg_2:Boolean):Point
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:int = 1;
            var _local_4:int = TILE_HOLE;
            if (!_arg_2)
            {
                _local_4 = TILE_BLOCKED;
            }
            while (_local_3 < 1000)
            {
                if (this.getTileHeightInternal(k.x, (k.y + _local_3)) > _local_4)
                {
                    return new Point(k.x, (k.y + (_local_3 - 1)));
                }
                if (this.getTileHeightInternal((k.x - 1), (k.y + _local_3)) <= _local_4)
                {
                    return new Point((k.x - 1), (k.y + _local_3));
                }
                _local_3++;
            }
            return null;
        }

        private function extractBottomWall(k:Point, _arg_2:Boolean):Point
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:int = 1;
            var _local_4:int = TILE_HOLE;
            if (!_arg_2)
            {
                _local_4 = TILE_BLOCKED;
            }
            while (_local_3 < 1000)
            {
                if (this.getTileHeightInternal((k.x - _local_3), k.y) > _local_4)
                {
                    return new Point((k.x - (_local_3 - 1)), k.y);
                }
                if (this.getTileHeightInternal((k.x - _local_3), (k.y - 1)) <= _local_4)
                {
                    return new Point((k.x - _local_3), (k.y - 1));
                }
                _local_3++;
            }
            return null;
        }

        private function extractLeftWall(k:Point, _arg_2:Boolean):Point
        {
            if (k == null)
            {
                return null;
            }
            var _local_3:int = 1;
            var _local_4:int = TILE_HOLE;
            if (!_arg_2)
            {
                _local_4 = TILE_BLOCKED;
            }
            while (_local_3 < 1000)
            {
                if (this.getTileHeightInternal(k.x, (k.y - _local_3)) > _local_4)
                {
                    return new Point(k.x, (k.y - (_local_3 - 1)));
                }
                if (this.getTileHeightInternal((k.x + 1), (k.y - _local_3)) <= _local_4)
                {
                    return new Point((k.x + 1), (k.y - _local_3));
                }
                _local_3++;
            }
            return null;
        }

        private function _Str_17862(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void
        {
            var _local_12:Vector3d;
            this._Str_3453(RoomPlaneData.PLANE_WALL, k, _arg_2, _arg_3, [_arg_4]);
            this._Str_3453(RoomPlaneData.PLANE_LANDSCAPE, k, _arg_2, _arg_3, [_arg_4]);
            var _local_8:Number = (WALL_THICKNESS * this._wallThicknessMultiplier);
            var _local_9:Number = (FLOOR_THICKNESS * this._floorThicknessMultiplier);
            var _local_10:Vector3d = Vector3d.crossProduct(_arg_2, _arg_3);
            var _local_11:Vector3d = Vector3d.product(_local_10, ((1 / _local_10.length) * -(_local_8)));
            this._Str_3453(RoomPlaneData.PLANE_WALL, Vector3d.sum(k, _arg_3), _arg_2, _local_11, [_local_10, _arg_4]);
            if (_arg_5)
            {
                this._Str_3453(RoomPlaneData.PLANE_WALL, Vector3d.sum(Vector3d.sum(k, _arg_2), _arg_3), Vector3d.product(_arg_3, (-(_arg_3.length + _local_9) / _arg_3.length)), _local_11, [_local_10, _arg_4]);
            }
            if (_arg_6)
            {
                this._Str_3453(RoomPlaneData.PLANE_WALL, Vector3d.sum(k, Vector3d.product(_arg_3, (-(_local_9) / _arg_3.length))), Vector3d.product(_arg_3, ((_arg_3.length + _local_9) / _arg_3.length)), _local_11, [_local_10, _arg_4]);
                if (_arg_7)
                {
                    _local_12 = Vector3d.product(_arg_2, (_local_8 / _arg_2.length));
                    this._Str_3453(RoomPlaneData.PLANE_WALL, Vector3d.sum(Vector3d.sum(k, _arg_3), Vector3d.product(_local_12, -1)), _local_12, _local_11, [_local_10, _arg_2, _arg_4]);
                }
            }
        }

        private function addFloor(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):void
        {
            var _local_9:Number;
            var _local_10:Vector3d;
            var _local_11:Vector3d;
            var _local_8:RoomPlaneData = this._Str_3453(RoomPlaneData.PLANE_FLOOR, k, _arg_2, _arg_3);
            if (_local_8 != null)
            {
                _local_9 = (FLOOR_THICKNESS * this._floorThicknessMultiplier);
                _local_10 = new Vector3d(0, 0, _local_9);
                _local_11 = Vector3d.dif(k, _local_10);
                if (_arg_6)
                {
                    this._Str_3453(RoomPlaneData.PLANE_FLOOR, _local_11, _arg_2, _local_10);
                }
                if (_arg_7)
                {
                    this._Str_3453(RoomPlaneData.PLANE_FLOOR, Vector3d.sum(_local_11, Vector3d.sum(_arg_2, _arg_3)), Vector3d.product(_arg_2, -1), _local_10);
                }
                if (_arg_4)
                {
                    this._Str_3453(RoomPlaneData.PLANE_FLOOR, Vector3d.sum(_local_11, _arg_3), Vector3d.product(_arg_3, -1), _local_10);
                }
                if (_arg_5)
                {
                    this._Str_3453(RoomPlaneData.PLANE_FLOOR, Vector3d.sum(_local_11, _arg_2), _arg_3, _local_10);
                }
            }
        }

        public function initializeFromXML(k:XML):Boolean
        {
            var _local_8:XML;
            var _local_9:XMLList;
            var _local_10:int;
            var _local_11:XML;
            var _local_12:Number;
            var _local_13:XML;
            var _local_14:XMLList;
            var _local_15:int;
            var _local_16:XML;
            if (k == null)
            {
                return false;
            }
            this.reset();
            this.resetFloorHoles();
            if (!XMLValidator.checkRequiredAttributes(k.tileMap[0], ["width", "height", "wallHeight"]))
            {
                return false;
            }
            var _local_2:int = parseInt(k.tileMap.@width);
            var _local_3:int = parseInt(k.tileMap.@height);
            var _local_4:Number = parseFloat(k.tileMap.@wallHeight);
            var _local_5:int = parseInt(k.tileMap.@fixedWallsHeight);
            this.initializeTileMap(_local_2, _local_3);
            var _local_6:XMLList = k.tileMap.tileRow;
            var _local_7:int;
            while (_local_7 < _local_6.length())
            {
                _local_8 = _local_6[_local_7];
                _local_9 = _local_8.tile;
                _local_10 = 0;
                while (_local_10 < _local_9.length())
                {
                    _local_11 = _local_9[_local_10];
                    _local_12 = parseFloat(_local_11.@height);
                    this._Str_3982(_local_10, _local_7, _local_12);
                    _local_10++;
                }
                _local_7++;
            }
            if (k.holeMap.length() > 0)
            {
                _local_13 = k.holeMap[0];
                _local_14 = _local_13.hole;
                _local_15 = 0;
                while (_local_15 < _local_14.length())
                {
                    _local_16 = _local_14[_local_15];
                    if (XMLValidator.checkRequiredAttributes(_local_16, ["id", "x", "y", "width", "height"]))
                    {
                        this.addFloorHole(_local_16.@id, _local_16.@x, _local_16.@y, _local_16.@width, _local_16.@height);
                    }
                    _local_15++;
                }
                this.initializeHoleMap();
            }
            this.wallHeight = _local_4;
            this.initializeFromTileData(_local_5);
            return true;
        }

        private function _Str_3453(k:int, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Array=null):RoomPlaneData
        {
            if (((_arg_3.length == 0) || (_arg_4.length == 0)))
            {
                return null;
            }
            var _local_6:RoomPlaneData = new RoomPlaneData(k, _arg_2, _arg_3, _arg_4, _arg_5);
            this._planes.push(_local_6);
            return _local_6;
        }

        public function _Str_5598():XML
        {
            var _local_7:XML;
            var _local_8:Array;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:XML;
            var _local_12:RoomFloorHole;
            var _local_13:int;
            var _local_14:XML;
            var k:XML = new (XML)((((((((('<tileMap width="' + this._width) + '" height="') + this._height) + '" wallHeight="') + this._wallHeight) + '" fixedWallsHeight="') + this._fixedWallHeight) + '"/>'));
            var _local_2:int;
            while (_local_2 < this._height)
            {
                _local_7 = <tileRow/>
                ;
                _local_8 = this._tileMatrixOriginal[_local_2];
                _local_9 = 0;
                while (_local_9 < this._width)
                {
                    _local_10 = _local_8[_local_9];
                    _local_11 = new (XML)((('<tile height="' + _local_10) + '"/>'));
                    _local_7.appendChild(_local_11);
                    _local_9++;
                }
                k.appendChild(_local_7);
                _local_2++;
            }
            var _local_3:XML = <holeMap/>
            ;
            var _local_4:int;
            while (_local_4 < this._floorHoles.length)
            {
                _local_12 = this._floorHoles.getWithIndex(_local_4);
                if (_local_12 != null)
                {
                    _local_13 = this._floorHoles.getKey(_local_4);
                    _local_14 = new (XML)((((((((((('<hole id="' + _local_13) + '" x="') + _local_12.x) + '" y="') + _local_12.y) + '" width="') + _local_12.width) + '" height="') + _local_12.height) + '"/>'));
                    _local_3.appendChild(_local_14);
                }
                _local_4++;
            }
            var _local_5:XML = <roomData/>
            ;
            _local_5.appendChild(k);
            _local_5.appendChild(_local_3);
            var _local_6:XML = new (XML)((((((((('<dimensions minX="' + this.minX) + '" maxX="') + this.maxX) + '" minY="') + this.minY) + '" maxY="') + this.maxY) + '"/>'));
            _local_5.appendChild(_local_6);
            return _local_5;
        }

        public function getPlaneLocation(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2.loc;
            }
            return null;
        }

        public function getPlaneNormal(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2.normal;
            }
            return null;
        }

        public function getPlaneLeftSide(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2._Str_5424;
            }
            return null;
        }

        public function getPlaneRightSide(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2._Str_4968;
            }
            return null;
        }

        public function getPlaneNormalDirection(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2.normalDirection;
            }
            return null;
        }

        public function getPlaneSecondaryNormals(k:int):Array
        {
            var _local_3:Array;
            var _local_4:int;
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return null;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                _local_3 = [];
                _local_4 = 0;
                while (_local_4 < _local_2.secondaryNormalCount)
                {
                    _local_3.push(_local_2.getSecondaryNormal(_local_4));
                    _local_4++;
                }
                return _local_3;
            }
            return null;
        }

        public function getPlaneType(k:int):int
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return RoomPlaneData.PLANE_UNDEFINED;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2.type;
            }
            return RoomPlaneData.PLANE_UNDEFINED;
        }

        public function getPlaneMaskCount(k:int):int
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return 0;
            }
            var _local_2:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_2 != null)
            {
                return _local_2._Str_6845;
            }
            return 0;
        }

        public function getPlaneMaskLeftSideLoc(k:int, _arg_2:int):Number
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return -1;
            }
            var _local_3:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_3 != null)
            {
                return _local_3.getMaskLeftSideLoc(_arg_2);
            }
            return -1;
        }

        public function getPlaneMaskRightSideLoc(k:int, _arg_2:int):Number
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return -1;
            }
            var _local_3:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_3 != null)
            {
                return _local_3.getMaskRightSideLoc(_arg_2);
            }
            return -1;
        }

        public function getPlaneMaskLeftSideLength(k:int, _arg_2:int):Number
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return -1;
            }
            var _local_3:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_3 != null)
            {
                return _local_3.getMaskLeftSideLength(_arg_2);
            }
            return -1;
        }

        public function getPlaneMaskRightSideLength(k:int, _arg_2:int):Number
        {
            if (((k < 0) || (k >= this._Str_3828)))
            {
                return -1;
            }
            var _local_3:RoomPlaneData = (this._planes[k] as RoomPlaneData);
            if (_local_3 != null)
            {
                return _local_3.getMaskRightSideLength(_arg_2);
            }
            return -1;
        }

        public function addFloorHole(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            this.removeFloorHole(k);
            var _local_6:RoomFloorHole = new RoomFloorHole(_arg_2, _arg_3, _arg_4, _arg_5);
            this._floorHoles.add(k, _local_6);
        }

        public function removeFloorHole(k:int):void
        {
            this._floorHoles.remove(k);
        }

        public function resetFloorHoles():void
        {
            this._floorHoles.reset();
        }

        private function initializeHoleMap():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:Array;
            var _local_5:RoomFloorHole;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            _local_2 = 0;
            while (_local_2 < this._height)
            {
                _local_3 = this._floorHoleMatrix[_local_2];
                k = 0;
                while (k < this._width)
                {
                    _local_3[k] = false;
                    k++;
                }
                _local_2++;
            }
            var _local_4:int;
            while (_local_4 < this._floorHoles.length)
            {
                _local_5 = this._floorHoles.getWithIndex(_local_4);
                if (_local_5 != null)
                {
                    _local_6 = _local_5.x;
                    _local_7 = ((_local_5.x + _local_5.width) - 1);
                    _local_8 = _local_5.y;
                    _local_9 = ((_local_5.y + _local_5.height) - 1);
                    _local_6 = ((_local_6 < 0) ? 0 : _local_6);
                    _local_7 = ((_local_7 >= this._width) ? (this._width - 1) : _local_7);
                    _local_8 = ((_local_8 < 0) ? 0 : _local_8);
                    _local_9 = ((_local_9 >= this._height) ? (this._height - 1) : _local_9);
                    _local_2 = _local_8;
                    while (_local_2 <= _local_9)
                    {
                        _local_3 = this._floorHoleMatrix[_local_2];
                        k = _local_6;
                        while (k <= _local_7)
                        {
                            _local_3[k] = true;
                            k++;
                        }
                        _local_2++;
                    }
                }
                _local_4++;
            }
        }

        private function extractPlanes(k:Vector.<Vector.<int>>):void
        {
            var _local_2:uint;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Boolean;
            var _local_12:Boolean;
            var _local_13:Boolean;
            var _local_14:Boolean;
            var _local_15:int;
            var _local_16:int;
            var _local_17:Boolean;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            _local_2 = k.length;
            var _local_3:uint = k[0].length;
            var _local_4:Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>(_local_2);
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_4[_local_5] = new Vector.<Boolean>(_local_3);
                _local_5++;
            }
            var _local_6:int;
            while (_local_6 < _local_2)
            {
                _local_7 = 0;
                while (_local_7 < _local_3)
                {
                    _local_8 = k[_local_6][_local_7];
                    if (((_local_8 < 0) || (_local_4[_local_6][_local_7])))
                    {
                    }
                    else
                    {
                        _local_11 = ((_local_7 == 0) || (!(k[_local_6][(_local_7 - 1)] == _local_8)));
                        _local_12 = ((_local_6 == 0) || (!(k[(_local_6 - 1)][_local_7] == _local_8)));
                        _local_9 = (_local_7 + 1);
                        while (_local_9 < _local_3)
                        {
                            if ((((!(k[_local_6][_local_9] == _local_8)) || (_local_4[_local_6][_local_9])) || ((_local_6 > 0) && ((k[(_local_6 - 1)][_local_9] == _local_8) == _local_12))))
                            {
                                break;
                            }
                            _local_9++;
                        }
                        _local_13 = ((_local_9 == _local_3) || (!(k[_local_6][_local_9] == _local_8)));
                        _local_17 = false;
                        _local_10 = (_local_6 + 1);
                        while (((_local_10 < _local_2) && (!(_local_17))))
                        {
                            _local_14 = (!(k[_local_10][_local_7] == _local_8));
                            _local_17 = (((_local_14) || ((_local_7 > 0) && ((k[_local_10][(_local_7 - 1)] == _local_8) == _local_11))) || ((_local_9 < _local_3) && ((k[_local_10][_local_9] == _local_8) == _local_13)));
                            _local_15 = _local_7;
                            while (_local_15 < _local_9)
                            {
                                if ((k[_local_10][_local_15] == _local_8) == _local_14)
                                {
                                    _local_17 = true;
                                    _local_9 = _local_15;
                                    break;
                                }
                                _local_15++;
                            }
                            if (_local_17)
                            {
                                break;
                            }
                            _local_10++;
                        }
                        _local_14 = ((_local_14) || (_local_10 == _local_2));
                        _local_13 = ((_local_9 == _local_3) || (!(k[_local_6][_local_9] == _local_8)));
                        _local_16 = _local_6;
                        while (_local_16 < _local_10)
                        {
                            _local_15 = _local_7;
                            while (_local_15 < _local_9)
                            {
                                _local_4[_local_16][_local_15] = true;
                                _local_15++;
                            }
                            _local_16++;
                        }
                        _local_18 = ((_local_7 / 4) - 0.5);
                        _local_19 = ((_local_6 / 4) - 0.5);
                        _local_20 = ((_local_9 - _local_7) / 4);
                        _local_21 = ((_local_10 - _local_6) / 4);
                        this.addFloor(new Vector3d((_local_18 + _local_20), (_local_19 + _local_21), (_local_8 / 4)), new Vector3d(-(_local_20), 0, 0), new Vector3d(0, -(_local_21), 0), _local_13, _local_11, _local_14, _local_12);
                    }
                    _local_7++;
                }
                _local_6++;
            }
        }
    }
}
