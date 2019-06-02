package com.sulake.habbo.room.object
{
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class RoomWallData 
    {
        public static var _Str_5077:Array = [];
        public static var _Str_5543:Array = [];

        private var _corners:Array;
        private var _endPoints:Array;
        private var _directions:Array;
        private var _lengths:Array;
        private var _leftTurns:Array;
        private var _borders:Array;
        private var _hideWalls:Array;
        private var _manuallyLeftCut:Array;
        private var _manuallyRightCut:Array;
        private var _addDuplicates:Boolean = false;
        private var _count:int = 0;

        {
            _Str_5077.push(new Vector3d(1, 0, 0));
            _Str_5077.push(new Vector3d(0, 1, 0));
            _Str_5077.push(new Vector3d(-1, 0, 0));
            _Str_5077.push(new Vector3d(0, -1, 0));
            _Str_5543.push(new Vector3d(0, 1, 0));
            _Str_5543.push(new Vector3d(-1, 0, 0));
            _Str_5543.push(new Vector3d(0, -1, 0));
            _Str_5543.push(new Vector3d(1, 0, 0));
        }

        public function RoomWallData()
        {
            this._corners = [];
            this._endPoints = [];
            this._directions = [];
            this._lengths = [];
            this._leftTurns = [];
            this._borders = [];
            this._hideWalls = [];
            this._manuallyLeftCut = [];
            this._manuallyRightCut = [];
            super();
        }

        public function _Str_17862(k:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):void
        {
            if (((this._addDuplicates) || (this.checkIsNotDuplicate(k, _arg_2, _arg_3, _arg_4, _arg_5))))
            {
                this._corners.push(k);
                this._directions.push(_arg_2);
                this._lengths.push(_arg_3);
                this._borders.push(_arg_4);
                this._leftTurns.push(_arg_5);
                this._hideWalls.push(false);
                this._manuallyLeftCut.push(false);
                this._manuallyRightCut.push(false);
                this._count++;
            }
        }

        private function checkIsNotDuplicate(k:Point, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:Boolean):Boolean
        {
            var _local_6:int;
            while (_local_6 < this._count)
            {
                if (((((((this._corners[_local_6].x == k.x) && (this._corners[_local_6].y == k.y)) && (this._directions[_local_6] == _arg_2)) && (this._lengths[_local_6] == _arg_3)) && (this._borders[_local_6] == _arg_4)) && (this._leftTurns[_local_6] == _arg_5)))
                {
                    return false;
                }
                _local_6++;
            }
            return true;
        }

        public function get count():int
        {
            return this._count;
        }

        public function getCorner(k:int):Point
        {
            return this._corners[k];
        }

        public function getEndPoint(k:int):Point
        {
            this.calculateWallEndPoints();
            return this._endPoints[k];
        }

        public function getLength(k:int):int
        {
            return this._lengths[k];
        }

        public function getDirection(k:int):int
        {
            return this._directions[k];
        }

        public function getBorder(k:int):Boolean
        {
            return this._borders[k];
        }

        public function getHideWall(k:int):Boolean
        {
            return this._hideWalls[k];
        }

        public function getLeftTurn(k:int):Boolean
        {
            return this._leftTurns[k];
        }

        public function getManuallyLeftCut(k:int):Boolean
        {
            return this._manuallyLeftCut[k];
        }

        public function getManuallyRightCut(k:int):Boolean
        {
            return this._manuallyRightCut[k];
        }

        public function setHideWall(k:int, _arg_2:Boolean):void
        {
            this._hideWalls[k] = _arg_2;
        }

        public function setLength(k:int, _arg_2:int):void
        {
            if (_arg_2 < this._lengths[k])
            {
                this._lengths[k] = _arg_2;
                this._manuallyRightCut[k] = true;
            }
        }

        public function moveCorner(k:int, _arg_2:int):void
        {
            var _local_3:IVector3d;
            if (((_arg_2 > 0) && (_arg_2 < this._lengths[k])))
            {
                _local_3 = _Str_5077[this.getDirection(k)];
                this._corners[k] = this._corners[k].add(new Point((_arg_2 * _local_3.x), (_arg_2 * _local_3.y)));
                this._lengths[k] = (this._lengths[k] - _arg_2);
                this._manuallyLeftCut[k] = true;
            }
        }

        private function calculateWallEndPoints():void
        {
            var k:int;
            var _local_2:Point;
            var _local_3:Point;
            var _local_4:IVector3d;
            var _local_5:int;
            if (this._endPoints.length != this.count)
            {
                this._endPoints = [];
                k = 0;
                while (k < this.count)
                {
                    _local_2 = this.getCorner(k);
                    _local_3 = new Point(_local_2.x, _local_2.y);
                    _local_4 = RoomWallData._Str_5077[this.getDirection(k)];
                    _local_5 = this.getLength(k);
                    _local_3.x = (_local_3.x + (_local_4.x * _local_5));
                    _local_3.y = (_local_3.y + (_local_4.y * _local_5));
                    this._endPoints.push(_local_3);
                    k++;
                }
            }
        }
    }
}
